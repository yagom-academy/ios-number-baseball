## iOS 커리어 스타터 캠프

### 숫자야구 프로젝트 저장소


# **Step0**

<순서도>

<img width="50%" src="https://user-images.githubusercontent.com/90880660/136166398-144fcaf2-86cf-425d-8fcd-971f8cba4bba.png"/>

<페어 프로그래밍 규칙>

각자 하나의 함수를 번갈아 구현한다. 
<br/>
<br/>

# **Step1**

<구현 예시>

<img width="240" alt="스크린샷 2021-10-06 오후 5 24 03" src="https://user-images.githubusercontent.com/90880660/136167078-c8d68416-786b-4543-a9a9-2e094b889b96.png">

<고민한 내용>
1. 중복값 처리 
2. 들여쓰기 2번 제약사항으로 인한 고민
    1. `compareNumbers`에서 볼과 스트라이크 판단 방법 
        1. `ball`과 `strike`의 분리 방법 고민  
    2. `launchBaseBall`에서 반복문의 조건 및 3 strike 시 처리 방법

<진행>
- `makeRandomNumber` : 1~9 사이의 정수를 임의로 추출해서 반환해주는 역할
- `makeRandomNumberSet` : 1~9 사이의 정수 3개를 뽑아주는 역할 (중복 숫자 제외)
- `judgeBall` : 사용자가 입력한 값이 컴퓨터 랜덤 값과 비교하여 볼 여부를 판단해주는 역할
- `compareNumbers` : 사용자 입력값과 컴퓨터 랜덤 값을 비교하여 결과값을 계산하고 출력해주는 역할
- `printNumbers` : 사용자 입력값을 출력해주는 역할
- `launchBaseBall` : 전체 게임을 실행해주는 역할 
