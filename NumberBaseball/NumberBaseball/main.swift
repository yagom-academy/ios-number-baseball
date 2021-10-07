//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var remainingAttempts: Int = 9
var targetNumbers: [Int] = []
let numbersToGenerate = 3

func generateRandomNumbers() -> [Int] {
    var radomNumbers: Set<Int> = []
    
    while radomNumbers.count < numbersToGenerate {
        let number: Int = Int.random(in: 1...9)
        radomNumbers.insert(number)
    }
    return Array(radomNumbers)
}

func calculateStrikeAndBall(target: [Int], player: [Int]) -> (Int, Int) {
    var strikeCount = 0
    var ballCount = 0
    
    for index in 0..<numbersToGenerate {
        if target[index] == player[index] {
            strikeCount += 1
        } else if target.contains(player[index]){
            ballCount += 1
        }
    }
    return (strikeCount, ballCount)
}

func playInning() -> Int {
    let playerNumbers: [Int] = generateRandomNumbers()
    let numbersToPrint: String = playerNumbers.reduce("") {
        $0 + String($1) + " "
    }
    print("임의의 수 : \(numbersToPrint)" )

    let (strikeCount, ballCount) = calculateStrikeAndBall(target: targetNumbers, player: playerNumbers)
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    return strikeCount
}

func printRemainingAttempts() {
    remainingAttempts -= 1
    print("남은 기회: \(remainingAttempts)")
}

func startGame() {
    targetNumbers = generateRandomNumbers()
    while remainingAttempts > 0 {
        let strikeCount = playInning()
        
        if strikeCount == numbersToGenerate {
            break
        }
        printRemainingAttempts()
    }
    checkGameResult()
}

func checkGameResult() {
    if remainingAttempts == 0 {
        print("컴퓨터 승리...!")
    } else {
        print("사용자 승리!")
    }
}

startGame()



