import React from 'react';

function Review({ author, rating, content }) {
  const stars = [];
  for (let i = 0; i < 5; i++) {
    stars.push(<span key={i}>{i < rating ? '★' : '☆'}</span>);
  }

  return (
    <div>
      <h3>{author}</h3>
      <div>{stars}</div>
      <p>{content}</p>
    </div>
  );
}

export default Review;