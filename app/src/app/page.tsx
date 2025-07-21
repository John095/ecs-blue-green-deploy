'use client';

import { useState, useEffect } from 'react';

interface Post {
  id: number;
  title: string;
  content: string;
  createdAt: string;
}

export default function Home() {
  const [posts, setPosts] = useState<Post[]>([]);
  const [title, setTitle] = useState('');
  const [content, setContent] = useState('');

  useEffect(() => {
    fetch('/api/posts')
      .then((res) => res.json())
      .then((data: Post[]) => setPosts(data))
      .catch((err) => console.error(err));
  }, []);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    const res = await fetch('/api/posts', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ title, content }),
    });
    if (res.ok) {
      const newPost: Post = await res.json();
      setPosts([newPost, ...posts]);
      setTitle('');
      setContent('');
    }
  };

  console.log(posts);


  return (
    <div className="min-h-screen container mx-auto p-4">
      <h1 className="text-4xl font-bold text-center mb-8">Simple Blog</h1>

      <div className="mb-8 p-4 bg-white rounded shadow">
        <h2 className="text-2xl font-semibold mb-4">Create Post</h2>
        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-gray-700">Title</label>
            <input
              type="text"
              value={title}
              onChange={(e) => setTitle(e.target.value)}
              className="mt-1 p-2 w-full border rounded"
              required
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700">Content</label>
            <textarea
              value={content}
              onChange={(e) => setContent(e.target.value)}
              className="mt-1 p-2 w-full border rounded"
              rows={4}
              required
            />
          </div>
          <button
            type="submit"
            className="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700"
          >
            Create Post
          </button>
        </form>
      </div>

      <div className="space-y-4">
        {posts.map((post) => (
          <div key={post.id} className="p-4 bg-white rounded shadow">
            <h2 className="text-xl font-semibold">{post.title}</h2>
            <p className="text-gray-600">{post.content}</p>
            <p className="text-sm text-gray-500 mt-2">
              Posted on {new Date(post.createdAt).toLocaleDateString()}
            </p>
          </div>
        ))}
      </div>
    </div>
  );
}