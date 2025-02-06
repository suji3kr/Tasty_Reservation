<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">

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
        
        .map-btn {
        	padding: 5px 0;
        	border: none;
        	border-radius: 5px;
        	width: 85px; 
        	height: 40px;
        	margin: auto;
        	background: #95bb46;
        	color: #fff;
        	font-weight: bold;
        }
        
        .resigter-btn {
        	width: 100%;
        	height: 50px;
        	border: none;
        	border-radius: 15px;
        	background: #95bb46;
        	color: #fff;
        	font-weight: bold;
        }
        
    </style>
    <!-- Google Maps API 키 추가 (유효한 키로 교체하세요) -->
    <!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxtdZqbdS6d0jR-vYVhQOtICdiDXq8S_A&libraries=places&callback=initAutocomplete" async defer></script> -->
    
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
            <div class="input-group">
                <input type="text" class="form-control" id="storeLocation" name="storeLocation" required>
                <button type="button" class="map-btn" data-bs-toggle="modal" data-bs-target="#mapModal">지도 보기</button>
            </div>
        </div>

        <div class="mb-3">
            <label for="storeDescription" class="form-label">가게 설명</label>
            <textarea class="form-control" id="storeDescription" name="storeDescription" rows="3" required></textarea>
        </div>

        <div class="mb-3">
            <label for="storeCategory" class="form-label">종류</label>
            <select class="form-control" id="storeCategory" name="storeCategory" required>
                <option value="">선택하세요</option>
                <option value="한식">한식</option>
                <option value="양식">양식</option>
                <option value="중식">중식</option>
                <option value="일식">일식</option>
                <option value="디저트/카페">디저트/카페</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="phoneNumber" class="form-label">전화번호</label>
            <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" required placeholder="01012345678" pattern="^[0-9]{10,11}$" title="전화번호는 10-11자 숫자만 입력해주세요.">
            <small class="form-text text-muted">전화번호는 하이픈 없이 숫자만 입력해주세요.</small>
        </div>

       <div class="mb-3">
    	<label for="storeImage" class="form-label">가게 사진</label>
	    <input type="file" class="form-control" id="storeImage" name="storeImage" accept="image/png, image/jpeg, image/jpg, image/gif, image/webp" required>
	    <small class="form-text text-muted">이미지 파일(.jpg, .jpeg, .png, .gif, .webp)만 업로드 가능합니다.</small>
	</div>
	
		<script>
		    document.getElementById("storeImage").addEventListener("change", function() {
		        const file = this.files[0];
		        if (file) {
		            const allowedExtensions = ["image/png", "image/jpeg", "image/jpg", "image/gif", "image/webp"];
		            if (!allowedExtensions.includes(file.type)) {
		                alert("이미지 파일(.jpg, .jpeg, .png, .gif, .webp)만 업로드 가능합니다.");
		                this.value = ""; // 파일 입력 초기화
		            }
		        }
		    });
		</script>

        <button type="submit" class="resigter-btn">등록하기</button>
    </form>
</div>

<!-- 지도 모달 -->
<div class="modal fade" id="mapModal" tabindex="-1" aria-labelledby="mapModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="mapModalLabel">위치 선택</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 검색 입력창 + 검색 버튼 -->
                <div class="input-group mb-2">
                    <input id="locationSearch" class="form-control" type="text" placeholder="주소 또는 장소 검색">
                    <button id="searchLocationBtn" class="btn btn-primary">검색</button>
                </div>
                <div id="map" style="height: 400px; width: 100%;"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="confirmLocation">확인</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<!-- Google Maps API -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxtdZqbdS6d0jR-vYVhQOtICdiDXq8S_A"></script>
<script>
    let map;
    let marker;
    const geocoder = new google.maps.Geocoder();

    document.addEventListener('DOMContentLoaded', () => {
        const mapModal = document.getElementById('mapModal');
        const storeLocationInput = document.getElementById('storeLocation');
        const confirmLocationButton = document.getElementById('confirmLocation');
        const locationSearch = document.getElementById('locationSearch');
        const searchLocationBtn = document.getElementById('searchLocationBtn');

        mapModal.addEventListener('shown.bs.modal', () => {
            if (!map) {
                map = new google.maps.Map(document.getElementById('map'), {
                    center: { lat: 37.5665, lng: 126.9780 }, // 서울 기준
                    zoom: 12,
                });

                marker = new google.maps.Marker({
                    position: { lat: 37.5665, lng: 126.9780 },
                    map: map,
                    draggable: true,
                });

                map.addListener('click', (event) => {
                    marker.setPosition(event.latLng);
                });
            }
        });

        // 검색 버튼 클릭 시 실행
        searchLocationBtn.addEventListener('click', () => {
            const address = locationSearch.value;
            if (!address) {
                alert("검색할 주소를 입력하세요.");
                return;
            }

            geocoder.geocode({ address: address }, (results, status) => {
                if (status === "OK" && results[0]) {
                    const location = results[0].geometry.location;
                    map.setCenter(location);
                    map.setZoom(15);
                    marker.setPosition(location);
                } else {
                    alert("검색 결과를 찾을 수 없습니다.");
                }
            });
        });

        // 확인 버튼 클릭 시 위치 저장
        confirmLocationButton.addEventListener('click', () => {
            if (marker) {
                const position = marker.getPosition();
                geocoder.geocode({ location: position }, (results, status) => {
                    if (status === "OK" && results[0]) {
                        storeLocationInput.value = results[0].formatted_address;
                    } else {
                        alert("주소를 가져올 수 없습니다. 다시 시도해주세요.");
                    }
                });
                const modalInstance = bootstrap.Modal.getInstance(mapModal);
                modalInstance.hide();
            }
        });
    });
</script>


<!-- AIzaSyDxtdZqbdS6d0jR-vYVhQOtICdiDXq8S_A -->
    
    <!-- <script>
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
    </script> -->
</body>
</html>
