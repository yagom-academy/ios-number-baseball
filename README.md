## iOS 커리어 스타터 캠프

### 숫자야구 프로젝트 저장소

- 이 저장소를 자신의 저장소로 fork하여 프로젝트를 진행합니다


 *[FlowChart](https://ifh.cc/g/NVXs6M.jpg)

# class -> StartBaseballGame()

* 변수 선언
  * 무작위 숫자 3개를 담는 배열 randomNumberArray
  * 컴퓨터가 뽑은 숫자 3개를 담는 배열 computerNumberArray 
  * User 가 step 1 에 한정해서 뽑는 배열 userNumberArray - > **step1 이후 삭제 예정**
  * extractRandomNumber() 함수에서 User인지 Computer 인지 True & False 를 통해 구분해줄 userTrueAndComputerFalse -> **step 1 이후 삭제 예정**
  * 9번의 기회를 나타내주는 restChance
  
* 함수 구현 
  * 중복되지 않는 3개의 숫자를 뽑는 함수 
    * **step 1 의 경우는 숫자를 사용자가 직접 입력하는것이 아닌 임의의 숫자를 뽑는 형식으로 진행**
    * extractRandomNumber() 를 통해 Set 을 사용하 중복을 없애고 
    userTrueAndComputerFalse 라는 Bool 을 사용하여 컴퓨터가 뽑은 3개의 숫자와 User 가 뽑는 숫자를 
    사용자면 True 컴퓨터면 False 로 구분 -> 추후 이 부분은 사용자가 입력을 받는 방식으로 바뀌면 userTrueAndComputerFalse 변수 제거 예정
    
  * strike 와 ball 의 갯수를 나타내는 함수
    * countStrikeAndBall()
    * User 와 Computer 가 뽑은 공통된 숫자를 contains 를 통해 찾고, 중복되는 숫자가 없는점을 이용하여 firstIndex를 통해 index 를 비교해서 strike 와 ball 을 구분


   * 실행 함수 init()
      * while 문을 통하여 restChance 가 0 초과일때 동작하도록 구현
      * 3 strike 가 되면 restChance 가 0 이되어 동작을 멈춤 

