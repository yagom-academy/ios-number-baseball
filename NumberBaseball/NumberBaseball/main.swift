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

func printRandomNumbers(_ randomNumbers: [Int]) {
    let stringArray = randomNumbers.map{String($0)} //buffers
    let joinedString = stringArray.joined(separator: " ")
    print("임의의 수 : \(joinedString)")
}

func isStrike(_ userNumbers: [Int], _ computerNumbers: [Int], at index: Int) -> Bool {
    if userNumbers[index] == computerNumbers[index] {
        return true
    } else {
        return false
    }
}

func checkStrikeAndBallCount(userNumbers: [Int], computerNumbers: [Int]) -> (Int, Int) {
    let strikesAndBalls = Set(userNumbers).intersection(Set(computerNumbers))
    var strikeCount = 0
    for bat in 0..<userNumbers.count {
        strikeCount += isStrike(userNumbers, computerNumbers, at: bat) ? 1 : 0
    }
    let ballCount = strikesAndBalls.count - strikeCount
    return (strikeCount, ballCount)
}

func isUserWin(_ userNumbers: [Int],_ computerNumbers: [Int]) -> Bool {
    let gameResult: (strike:Int, ball:Int)
    var userWin = false
    gameResult = checkStrikeAndBallCount(userNumbers: userNumbers, computerNumbers: computerNumbers)
    print("\(gameResult.strike) 스트라이크, \(gameResult.ball) 볼")
    if gameResult.strike == userNumbers.count {
        userWin = true
    }
    return userWin
}

func printWinner(name: String) {
    print("\(name) 승리...!")
}

func isGameOver(gameCount: Int, userWin: Bool) -> Bool{
    if userWin {
        printWinner(name: "사용자")
        return true
    } else if !userWin && gameCount > 0 {
        print("남은 기회 : \(gameCount)")
        return false
    } else {
        print("남은 기회 : \(gameCount)")
        printWinner(name: "컴퓨터")
        return true
    }
}

func gameStart() {
    let computerNumbers = generateRandomNumbers()
    var remainGameCount: Int = 200
    var userNumbers = [Int]()
    var userWin = false
    var gameOver = false
    while remainGameCount > 0 && !gameOver {
        userNumbers = generateRandomNumbers()
        printRandomNumbers(userNumbers)
        userWin = isUserWin(userNumbers, computerNumbers)
        remainGameCount -= 1
        gameOver = isGameOver(gameCount: remainGameCount, userWin: userWin)
    }
    return
}

gameStart()







