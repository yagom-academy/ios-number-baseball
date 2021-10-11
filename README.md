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

<br/>

# **Step2**

<함수 정의 설명>
- `numberBaseball` : 이 프로그래밍의 핵심함수. 메뉴를 출력하고 사용자에게 메뉴를 입력받아 그에 맞게 기능을 실행시켜줌. 
- `printMenu` : 메뉴를 출력함.
- `launchBaseBall` : 숫자 야구게임을 구동하는 함수. 
- `makingRandomNumbers` :  Set을 이용하여 컴퓨터가 사용할 중복되지 않는 배열(랜덤한 정수 3개)생성 후 리턴
- `makingUserNumbers` : 사용자가 입력한 값을 중복되지 않는 Int 배열로 생성 후 리턴
- `printInputInfo` : 사용자에게 안내될 입력값 조건 출력
- `checkInvalidUserNumbers` : 사용자가 입력한 값의 유효성 검사 실행 및 Bool 타입 리턴
    1. inputedUserNumbers.count == 5 : 사용자가 입력한 값이 5자리인지 확인 
    2. inputedUserNumbers.replacingOccurrences(of: " ", with: "").count == 3 : 공백을 제외한 입력값이 3자리인지 확인
    3. arrayNumbers[1] == " " && arrayNumbers[3] == " " : 공백의 위치 확인
    4. Int(inputedUserNumbers.replacingOccurrences(of: " ", with: "")) != nil : 입력값이 문자열이 아닌 정수형을 확인
    5. Set(inputedUserNumbers.replacingOccurrences(of: " ", with: "")).count == 3 : 입력값의 중복 확인
- `convertNumbers` : 입력값을 정수형 배열로 전환
- `compareNumbers` : `makingRandomNumbers`를 통해 나온 값과 사용자에게 입력받은 값을 비교하여 스트라이크와 볼 계산 후 
