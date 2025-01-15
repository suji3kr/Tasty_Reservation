import React from 'react';
import Review from './Review';

function ReviewList() {
  const reviews = [
    { author: 'Sam', rating: 5, content: '' },
    { author: 'Risa', rating: 1, content: '' },
  ];

  return (
    <div>
      <h2>리뷰</h2>
      {reviews.map((review, index) => (
        <Review key={index} {...review} />
      ))}
    </div>
  );
}

export default ReviewList;