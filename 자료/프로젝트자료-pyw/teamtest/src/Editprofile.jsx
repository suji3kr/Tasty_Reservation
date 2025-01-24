import React, { useState } from 'react';

function EditProfile() {
  const [name, setName] = useState('홍길동');
  const [password, setPassword] = useState('');
  const [address, setAddress] = useState('');
  const [detailAddress, setDetailAddress] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    // 폼 제출 로직 (예: API 호출)
    console.log('제출된 정보:', { password });
    alert('정보가 수정되었습니다.');
  };

  return (
    <div>
      <h1>나의 정보 수정하기</h1>
      <form onSubmit={handleSubmit}>
        <div>
          <label htmlFor="name">성함:</label>
          <input
            type="text"
            id="name"
            value={name}
            onChange={(e) => setName(e.target.value)}
            readOnly
          />
        </div>
        <div>
          <label htmlFor="id">아이디:</label>
          <input type="text" id="id" value="UNIQUE (변경 불가능)" readOnly />
        </div>
        <div>
          <label htmlFor="password">비밀번호:</label>
          <input
            type="password"
            id="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </div>
        <div>
          <label htmlFor="address">주소:</label>
          <input
            type="text"
            id="address"
            value={address}
            onChange={(e) => setAddress(e.target.value)}
            readOnly
          />
        </div>
        <div>
          <label htmlFor="detailAddress">상세 주소:</label>
          <input
            type="text"
            id="detailAddress"
            value={detailAddress}
            onChange={(e) => setDetailAddress(e.target.value)}
            readOnly
          />
        </div>
        <button type="submit">저장</button>
      </form>
    </div>
  );
}

export default EditProfile;