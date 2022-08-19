import Foundation

var computerRandomThreeNumbers: Array<Int> = []
var userRandomThreeNumbers: Array<Int> = []
var remainingRound: Int = 9
var strikeCount = 0
var ballCount = 0

func openGameMenu() {
    print("""
        1. 게임시작
        2. 게임종료
        원하는 기능을 선택해주세요 :
        """, terminator: " ")
    
    let menuNumber = readLine()
    
    switch menuNumber {
    case "1":
        startGame()
    case "2":
        return
    default:
        print("입력이 잘못되었습니다.")
        openGameMenu()
    }
}

func startGame() {
    resetRemainingRound()
    resetComputerRandomThreeNumbers()
    
    while remainingRound >= 1 && strikeCount != 3 {
        remainingRound -= 1
        errorHandleAboutGeneratedThreeUserNumbers()
        countStrikeAndBall()
        checkWinner()
    }
}

func resetRemainingRound() {
    remainingRound = 9
}

func resetComputerRandomThreeNumbers() {
    computerRandomThreeNumbers.removeAll()
    generateComputerRandomThreeNumbers()
}

func generateComputerRandomThreeNumbers() {
    while computerRandomThreeNumbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if computerRandomThreeNumbers.contains(randomNumber) == false {
            computerRandomThreeNumbers.append(randomNumber)
        }
    }
}

func generateUserRandomThreeNumbers() throws {
    userRandomThreeNumbers.removeAll()
    print("""
        숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
        중복 숫자는 허용하지 않습니다.
        입력 :
        """, terminator: " ")
    
    let inputNumber = readLine()
    
    guard let inputNumber = inputNumber else {
        throw userNumbersError.noInput
    }
    
    let inputNumberArray: Array<String> = inputNumber.components(separatedBy: " ")
    
    for number in inputNumberArray {
        guard let number = Int(number) else {
            throw userNumbersError.wrongFormat
        }
        guard number >= 1, number <= 9 else {
            throw userNumbersError.outOfRange
        }
        userRandomThreeNumbers.append(number)
    }
    guard userRandomThreeNumbers.count == 3 else {
        throw userNumbersError.wrongNumbersCount
    }
}

func errorHandleAboutGeneratedThreeUserNumbers() {
    do {
        try generateUserRandomThreeNumbers()
    } catch userNumbersError.noInput {
        print("입력값이 없습니다.")
        errorHandleAboutGeneratedThreeUserNumbers()
    } catch userNumbersError.outOfRange {
        print("입력값이 잘못되었습니다. 입력값을 1~9 사이로 입력해 주세요.")
        errorHandleAboutGeneratedThreeUserNumbers()
    } catch userNumbersError.wrongNumbersCount {
        print("입력값의 갯수가 부족하거나 초과됐습니다.")
        errorHandleAboutGeneratedThreeUserNumbers()
    } catch userNumbersError.wrongFormat {
        print("입력값이 정수가 아닙니다.")
        errorHandleAboutGeneratedThreeUserNumbers()
    } catch userNumbersError.others {
        print("입력이 잘못되었습니다")
        errorHandleAboutGeneratedThreeUserNumbers()
    } catch {}
}

func countStrikeAndBall() {
    strikeCount = 0
    ballCount = 0
    
    for (index, number) in userRandomThreeNumbers.enumerated() {
        if number == computerRandomThreeNumbers[index] {
            strikeCount += 1
        } else if computerRandomThreeNumbers.contains(number) {
            ballCount += 1
        }
    }
    print("""
          \(strikeCount) 스트라이크, \(ballCount) 볼
          남은 기회 : \(remainingRound)
          """)
}

func checkWinner() {
    if strikeCount == 3 {
        print("사용자 승리!")
        remainingRound = 0
        openGameMenu()
    } else if remainingRound == 0 {
        print("컴퓨터 승리...!")
        openGameMenu()
    }
}
