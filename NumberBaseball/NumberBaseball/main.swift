//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let winnerGoalCount = 3

let numberRange: ClosedRange<Int> = 1...9
let limitCount = 3

var strikeCount = 0
var ballCount = 0

func startProgram() {
    printMenu()
    runSelectedMenu(menuInput: selectedMenu())
}

func printMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
}

func selectedMenu() -> Int {
    guard let menuInput = readLine(),
          let convertedMenuInput = Int(menuInput) else {
        return .zero
    }
    
    return convertedMenuInput
}

func runSelectedMenu(menuInput: Int) {
    let gameStart = 1
    let gameExit = 2
    
    switch menuInput {
    case gameStart:
        startGame()
    case gameExit:
        break
    default:
        print("입력이 잘못되었습니다.")
        startProgram()
    }
}

func startGame() {
    let randomNumbers = generatedThreeRandomNumbers()
    var matchCount = 9
    
    while matchCount > .zero && strikeCount != winnerGoalCount {
        let userNumbers = generatedUserNumbers()
        
        strikeCount = .zero
        ballCount = .zero
        
        judgeBallOrStrike(targetNumbers: randomNumbers, userNumbers: userNumbers)
        
        matchCount -= 1

        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        print("남은 기회 : \(matchCount)")
    }
    
    showGameResult()
}

func generatedUserNumbers() -> [Int] {
    var verifiedUserNumbers = [Int]()
    
    while verifiedUserNumbers.isEmpty {
        printUserGuideMenu()
        verifiedUserNumbers = inputUserNumbers()
    }
    
    return verifiedUserNumbers
}

func printUserGuideMenu() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
}

func inputUserNumbers() -> [Int] {
    guard let userInput = readLine()?.components(separatedBy: " ") else {
        print("입력이 잘못되었습니다")
        return []
    }
    
    guard verifyUserInput(userInput: userInput) else {
        print("입력이 잘못되었습니다")
        return []
    }
    
    let threeUserInputNumbers = userInput.compactMap { stringNumber in
        Int(stringNumber)
    }

    return threeUserInputNumbers
}

func verifyUserInput(userInput: [String]) -> Bool {
    guard vertifyNumbersCountIsThree(userInput: userInput) else {
        return false
    }
    
    guard  verifyNumbersDuplication(userInput: userInput) else {
        return false
    }
    
    guard verifyValidRange(userInput: userInput) else {
        return false
    }
    
    return true
}

func vertifyNumbersCountIsThree(userInput: [String]) -> Bool {
    return userInput.count == limitCount
}

func verifyNumbersDuplication(userInput: [String]) -> Bool {
    return Set(userInput).count == limitCount
}

func verifyValidRange(userInput: [String]) -> Bool {
    return userInput
        .compactMap { Int($0) }
        .filter{ (numberRange).contains($0) }
        .count == limitCount
}

func generatedThreeRandomNumbers() -> [Int] {
    var extractedNumbers: Set<Int> = []
    
    while extractedNumbers.count != limitCount {
        extractedNumbers.insert(generateRandomNumber())
    }
    
    return Array(extractedNumbers)
}

func generateRandomNumber(numberRange: ClosedRange<Int> = (numberRange)) -> Int {
    return Int.random(in: numberRange)
}

func judgeBallOrStrike(targetNumbers: [Int], userNumbers: [Int]) {
    for (userNumberIndex, userNumber) in userNumbers.enumerated() {
        increaseBallOrStrike(targetNumbers: targetNumbers, userNumberIndex: userNumberIndex, userNumber: userNumber)
    }
}

func increaseBallOrStrike(targetNumbers: [Int], userNumberIndex: Int, userNumber: Int) {
    if targetNumbers[userNumberIndex] == userNumber {
        strikeCount += 1
    } else if targetNumbers.contains(userNumber) {
        ballCount += 1
    }
}

func showGameResult() {
    if strikeCount == winnerGoalCount {
        print("사용자 승리!")
    } else {
        print("컴퓨터 승리...!")
    }
}

func convertIntArrayToString(intArray: [Int]) -> String {
    intArray.map { String($0) }.joined(separator: " ")
}

startProgram()
