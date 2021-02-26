
import Foundation

// 전역 변수 생성 (게임 중 사용자 입력, 정답 숫자, 잔여 시도 횟수)
var threeNumbersInputByUser:[Int] = [0,0,0]
var answerNumbers = [Int]()
var remainingTryCount: Int = 9
//var selectGameMeunNumber: Int

class NumberBaseballGame {
    // 중복되지 않는 임의의 정수 3개 생성 함수
    func generateThreeRandomUniqueNumbers() -> [Int] {
        var threeRandomUiqueNumbers = [Int]()

        while threeRandomUiqueNumbers.count < 3 {
            let randomNumber: Int = Int.random(in: 1...9)
            if threeRandomUiqueNumbers.contains(randomNumber) {
                continue
            } else {
                threeRandomUiqueNumbers.append(randomNumber)
            }
        }
        return threeRandomUiqueNumbers
    }

    // 스트라이크, 볼, 사용자 승리, 컴퓨터 승리 판단 및 출력 함수
    func checkStrikeOrBall(Of: [Int]) {
        var strikeCount = 0
        var ballCount = 0
        remainingTryCount -= 1

        for index in 0...2 {
            if Of[index] == answerNumbers[index] {
                strikeCount += 1
            } else if answerNumbers.contains(threeNumbersInputByUser[index]) {
                ballCount += 1
            }
        }
        
        print("임의의 수 :", terminator: " ")
        for i in 0...2 {
            print("\(threeNumbersInputByUser[i])", terminator: " ")
        }
        print("")
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        
        if strikeCount == 3 {
            print("사용자 승리...!")
        } else if remainingTryCount == 0 {
            print("컴퓨터 승리...!")
        } else {
            print("남은 기회 : \(remainingTryCount)")
        }
        print("---------------")
    }
    
    // 메뉴 선택하는 함수
    func selectGameMenu() -> Int {
        var flag: Int = 0
        print("1. 게임시작\n2. 게임종료")
        print("원하는 기능을 선택해주세요 : ")
        
        if let userNumber = Int(readLine()!) {
            if userNumber == 1 {    // 게임시작
                flag = 1
            } else if userNumber == 2 { // 게임종료
                flag = 2
            } else {
                print("입력이 잘못되었습니다.")
                self.selectGameMenu()
            }
        }
        else {
            print("옵셔널 해제 실패, 입력이 잘못되었습니다.")
            self.selectGameMenu()
        }
        return flag
    }
    
    func getThreeNumbersInputByUser() -> [Int] {
        var threeNumbersInputByUser:[Int] = [0,0,0]
        print("입력test")
        
        for index in 0...2 {
            threeNumbersInputByUser[index] = Int(readLine()!)!
        }
        
            if threeNumbersInputByUser[1] == threeNumbersInputByUser[0] ||
                threeNumbersInputByUser[2] == threeNumbersInputByUser[0] ||
                threeNumbersInputByUser[2] == threeNumbersInputByUser[1] {
                print("중복 숫자는 허용하지 않습니다.")
                self.getThreeNumbersInputByUser()
            }
        return threeNumbersInputByUser
        }

    // 게임 시작 함수
    func gameStart() {
        let flag: Int = selectGameMenu()
        if flag == 2 { return }
        
        answerNumbers = generateThreeRandomUniqueNumbers()
        while remainingTryCount != 0 {
            threeNumbersInputByUser = getThreeNumbersInputByUser()
            checkStrikeOrBall(Of: threeNumbersInputByUser)
            if threeNumbersInputByUser == answerNumbers {
                break
            }
        }
    }
}

let numberBaseballGame = NumberBaseballGame()
numberBaseballGame.gameStart()
