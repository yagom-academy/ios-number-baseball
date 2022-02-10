//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


var numbersByComputer: [Int] = []
var numberOfChance: Int = 9
var numbersByUser: [Int] = []
var strikeCount: Int = 0
var ballCount: Int = 0

func generateRandomNumbers() -> [Int] {
    var numberArray: [Int] = []
    var numberPool: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    for _ in 1...3 {
        numberArray.append(numberPool[Int.random(in: 0..<numberPool.count)])
        numberPool = numberPool.filter({ !numberArray.contains($0) })
    }

    return numberArray
}

func judgeGameResult() {
    strikeCount = 0
    ballCount = 0
    
    for index in 0...2 {
        if numbersByUser[index] == numbersByComputer[index] {
            strikeCount += 1
        } else if numbersByComputer.contains(numbersByUser[index]) {
            ballCount += 1
        }
    }
}

func startGame() {
    numbersByComputer = generateRandomNumbers()
    
    while(numberOfChance > 0 && strikeCount < 3) {
        numbersByUser = generateRandomNumbers()
        let convertedNumbers = numbersByUser.map({ String($0) })
        print("임의의 수 :", convertedNumbers.joined(separator: " "))
        judgeGameResult()
        
        if strikeCount == 3 {
            print("사용자 승리!")
            print("\(strikeCount) 스트라이크, \(ballCount) 볼")
            break
        }

        if (numberOfChance - 1) == .zero {
            print("컴퓨터 승리...!")
            print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        }
        
        numberOfChance -= 1
        print("남은 기회 : \(numberOfChance)")
    }
}

startGame()
