//
//  NumberBaseball - main.swift
//  Created by luyan, hosinging.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func generateRandomNumbers() -> [Int] {
    var randomNumbers: Set = Set<Int>()
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomNumbers)
}

func printNumbers(_ numbers: [Int]) {
    print("임의의 수 : \(numbers.map{String($0)}.joined(separator: " "))")
}

func checkStrike(userNumbers: [Int], to computerNumbers: [Int], index: Int) -> Int {
    if userNumbers[index] == computerNumbers[index] {
        return 1
    } else {
        return 0
    }
}

func checkTotalCalls(userNumbers: [Int], computerNumbers: [Int]) -> Int {
    return Set(userNumbers).intersection(Set(computerNumbers)).count
}

func oneMatch(_ user: [Int],_ computer: [Int]) -> Bool {
    var userWin = false
    let totalCall = checkTotalCalls(userNumbers: user, computerNumbers: computer)
    if totalCall == 0 {
        print("0 스트라이크, 0 볼")
        return userWin
    }
    var strike = 0
    for i in 0..<3 {
        strike += checkStrike(userNumbers: user, to: computer, index: i)
    }
    let ball = totalCall - strike
    print("\(strike) 스트라이크, \(ball) 볼")
    
    if strike == 3 {
        printWinner(name: "사용자")
        userWin = true
    }
    return userWin
}

func printWinner(name: String) {
    print("\(name) 승리...!")
}

func checkGameOver(gameCount: Int, userWin: Bool) {
    if gameCount > 0 && !userWin {
        print("남은 기회 : \(gameCount)")
    }
    else if gameCount == 0 {
        print("남은 기회 : \(gameCount)")
        printWinner(name: "컴퓨터")
    }
}

func gameStart() {
    let computerNumbers = generateRandomNumbers()
    var gameCount: Int = 9
    var userNumbers = [Int]()
    var userWin = false
    while gameCount > 0 && !userWin {
        userNumbers = generateRandomNumbers()
        printNumbers(userNumbers)
        userWin = oneMatch(userNumbers, computerNumbers)
        gameCount -= 1
        checkGameOver(gameCount: gameCount, userWin: userWin)
    }
    return
}

gameStart()







