//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func createThreeRandomNumbers() -> [Int] {
    var randomSet: Set = Set<Int>()
    
    while randomSet.count < 3 {
        let number: Int = Int.random(in: 1...9)
        randomSet.insert(number)
    }
     return Array(randomSet)
    
}

func countStrikeAndBall(answerNumbers: [Int], userInputNumbers: [Int]) -> (strike: Int, ball: Int) {
    var strike: Int = 0
    var ball: Int = 0
    
    for index in 0..<answerNumbers.count {
        strike += answerNumbers[index] == userInputNumbers[index] ? 1 : 0
        
        ball += answerNumbers.contains(userInputNumbers[index])
            && answerNumbers[index] != userInputNumbers[index] ? 1 : 0
    }
    
    return (strike, ball)
}

func printGameStatus(strike: Int, ball: Int, remainingChances: inout Int) {
    if strike == 3 {
        print("사용자 승리!")
    }
    else if remainingChances == 0 {
        print("컴퓨터 승리!")
    }
    
    print("\(strike) 스트라이크,\(ball) 볼")
    print("남은 기회 : \(remainingChances)")
    
    if strike == 3 {
        remainingChances = 0
    }
}

func printInvalidInput() {
    print("입력이 잘못되었습니다.")
}

func printMenu() {
    print("1. 게임 시작")
    print("2. 게임 종료")
    print("원하는 기능을 선택해 주세요 : ", terminator: "")
}

func printGuidance() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
}

func receiveMenu() -> String {
    let input: String? = readLine()
    guard let validInput = input else{
        return "0"
    }
    return validInput
}

func printAndRunMenu() {
    printMenu()
    var input: String = receiveMenu()
    
    while input != "1" && input != "2" {
        printInvalidInput()
        printMenu()
        input = receiveMenu()
    }
    
    if input == "1" {
        startStep2Game()
    }
    
    return
}

func hasDuplicate(numbers:[Int]) -> Bool {
    return Set(numbers).count != numbers.count
}

func receiveUserGuesses() -> String {
    let input: String? = readLine()
    guard let validInput = input else{
        return " "
    }
    return validInput
}

func receiveValidInputNumbers() -> [Int] {
    var input: String = receiveUserGuesses()
    var splitInput: [Substring] = input.split(separator:" ")
    var convertedInput : [Int] = splitInput.map { Int($0) ?? 0 }
    
    while convertedInput.count != 3 || hasDuplicate(numbers: convertedInput) ||
            convertedInput.filter({$0 > 0 && $0 < 10}).count != 3 {
        printInvalidInput()
        printGuidance()
        input = receiveUserGuesses()
        splitInput = input.split(separator:" ")
        convertedInput = splitInput.map { Int($0) ?? 0 }
    }
    return convertedInput
}

func startStep2Game() {
    let answerNumbers: [Int] = createThreeRandomNumbers()
    var remainingChances: Int = 9

    while remainingChances > 0  {
        printGuidance()
        let inputNumbers: [Int] = receiveValidInputNumbers()
        remainingChances -= 1
        let strikeAndBall: (strike: Int, ball: Int) = countStrikeAndBall(answerNumbers: answerNumbers, userInputNumbers: inputNumbers)
        printGameStatus(strike: strikeAndBall.strike,
                        ball: strikeAndBall.ball,
                        remainingChances: &remainingChances)
    }
    
    return
}

printAndRunMenu()
