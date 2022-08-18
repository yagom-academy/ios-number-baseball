
import Foundation

let threeComputerRandomNumbers: Array<Int> = [4, 5, 6]
var threeUserRandomNumbers: Set<Int> = []
var remainingRound: Int = 9

func generateRandomThreeNumbers() {
    while threeUserRandomNumbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        threeUserRandomNumbers.insert(randomNumber)
    }
    print("임의의 수 :", threeUserRandomNumbers.map {(number: Int) -> String in
        return String(number)}.joined(separator: " "))
}

func countStrikeAndBall() -> Int {
    var strikeCount = 0
    var ballCount = 0

    for (index, number) in threeUserRandomNumbers.enumerated() {
        if number == threeComputerRandomNumbers[index] {
            strikeCount += 1
        } else if threeComputerRandomNumbers.contains(number) {
            ballCount += 1
        }
    }
    print("""
          (strikeCount) 스트라이크, (ballCount) 볼
          남은 기회 : (remainingRound)
          """)
    return strikeCount
}

func playNumberBaseBall() {
    while remainingRound > 0 {
        remainingRound -= 1
        threeUserRandomNumbers.removeAll()
        generateRandomThreeNumbers()
        let strike = countStrikeAndBall()

        if strike == 3 {
            print("사용자 승리!")
            selectMenu()
        } else if remainingRound == 0 {
            print("컴퓨터 승리...!")
            selectMenu()
        }
    }
}

func selectMenu() {
    print("""
        1. 게임시작
        2. 게임종료
        원하는 기능을 선택해주세요 :
        """, terminator: " ")
    let menuNumber = readLine()

    switch menuNumber {
    case "1":
        print("""
            숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
            중복 숫자는 허용하지 않습니다.
            """)
    case "2":
        break
    default:
        print("입력이 잘못되었습니다.")
        selectMenu()
    }
}
