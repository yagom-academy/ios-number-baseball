import Foundation

// 전역 변수 생성

var userNum: [Int] = [] //사용자의 임의의 정수 3개를 Array에 담아둘 변수

var computerNum: [Int] = [] //컴퓨터의 임의의 정수 3개를 Array에 담아둘 변수

var count: Int = 9 //남은 시도횟수를 담아둘 변수: 초기값은 9
 

//클래스 선언
class NumberBaseballGame {

    //1~9 사이의 중복되지 않는 세 개의 임의의 정수를 생성하여 반환하는 함수
    func randomNumbers() -> [Int] {

        var numbersArray: [Int] = [] //세 개의 임의의 정수를 담아둘 numbersArray


        while numbersArray.count < 3 { //Array 길이 3개까지만 허용(0,1,2)

            let newRandomNumber: Int = Int.random(in: 1...9) // 수의 범위: 1~9 사이

            if numbersArray.contains(newRandomNumber) { //일치하면 return 갔다가 while로 다시

                continue

            } else {
                numbersArray.append(newRandomNumber) //불일치하면 숫자 추가
            }
        }
        return numbersArray
    }

    // 볼과 스트라이크 결과를 반환하는 함수
    func strikeOrBall(threeNumbersArray: [Int]) {

        var strike = 0
        
        var ball = 0

        count -= 1

        for i in 0...2 {

            if threeNumbersArray[i] == computerNum[i] { //같은 위치 같은 숫자일 경우 스트라이크 1 증가

                strike += 1

            } else if computerNum.contains(threeNumbersArray[i]) { //다른 위치 같은 숫자일 경우 볼 1 증가

                ball += 1
            }
        }

        print("임의의 수 :", terminator: " ") //terminator: 개행 제거

        for i in 0...2 {

            print("\(userNum[i])", terminator: " ") //3번 반복이니 숫자를 3번 갖고옴

        }

        print("") //개행 줄바꿈

        print("\(strike) 스트라이크, \(ball) 볼")

        
        if strike == 3 {                         //스트라이크 3번이면 사용자 승리

            print("사용자 승리...!")

        } else if count == 0 {                   // 카운트가 끝나면 컴퓨터 승리

            print("컴퓨터 승리...!")

        } else {

            print("남은 기회 : \(count)")    // 사용자나 컴퓨터의 승리가 아니면 남은 기회 출력

        }
            if count == 0 { //count가 0이면

                print("남은 기회 : \(count)") // 남은 기회 : 0 출력
                
               }
    }

    // 게임 시작 함수

    func gameStart() {

        computerNum = randomNumbers()         //랜덤숫자를 컴퓨터숫자로 보냄

        while count != 0 {                               // 카운트가 0일때까지

            userNum = randomNumbers()          // 랜덤숫자를 사용자 숫자로 보냄

            strikeOrBall(threeNumbersArray: userNum) //strikeOrBall함수에 threeNumbersArray에 userNum 넣기

            if userNum == computerNum { //사용자 숫자랑 컴퓨터의 숫자가 일치하면 3스트라이크 이므로

                break //끝남

            }

        }

    }

}

 
let numberBaseballGame = NumberBaseballGame() //클래스 인스턴스화

numberBaseballGame.gameStart() //클래스에 있는 시작 함수 호출
