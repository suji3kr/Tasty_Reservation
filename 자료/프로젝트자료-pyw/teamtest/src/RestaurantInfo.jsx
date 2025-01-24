import React from 'react';
import sushiImage from './assets/img/sushiImage.jpg'; // 초밥 이미지 import

function RestaurantInfo() {
  return (
    <div>
      <h1>초밥식당</h1>
      <img src={sushiImage} alt="초밥 사진" style={{ width: '500px' }} /> {/* 이미지 크기 조절 */}
    </div>
  );
}

export default RestaurantInfo;