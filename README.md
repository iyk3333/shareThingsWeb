# sharethingsWeb

📝 주제 

---

~~~
💡 최근 공유 경제 사업 모델의 등장으로 차량, 숙박 뿐 아니라 옷 부터 명품까지 다양해진 공유 품목으로 
   서로의 물건을 공유하여 대여 및 교환까지 가능하게 하기 위해 “ShareThings”라는 물건공유 사이트를 기획하였다.
~~~
~~~
🍀 키워드 

  1️⃣  소비 트랜드 변화: 소유 → 대여
  2️⃣  개인간 대여 서비스
  3️⃣  개인간 교환 서비스
~~~
<br/>
<br/>


📝 프로젝트 기간

---

~~~
💡 2022.09~2022.11
~~~

<br/>
<br/>

📝 웹 응용 및 설계

💙 기능

<p align="center">
   <img src="https://user-images.githubusercontent.com/59546979/173134248-7e15e64f-ca56-40df-8350-857ee1e764e6.png"/>
</p>
                                                                                                                   
```
▶  DBUtil: 데이터 관리, 데이터 저장, 삭제, 변경 조회 등
▶  DoBorrowUpload: 대여 업로드 페이지
▶  DoDeal: 거래 완료 표시
▶  DoDtail: 물건 품목 클릭 시 자세한 내용 보는 페이지
▶  DoExchangeUpload: 교환 업로드 페이지
▶  DoIncreaseLike: 좋아요 버튼 누르기
▶  DoLogin: 로그인 페이지
▶  DBConnection: 프론트엔드에서 받은 입력에 대하여 DB에 접근
▶  DoBorrowUpload: 대여 업로드 페이지
▶  DoRecommendationUpload: 추천 받고 싶은 키워드 업로드
▶  DoSearch: 검색
▶  FindID: 아이디 찾기
▶  FindPW: 비밀번호 찾기
▶  SessionTerminate: 일정 시간 지날 시 세션 종료
```
<br/>


💙 DB 구조

<p align="center">
   <img src="https://user-images.githubusercontent.com/59546979/173134243-bbe03c23-7eac-4c94-b5a3-e4da099a66cb.png"/>
</p>

```
▶  product: 상품 데이터
▶  rental: 대여 상품 데이터
▶  exchange: 교환 상품 데이터
▶  customer: 유저 데이터
▶  recommendationproduct: 유저가 추천받고 싶은 상품 관련 데이터
▶  notice: 게시판 데이터
```
<br/>
✅ 자세한 설명: https://fluorescent-cornet-5b7.notion.site/Sharethings-b02971a09f784521a947426f45be87dd
