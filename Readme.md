# KLOG
네이버 블로그를 벤치마킹 하여 프로젝트를 진행하였습니다.

* 각자 마이페이지를 소유하고있으며 프로필, 글 목록, 안부글 목록, 이웃 목록을 나타냅니다.
* 원하는 유저에게 이웃/서로이웃을 신청할 수 있습니다.
* 안부글, 이웃, 서로이웃 신청 시 알림이 발생합니다.

##  개발 환경
>[KLOG 정리](https://hxnkys-page.notion.site/8d1bf03814274e3e8bc056e0e9b5bcb3)
>프로젝트를 설계하고 UI 및 간략한 코드를 정리하였습니다.
  - 웹 표준 및 프론트엔드
    - HTML5
    - CSS3
    - JavaScript
    - JQuery
    - JSON
    - JSP
    - Bootstrap
  - 백엔드
    - Spring FrameWork
    - Java
    - EL
    - EC2
    - S3
    - mybatis
    - junit
    - OAuth2.0 + JWT
  - DBMS
    - mySQL
    
  - 구현 도구
    - Eclipse
    - Spring Tool Suite
    - Maven
  - API
    - Google Login API
  - 형상관리
    - GITHUB

## 사용 방법

### 1. 로그인
------
> 이메일/구글로 로그인을 할 수 있습니다.

![1 login](https://user-images.githubusercontent.com/71997918/161511806-d6150b24-2ea2-41ce-841f-d89cbef2ed0c.png)

### 2. 사용자 정보 변경
----
> 로그인 후 사용자 정보를 변경할 수 있습니다.

> 닉네임, 자기소개, 블로그 명, SNS 연결, 네비 바 색상 변경 가능

![2  loginInfoChange](https://user-images.githubusercontent.com/71997918/161511817-a2082d81-506d-4f8e-ac34-b7893a57f2a0.png)

### 3. 홈
----
#### 3-1. 프로필
> 이메일을 클릭하여 바로 메일을 보낼 수 있습니다.

> SNS 아이콘을 통해 사용자가 입력한 링크로 이동할 수 있습니다.
	
![3  profile](https://user-images.githubusercontent.com/71997918/161511822-6b0eac9a-8840-440f-8a7c-de7daba675dd.png)
----
#### 3-2. 글 목록
* 마이페이지
 > 글 제목 클릭 시 글 내용이 나타납니다. (collapse 사용)

![4  postList](https://user-images.githubusercontent.com/71997918/161511829-9d40df29-adcf-4441-9d89-b94d75372c02.png)

> 글 작성

![5  postCreate](https://user-images.githubusercontent.com/71997918/161511836-0ddd43ad-6de4-4808-aff5-196df42bce51.png)

>글 수정 및 결과

![6  postEdit](https://user-images.githubusercontent.com/71997918/161511839-788e1d3b-95b4-4d5c-97dc-ce01214ecd42.png)
![6-1  postEditResult](https://user-images.githubusercontent.com/71997918/161511844-0e9e6afa-f449-4893-931c-9886df22809a.png)

* 타 유저 페이지
> 스크랩 버튼으로 스크랩이 가능합니다.

![7  UserPostList](https://user-images.githubusercontent.com/71997918/161511849-7fefde13-9af1-4bc1-9c6f-9e3b28f135bf.png)

> 스크랩 결과

![7-1  scrapResult](https://user-images.githubusercontent.com/71997918/161511859-2c01d6c6-fad4-4150-a7e8-af9178e16a5a.png)
----
#### 3-3. 안부글 목록
> 안부글 목록을 출력합니다.

![8  letterList](https://user-images.githubusercontent.com/71997918/161511867-8e55ac45-a138-43aa-8343-ccb46cb76348.png)
---
#### 3-4. 이웃 목록
> 서로이웃 신청 목록과 이웃 신청 목록을 출력합니다.

![9  followList](https://user-images.githubusercontent.com/71997918/161511876-f66913af-7765-4731-bb21-096017fe1baf.png)
----
### 4. 검색
----
#### 4-1 글 검색
> 해당 유저의 글 목록 내에서 검색합니다.

![10  postSearch](https://user-images.githubusercontent.com/71997918/161511878-7b2a1dce-4f6d-4565-bbfd-95e1fdd1d174.png)
----
#### 4-2 글/유저 검색
> 전체 유저 대상으로 검색합니다.

> 글 검색 결과 스크랩한 글과 자신의 글, 타 유저의 글에 따라 다른 버튼이 출력됩니다.
![11-1 postSearchList](https://user-images.githubusercontent.com/71997918/161511884-c1af89e3-2e91-4249-acb6-674e13a480f0.png)

> 유저 검색 결과 없는 경우
![11-2 userListnoResult](https://user-images.githubusercontent.com/71997918/161511891-8616bcc9-7e61-42ec-a66c-7f177ab7ca9c.png)

> 유저 검색 결과가 있는경우
![11-3 userListResult](https://user-images.githubusercontent.com/71997918/161511897-93ff5262-f710-4d8e-a285-b20e9c9c453f.png)
---
###  5. 알람
> 해당 유저에게 알림이 있을 시 알람을 띄웁니다.

![12  alarmList](https://user-images.githubusercontent.com/71997918/161511902-41c34603-7aa5-4b4e-8140-66270cc04fc9.png)
![12-1 alarmToast](https://user-images.githubusercontent.com/71997918/161511905-5f0c5826-3d15-46cc-9325-873d9a9062d2.png)

##  Spring Framework
구조는 다음과 같습니다.

*  security : OAuth, JWT 기능 관리
* util : S3 util 기능 관리
* web
	* controller : JSP와 연결
	* handler : 알람 관리
	* domain : DTO 관리
	* service : mapper에 정의한 메서드 호출
	* mapper : mySQL 쿼리 관리

## OAuth2.0 + JWT (Google Login)
> oauth provider를 사용해 불필요한 회원가입 프로세스를 제거하였다. 또한 JWT token을 사용해 Authorization Header 기반 인증 시스템을 구현한다.
<구조 사진 만들기>
