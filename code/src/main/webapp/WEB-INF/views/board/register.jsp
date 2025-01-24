<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가게 등록</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7fc;
        }

        .register-container {
            max-width: 600px;
            margin: 50px auto;
            background: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
    </style>
    <!-- Google Maps API 키 추가 (유효한 키로 교체하세요) -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxtdZqbdS6d0jR-vYVhQOtICdiDXq8S_A&libraries=places&callback=initAutocomplete" async defer></script>
    <script>
        // Google Places API 주소 자동 완성 초기화
        function initAutocomplete() {
            // storeLocation 입력 필드에 자동완성 기능을 설정합니다.
            var autocomplete = new google.maps.places.Autocomplete(document.getElementById('storeLocation'), {types: ['geocode']});
            
            // 주소 선택 후 이벤트 처리
            autocomplete.addListener('place_changed', function() {
                var place = autocomplete.getPlace();
                if (!place.geometry) {
                    return;
                }
                // 선택된 주소를 storeLocation 입력 필드에 자동으로 채웁니다.
                document.getElementById('storeLocation').value = place.formatted_address;
            });
        }
    </script>
</head>
<body>
    <div class="register-container">
        <h2 class="text-center">가게 등록</h2>
        <form action="/store/register" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="storeName" class="form-label">가게 이름</label>
                <input type="text" class="form-control" id="storeName" name="storeName" required>
            </div>

            <div class="mb-3">
                <label for="storeLocation" class="form-label">가게 위치</label>
                <input type="text" class="form-control" id="storeLocation" name="storeLocation" required>
            </div>

            <div class="mb-3">
                <label for="storeDescription" class="form-label">가게 설명</label>
                <textarea class="form-control" id="storeDescription" name="storeDescription" rows="3" required></textarea>
            </div>

            <div class="mb-3">
                <label for="storeType" class="form-label">종류</label>
                <select class="form-control" id="storeType" name="storeType" required>
                    <option value="">선택하세요</option>
                    <option value="한식">한식</option>
                    <option value="양식">양식</option>
                    <option value="중식">중식</option>
                    <option value="일식">일식</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="storePhone" class="form-label">전화번호</label>
                <input type="tel" class="form-control" id="storePhone" name="storePhone" required placeholder="01012345678" pattern="^[0-9]{10,11}$" title="전화번호는 숫자만 입력해주세요.">
                <small class="form-text text-muted">전화번호는 하이픈 없이 숫자만 입력해주세요.</small>
            </div>

            <div class="mb-3">
                <label for="storeImage" class="form-label">가게 사진</label>
                <input type="file" class="form-control" id="storeImage" name="storeImage" accept="image/*" required>
                <small class="form-text text-muted">이미지 파일만 업로드 가능합니다.</small>
            </div>

            <button type="submit" class="btn btn-primary w-100">등록하기</button>
        </form>
    </div>

    <footer>
        <p>&copy; 2025 YourCompany. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
