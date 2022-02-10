//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let winnerGoalCount = 3
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
            let intValue = Int(menuInput)
    else {
        print("입력이 잘못되었습니다")
        return .zero
    }
    
    return intValue
}

func runSelectedMenu(menuInput: Int) {
    switch menuInput {
    case 1:
        startGame()
    case 2:
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
        let userNumbers = generatedThreeRandomNumbers()
        let stringTypeUserNumbers = convertIntArrayToString(intArray: userNumbers)
        
        strikeCount = 0
        ballCount = 0
        
        judgeBallOrStrike(targetNumbers: randomNumbers, userNumbers: userNumbers)
        
        matchCount -= 1

        print("임의의 수 : \(stringTypeUserNumbers)")
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        print("남은 기회 : \(matchCount)")
    }
    showGameResult()
}

func generatedThreeRandomNumbers() -> [Int] {
    var extractedNumbers: Set<Int> = []
    let limitCount = 3
    
    while extractedNumbers.count != limitCount {
        extractedNumbers.insert(generateRandomNumber())
    }
    
    return Array(extractedNumbers)
}

func generateRandomNumber(numberRange: ClosedRange<Int> = (1...9)) -> Int {
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

startGame()
