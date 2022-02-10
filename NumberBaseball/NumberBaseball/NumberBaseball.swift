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
var strike = 0
var ball = 0

func startGame() {
    while roundCount > 0 {
        saveComputerNumbers()
        savePlayerNumbers()
        checkTotalStatus()
        if roundCount == 0 {
            print("컴퓨터 승리🤣")
        } else if roundCount > 0 && strike == 3 {
            print("유저 승리❤️")
            break
        }
        resetValue()
    }
}

func resetValue() {
    computerNumbers.removeAll()
    playerNumbers.removeAll()
    strike = 0
    ball = 0
}

func generateRandomNumber() -> Int {
    return Int.random(in: 1...9)
}

func saveComputerNumbers() {
    while computerNumbers.count < 3 {
        compareComputerNumbers()
    }
}

func savePlayerNumbers() {
    while playerNumbers.count < 3 {
        comparePlayerNumbers()
    }
}

func printRandomNumbers() {
    print("\n컴퓨터 임의의 수 : ", terminator: "")
    computerNumbers.forEach{ print($0, terminator: " ") }
    print("\n유저 임의의 수 : ", terminator: "")
    playerNumbers.forEach{ print($0, terminator: " ") }
}

func compareComputerNumbers() {
    let randomNum = generateRandomNumber()
    if computerNumbers.contains(randomNum) == false {
        computerNumbers.append(randomNum)
    }
}

func comparePlayerNumbers() {
    let randomNum = generateRandomNumber()
    if playerNumbers.contains(randomNum) == false {
        playerNumbers.append(randomNum)
    }
}

func checkTotalStatus() {
    let sameNumbers = computerNumbers.filter{ playerNumbers.contains($0) }
    for element in 0..<3 {
        checkStrikeCondition(element: element)
    }
    checkBallCondition(sameNumbers: sameNumbers.count)
    printRandomNumbers()
    print("\n\(strike) 스트라이크, \(ball) 볼")
    roundCount -= 1
    print("남은 기회 : \(roundCount)")
}

func checkStrikeCondition(element: Int) {
    if computerNumbers[element] == playerNumbers[element] {
        strike += 1
    }
}

func checkBallCondition(sameNumbers: Int) {
    ball = sameNumbers - strike
}

