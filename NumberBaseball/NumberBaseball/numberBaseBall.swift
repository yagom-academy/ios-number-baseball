
import Foundation

enum userNumbersError: Error {
    case noInput
    case outOfRange
    case wrongNumbersCount
    case wrongFormat
    case others
}

var threeComputerRandomNumbers: Array<Int> = []
var threeUserRandomNumbers: Array<Int> = []
var remainingRound: Int = 9

func generateComputerRandomThreeNumbers() {
    while threeComputerRandomNumbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if threeComputerRandomNumbers.contains(randomNumber) == false {
            threeComputerRandomNumbers.append(randomNumber)
        }
    }
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
          \(strikeCount) 스트라이크, \(ballCount) 볼
          남은 기회 : \(remainingRound)
          """)
    return strikeCount
}

func receiveThreeUserRandomNumber() throws {
    threeUserRandomNumbers.removeAll()
    print("입력 : ", terminator: "")

    let inputNumber = readLine()
    let inputIsEmpty: Bool = inputNumber == ""

    guard inputIsEmpty == false else {
        throw userNumbersError.noInput
    }
    guard let inputNumber = inputNumber else {
        throw userNumbersError.others
    }
    let inputNumberArray: Array<String> = inputNumber.components(separatedBy: " ")

    for number in inputNumberArray {
        guard let number = Int(number) else {
            throw userNumbersError.wrongFormat
        }
        guard number >= 1, number <= 9 else {
            throw userNumbersError.outOfRange
        }
        threeUserRandomNumbers.append(number)
    }
    guard threeUserRandomNumbers.count == 3 else {
        throw userNumbersError.wrongNumbersCount
    }
}

func checkWinner() {
    remainingRound -= 1
    let strike = countStrikeAndBall()

    if strike == 3 {
        print("사용자 승리!")
        openGameMenu()
    } else if remainingRound == 0 {
        print("컴퓨터 승리...!")
        openGameMenu()
    }
}

func requireInputNumber() {
    print("""
        숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
        중복 숫자는 허용하지 않습니다.
        """)
    errorHandleAboutReceivedThreeUserNumbers()
}

func openGameMenu() {
    print("""
        1. 게임시작
        2. 게임종료
        원하는 기능을 선택해주세요 :
        """, terminator: " ")

    let menuNumber = readLine()

    switch menuNumber {
    case "1":
        threeComputerRandomNumbers.removeAll()
        remainingRound = 9
        requireInputNumber()
    case "2":
        break
    default:
        print("입력이 잘못되었습니다.")
        openGameMenu()
    }
}

func errorHandleAboutReceivedThreeUserNumbers() {
    do {
        try receiveThreeUserRandomNumber()
    } catch userNumbersError.noInput,
            userNumbersError.outOfRange,
            userNumbersError.wrongNumbersCount,
            userNumbersError.wrongFormat,
            userNumbersError.others {
        print("입력이 잘못되었습니다")
        requireInputNumber()
    } catch { }
    generateComputerRandomThreeNumbers()
    checkWinner()
    while remainingRound > 0 {
        requireInputNumber()
    }
}
