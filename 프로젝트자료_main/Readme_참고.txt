# SpringBoot-Project-Restaurant Review Service
SpringBoot, Docker, H2 Database, AWS를 활용한 맛집 리뷰 서비스.
<br></br>

## 💻 프로젝트 소개
맛집 정보를 등록하고, 해당 맛집에 리뷰를 등록하고 조회할 수 있는 서비스 입니다.<br>
본 프로젝트는 인프런의 '쥬쥬와 함께 하루만에 시작하는 벡엔드' 강의를 참고하여 진행되었습니다.
<br></br>

## 📌 Stacks


### Environment

<img src="https://img.shields.io/badge/intellijidea-0062AD?style=for-the-badge&logo=intellijidea&logoColor=white"><img src="https://img.shields.io/badge/postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white"><img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">


### Devlopment
<img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white"><img src="https://img.shields.io/badge/docker-2496ED?style=for-the-badge&logo=docker&logoColor=white"><img src="https://img.shields.io/badge/amazonaws-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white"><img src="https://img.shields.io/badge/h2 database-777BB4?style=for-the-badge&logo=h2database&logoColor=white">

### Communication
<img src="https://img.shields.io/badge/notion-44C1C5?style=for-the-badge&logo=notion&logoColor=white">
<br></br>

## 📢 고객 요구사항
안녕하세요! 저희는 맛집 리뷰 서비스를 런칭할 예정입니다. 저희는 맛집을 관리하고 사용자들이 맛집에 방문한 이후에 리뷰를 작성해서 다른 사용자들이 맛집을 방문하기전 리뷰와 평균 별점을 확인할 수 있는 서비스가 필요합니다! 또한 맛집을 등록하고 수정하고 삭제할 수 있으며, 맛집마다 리뷰를 작성하거나 삭제하는 기능도 있었으면 좋겠습니다. 
<br>
맛집 정보에는 이름, 주소, 메뉴를 포함했으면 좋겠고, 메뉴에는 음식 이름과 가격으로 구성되었으면 좋겠습니다. 리뷰에는 리뷰 내용과 별점을 가지고 있었으면 좋겠습니다. 또한 맛집은 여러개의 메뉴와 리뷰를 가질 수 있고, 현재로서는 일단 리뷰를 메뉴별로 등록하는 기능까지는 필요 없을 것 같습니다. 감사합니다.
<br></br>

## 🔎 고객 요구사항 분석

### • Usecase

- 맛집 정보를 등록할 수 있다.
- 맛집 정보를 수정할 수 있다.
- 맛집 정보를 삭제할 수 있다.
- 맛집의 리뷰를 작성할 수 있다.
- 맛집의 리뷰를 삭제할 수 있다.
- 맛집에 등록된 리뷰와 평균 별점을 확인할 수 있다.

### • 데이터

- 맛집
  - 이름 (String)
  - 주소 (String)
  - N개의 메뉴
    - 이름 (String)
    - 가격 (Int)
  - N개의 리뷰
    - 내용 (String)
    - 별점 (Int)

### • ERD 도출

![ERD](./images/ERD.png)

### • API 스펙

 - 맛집 리스트 가져오기 API
   ``` 
   GET /restaurants
       
   // response
    {
      {
        "id": Long,
        "name": string,
        "address": string,
        "createdAt": string,
        "updatedAt": string
      },
      ...
    } 
     ```
 - 맛집 정보 가져오기 API
   ```
   GET /restaurant/{restaurantId}

   // response
   {
     "id": Long,
     "name": string,
     "address": string,
     "createdAt": string,
     "updatedAt": string,
     "menus": [
       {"id": Long, "name": string, "price": int, "createdAt": string, "updatedAt": string},
       {"id": Long, "name": string, "price": int, "createdAt": string, "updatedAt": string},
       ...
      ]
   }
   ```
 -  맛집 정보 생성 API
   ```
   POST /restaurant

   {
     "name": string,
     "address": string,
     "menus": [
       {"name": string, "price": int},
       ...
      ]
    }
   ```
 - 맛집 정보 수정 API 
   ```
   PUT /restaurant/{restaurantId}
   
   {
     "name": string,
     "address": string,
     "menus": [
       {"name": string, "price": int},
       ...
      ]
   }
   ```
 - 맛집 정보 삭제 API  
   ```
   DELETE /restaurant/{restaurantId}
   ```
 - 리뷰 작성 API 
   ```
   POST /review
    
    {
      "restaurantId": int,
      "content": string,
      "score": float
    }
   ```
 - 리뷰 삭제 API
   ```
   DELETE /review/{reviewId}
   ```
 - 맛집에 등록된 리뷰 조회 API
   ```
   GET /restaurant/{restaurantId}/reviews

   // response
   {
     "avgScore": double, // 평균 별점
     "reviews": [
       {"id": int, "content": string, "score": double, "createdAt": string},
       {"id": int, "content": string, "score": double, "createdAt": string},
       {"id": int, "content": string, "score": double, "createdAt": string}
     ],
     "page": {
       "offset": int,
       "limit": int
     }
   }
   ```
   








 


