//
//  STEP1.swift
//  NumberBaseball
//
//  Created by 조성훈 on 2022/02/09.
//

import Foundation

var randomComputerNumbers: [Int] = []
var randomUserNumbers: [Int] = []
var randomComputerNumbersString: [String] = []
var randomUserNumbersString: [String] = []
var roundCount: Int = 9
var strike = 0
var ball = 0

func startGame() {
    while roundCount > 0 {
        saveComputerNumbers()
        saveUserNumbers()
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
    randomComputerNumbers.removeAll()
    randomUserNumbers.removeAll()
    randomComputerNumbersString.removeAll()
    randomUserNumbersString.removeAll()
    strike = 0
    ball = 0
}

func generateRandomNumber() -> Int {
    return Int.random(in: 1...9)
}

func saveComputerNumbers() {
    while randomComputerNumbers.count < 3 {
        compareComputerNumbers()
    }
}

func saveUserNumbers() {
    while randomUserNumbers.count < 3 {
        compareUserNumbers()
    }
}

func changeIntToStringArray() {
    for stringElement in randomComputerNumbers {
        randomComputerNumbersString.append("\(stringElement)")
    }
    for stringElement in randomUserNumbers {
        randomUserNumbersString.append("\(stringElement)")
    }
}

func printRandomNumbers() {
    changeIntToStringArray()
    let deletedDotComputerNumbers = randomComputerNumbersString.joined(separator: " ")
    let deletedDotUserNumbers = randomUserNumbersString.joined(separator: " ")
    print("\n컴퓨터 임의의 수 : \(deletedDotComputerNumbers)")
    print("유저 임의의 수 : \(deletedDotUserNumbers)")
}

func compareComputerNumbers() {
    let randomNum = generateRandomNumber()
    if randomComputerNumbers.contains(randomNum) == false {
        randomComputerNumbers.append(randomNum)
    }
}

func compareUserNumbers() {
    let randomNum = generateRandomNumber()
    if randomUserNumbers.contains(randomNum) == false {
        randomUserNumbers.append(randomNum)
    }
}

func checkTotalStatus() {
    let sameNumbers = randomComputerNumbers.filter{ randomUserNumbers.contains($0)}
    for element in 0..<3 {
        checkStrike(element: element)
    }
    checkBall(sameNumbers: sameNumbers.count)
    printRandomNumbers()
    print("\(strike) 스트라이크, \(ball) 볼")
    roundCount -= 1
    print("남은 기회 : \(roundCount)")
}

func checkStrike(element: Int) {
    if randomComputerNumbers[element] == randomUserNumbers[element] {
        strike += 1
    }
}

func checkBall(sameNumbers: Int) {
    ball = sameNumbers - strike
}

