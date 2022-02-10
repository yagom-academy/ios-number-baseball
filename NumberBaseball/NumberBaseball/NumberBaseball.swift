//
//  STEP1.swift
//  NumberBaseball
//
//  Created by 조성훈 on 2022/02/09.
//

import Foundation

var computerNumbers: [Int] = []
var playerNumbers: [Int] = []
var roundCount: Int = 9
var strike: Int = 0
var ball: Int = 0

func startGame() {
    while roundCount > 0 {
        saveComputerNumbers()
        savePlayerNumbers()
        checkScoreCondition()
        checkGameResult()
        resetValue()
    }
}

func checkGameResult() {
    if roundCount == 0 {
        print("컴퓨터 승리🤣")
    } else if strike == 3 {
        print("유저 승리❤️")
        roundCount = 0
    }
}

func generateRandomNumber() -> Int {
    return Int.random(in: 1...9)
}

func saveComputerNumbers() {
    while computerNumbers.count < 3 {
        compareComputerNumbers()
    }
}

func compareComputerNumbers() {
    let randomNumber = generateRandomNumber()
    if computerNumbers.contains(randomNumber) == false {
        computerNumbers.append(randomNumber)
    }
}

func savePlayerNumbers() {
    while playerNumbers.count < 3 {
        comparePlayerNumbers()
    }
}

func comparePlayerNumbers() {
    let randomNumber = generateRandomNumber()
    if playerNumbers.contains(randomNumber) == false {
        playerNumbers.append(randomNumber)
    }
}

func printRandomNumbers() {
    print("\n컴퓨터 임의의 수 : ", terminator: "") // 테스트를 위한 텍스트, 삭제해야하는 줄
    computerNumbers.forEach{ print($0, terminator: " ") } // 테스트를 위한 텍스트, 삭제해야하는 줄
    print("\n유저 임의의 수 : ", terminator: "")
    playerNumbers.forEach{ print($0, terminator: " ") }
}

func checkScoreCondition() {
    let sameNumbers = computerNumbers.filter{ playerNumbers.contains($0) }
    for element in 0..<3 {
        checkStrikeCondition(element: element)
    }
    checkBallCondition(sameNumbers: sameNumbers.count)
    printRandomNumbers()
    printScoreInformation()
}

func checkStrikeCondition(element: Int) {
    if computerNumbers[element] == playerNumbers[element] {
        strike += 1
    }
}

func checkBallCondition(sameNumbers: Int) {
    ball = sameNumbers - strike
}

func printScoreInformation() {
    print("\n\(strike) 스트라이크, \(ball) 볼")
    roundCount -= 1
    print("남은 기회 : \(roundCount)")
}

func resetValue() {
    computerNumbers.removeAll()
    playerNumbers.removeAll()
    strike = 0
    ball = 0
}
