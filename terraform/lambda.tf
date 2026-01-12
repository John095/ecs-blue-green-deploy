resource "aws_lambda_function" "swap_target_groups" {
  filename         = "swap_target_groups.zip"
  function_name    = "${var.project_name}-swap-target-groups"
  role            = aws_iam_role.lambda_role.arn
  handler         = "index.handler"
  runtime         = "python3.9"
  timeout         = 60

  depends_on = [data.archive_file.lambda_zip]

  tags = {
    Name = "${var.project_name}-swap-target-groups"
  }
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  output_path = "swap_target_groups.zip"
  source {
    content = <<EOF
import boto3
import json

def handler(event, context):
    elbv2 = boto3.client('elbv2')
    
    # Get listeners
    listeners = elbv2.describe_listeners(
        LoadBalancerArn='${aws_lb.main.arn}'
    )['Listeners']
    
    prod_listener = next(l for l in listeners if l['Port'] == 80)
    staging_listener = next(l for l in listeners if l['Port'] == 8080)
    
    # Get current target groups
    prod_tg_arn = prod_listener['DefaultActions'][0]['TargetGroupArn']
    staging_tg_arn = staging_listener['DefaultActions'][0]['TargetGroupArn']
    
    # Swap target groups
    elbv2.modify_listener(
        ListenerArn=prod_listener['ListenerArn'],
        DefaultActions=[{
            'Type': 'forward',
            'TargetGroupArn': staging_tg_arn
        }]
    )
    
    elbv2.modify_listener(
        ListenerArn=staging_listener['ListenerArn'],
        DefaultActions=[{
            'Type': 'forward',
            'TargetGroupArn': prod_tg_arn
        }]
    )
    
    # Update tags
    blue_tg_arn = '${aws_lb_target_group.blue.arn}'
    green_tg_arn = '${aws_lb_target_group.green.arn}'
    
    if prod_tg_arn == blue_tg_arn:
        # Blue was production, now Green is production
        elbv2.add_tags(
            ResourceArns=[green_tg_arn],
            Tags=[{'Key': 'IsProduction', 'Value': 'true'}]
        )
        elbv2.add_tags(
            ResourceArns=[blue_tg_arn],
            Tags=[{'Key': 'IsProduction', 'Value': 'false'}]
        )
    else:
        # Green was production, now Blue is production
        elbv2.add_tags(
            ResourceArns=[blue_tg_arn],
            Tags=[{'Key': 'IsProduction', 'Value': 'true'}]
        )
        elbv2.add_tags(
            ResourceArns=[green_tg_arn],
            Tags=[{'Key': 'IsProduction', 'Value': 'false'}]
        )
    
    return {
        'statusCode': 200,
        'body': json.dumps('Target groups swapped successfully')
    }
EOF
    filename = "index.py"
  }
}

resource "aws_iam_role" "lambda_role" {
  name = "${var.project_name}-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "${var.project_name}-lambda-policy"
  role = aws_iam_role.lambda_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "arn:aws:logs:*:*:*"
      },
      {
        Effect = "Allow"
        Action = [
          "elasticloadbalancing:DescribeListeners",
          "elasticloadbalancing:ModifyListener",
          "elasticloadbalancing:AddTags"
        ]
        Resource = "*"
      }
    ]
  })
}