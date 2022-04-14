//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerRandomNumbers = [Int]()
var totalTrialNumber = 9

func makeRandomNumbers() -> Array<Int> {
    var randomNumbers = Set<Int>()
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomNumbers)
}

func checkStrikeBall(playerRandomNumbers: Array<Int>) -> (Int, Int) {
    var strike = 0
    var ball = 0
    
    for numberIndex in (0...playerRandomNumbers.count - 1) {
        if computerRandomNumbers.contains(playerRandomNumbers[numberIndex]) && computerRandomNumbers[numberIndex] == playerRandomNumbers[numberIndex] {
            strike += 1
        } else if computerRandomNumbers.contains(playerRandomNumbers[numberIndex]) && computerRandomNumbers[numberIndex] != playerRandomNumbers[numberIndex] {
            ball += 1
        }
    }
    return (strike, ball)
}


func printResult(strikeCount: Int, ballCount: Int) {
    print("\n\(strikeCount) 스트라이크, \(ballCount) 볼")
    if strikeCount == 3 {
        print("사용자 승리!")
        totalTrialNumber = 0
        return
    } else {
        print("남은 기회 : \(totalTrialNumber)")
    }
    if totalTrialNumber == 0 {
        print("컴퓨터 승리...!")
    }
}

func printRandomNumbers(playerRandomNumbers: Array<Int>) {
    print("임의의 수 : ", terminator: "")
    for randomNumber in playerRandomNumbers {
        print(randomNumber, terminator: " ")
    }
}

func startGame() {
    computerRandomNumbers = makeRandomNumbers()
    while totalTrialNumber > 0 {
        
        // 수정
        let playerRandomNumbers = makeRandomNumbers()
        printRandomNumbers(playerRandomNumbers: playerRandomNumbers)
        totalTrialNumber -= 1
        let (strikeCount, ballCount) = checkStrikeBall(playerRandomNumbers: playerRandomNumbers)
        printResult(strikeCount: strikeCount, ballCount: ballCount)
    }
}

func verifyWithRegularExpression(playerInput: String) -> Bool {
    if ((playerInput.range(of: #"^[0-9]\s[0-9]\s[0-9]$"# ,options: .regularExpression)) != nil) {
        return true
    }
    return false
}

func verifyInput(playerInput: String) {
    var isCorrect = false
    let playerInputWithoutWhitespace = playerInput.replacingOccurrences(of: " ", with: "")
    if Set(playerInputWithoutWhitespace).count == playerInputWithoutWhitespace.count {
        isCorrect = verifyWithRegularExpression(playerInput: playerInput)
    }
    if isCorrect {
        startGame()
    } else {
        printErrorMessage()
        inputNumbers()
    }
}

func inputNumbers() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    if let inputNumbers = readLine() {
        verifyInput(playerInput: inputNumbers)
    }
}

func showMenu() {
    var isStart = true
    while isStart {
        print("1. 게임시작")
        print("2. 게임종료")
        print("원하는 기능을 선택해주세요 : " , terminator: "")
        if let inputMenuNumber = readLine() {
            switch inputMenuNumber {
            case "1" :
                inputNumbers()
            case "2" :
                isStart = false
                break
            default:
                printErrorMessage()
            }
        }
    }
}

func printErrorMessage() {
    print("입력이 잘못되었습니다")
}
