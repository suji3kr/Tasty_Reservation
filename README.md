### *Art Of Reservation*

-------------------------------
<br>



![image](https://github.com/user-attachments/assets/a26092ee-786e-4862-b3af-2b141b0abdb2)




>filter기능 구현 예정 폼
![image](https://github.com/user-attachments/assets/74304ecf-3359-44da-8982-3e0159dde248)


<br>
<br>

![image](https://github.com/user-attachments/assets/40c5d225-e772-4012-bdb0-26a37ef314ad)

<br>
<br>

>예약가능 시간 체크기능 예정 폼
![image](https://github.com/user-attachments/assets/0111ca2b-b32b-4e17-b8e3-5b9c2a60ade4)


<br>
<br>


> Insights 진행현황 
![image](https://github.com/user-attachments/assets/bb351f4a-9719-4f67-b4cc-9e0183a976ba)



<br><br>
-------------
<br>


> ### Tiles 설정 

#### merge 전 체크할 부분 *공지사항읽어주세요 :) 

  공동 수정할 파일부분에서 같은 영역에 동시수정되지
않았는지 확인한다>>  오류나면 스스로 내용추합해야함.

* xml 변동있을시 단체톡방 또는 깃 이슈에 언급해서 실시간으로 올려주세요*  >> 동시올리실 분은 이미 올린해당브렌치 간 후 내것도 추가 수정해서 머지해야 오류가 덜납니다. 

#### tiles_definitions.xml 
동시수정 부분 영역 나눠두었습니다.  
본인영역의 라인사용하고 상대부분 영역의 라인을 변경하지않게 수정하면 됩니다. 

##### tiles  3버전 관련소스가 적습니다. ✔️지금 3 쓰고있음
Gpt가 2버전 소스를 제공하면 버전충돌 오류가 납니다. 
 #servlet-context.xml 과 
#pom.xml 에 있는  tiles버전 설정은  다른작업시 건들이지 않기로 합니다. 

코드 받고 추가된 라이브러리 설치가 안된다면 메이븐업데이트 후껐다킵니다.  maven리스트보고 tiles라이브러리설치리스트(4가지이상뜸) 확인합니다. 

* definition에 경로지정만 수정해야하고, 
   관련 버전변경하면 안됩니다.  
(Gpt 답변대로 무조건 복붙하면 충돌나는경우를 보고 미리 참고하시라고 적어둡니다. ) 

     <definition name="/board/favfood" extends="base">
     		<put-attribute name="title" value="즐겨찾는 맛집" />
     		<put-attribute name="body"
     			value="/WEB-INF/views/board/favfood.jsp" />
     	</definition> 

위부분 복사해서 부분수정하시면됩니다. 🙌🏻

<br><br>
<br>


-------------------------------
<br>
