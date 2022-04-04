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

https://user-images.githubusercontent.com/71997918/161511806-d6150b24-2ea2-41ce-841f-d89cbef2ed0c.png

### 2. 사용자 정보 변경
----
> 로그인 후 사용자 정보를 변경할 수 있습니다.

> 닉네임, 자기소개, 블로그 명, SNS 연결, 네비 바 색상 변경 가능
2. 정보변경 사진 넣기

### 3. 홈
----
#### 3-1. 프로필
> 이메일을 클릭하여 바로 메일을 보낼 수 있습니다.

> SNS 아이콘을 통해 사용자가 입력한 링크로 이동할 수 있습니다.
	
<프로필 사진>
----
#### 3-2. 글 목록
* 마이페이지
 > 글 제목 클릭 시 글 내용이 나타납니다. (collapse 사용)
<마이페이지 글목록 사진>
> 글 작성
<글 작성 사진>
>글 수정
<글 수정 사진>
	

* 타 유저 페이지
	> 스크랩 버튼으로 스크랩이 가능합니다.
<타 유저 페이지 글 목록>

----
#### 3-3. 안부글 목록
> 안부글 목록을 출력합니다.
<안부글 사진>
---
#### 3-4. 이웃 목록
> 서로이웃 신청 목록과 이웃 신청 목록을 출력합니다.
<이웃 목록 사진>
----
### 4. 검색
----
#### 4-1 글 검색
> 해당 유저의 글 목록 내에서 검색합니다.
<글 검색 사진>
----
#### 4-2 글/유저 검색
> 전체 유저 대상으로 검색합니다.
<유저 검색 사진>
---
###  5. 알람
> 해당 유저에게 알림이 있을 시 알람을 띄웁니다.
<알람 토스트 사진>
<알람 리스트 사진>

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
