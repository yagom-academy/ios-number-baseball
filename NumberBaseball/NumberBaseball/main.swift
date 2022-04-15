//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var computerRandomNumbers = [Int]()
var totalTrialNumber = 0

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
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
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

func processGame(playerNumbers: Array<Int>) {
    let (strikeCount, ballCount) = checkStrikeBall(playerRandomNumbers: playerNumbers)
    printResult(strikeCount: strikeCount, ballCount: ballCount)
}

func verifyWithRegularExpression(playerInput: String) -> Bool {
    let playerInputAfterVerification = playerInput.range(of: #"^[1-9]\s[1-9]\s[1-9]$"# ,options: .regularExpression)
    if playerInputAfterVerification == nil {
        return false
    }
    return true
}

func checkDuplicateNumber(playerInput: String) -> Bool {
    var isCorrect = false
    let playerInputWithoutWhitespace = playerInput.replacingOccurrences(of: " ", with: "")
    if Set(playerInputWithoutWhitespace).count == playerInputWithoutWhitespace.count {
        isCorrect = verifyWithRegularExpression(playerInput: playerInput)
    }
    return isCorrect
}

func convertStringArrayToIntArray(playerInput: Array<String>) -> Array<Int> {
    var playerNumbersIntArray = [Int]()
    for elements in playerInput {
        playerNumbersIntArray.append(Int(elements) ?? 0)
    }
    return playerNumbersIntArray
}

func convertPlayerInputToIntArray(playerInput: String) {
    let playerNumbers = playerInput.components(separatedBy: " ")
    let playerNumbersIntArray = convertStringArrayToIntArray(playerInput: playerNumbers)
    totalTrialNumber -= 1
    processGame(playerNumbers: playerNumbersIntArray)
}

func verifyInput(playerInput: String) {
    if checkDuplicateNumber(playerInput: playerInput) {
        convertPlayerInputToIntArray(playerInput: playerInput)
    } else {
        printErrorMessage()
    }
}

func inputNumbers() {
    totalTrialNumber = 9
    while totalTrialNumber > 0 {
        print("""
        숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
        중복 숫자는 허용하지 않습니다.
        입력 : \
        
        """, terminator: "")
        if let inputNumbers = readLine() {
            verifyInput(playerInput: inputNumbers)
        }
    }
}

func showGameMenu() {
    var isStart = true
    while isStart {
        print("""
        1. 게임시작
        2. 게임종료
        원하는 기능을 선택해주세요 : \
        
        """, terminator: "")
        let inputMenuNumber = readLine() ?? ""
        switch inputMenuNumber {
        case "1" :
            computerRandomNumbers = makeRandomNumbers()
            inputNumbers()
        case "2" :
            isStart = false
            break
        default:
            printErrorMessage()
        }
    }
}

func printErrorMessage() {
    print("입력이 잘못되었습니다")
}

showGameMenu()
