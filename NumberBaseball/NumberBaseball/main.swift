//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 변수 - 남은 시도횟수, (볼), 스트라이크 횟수, 임의의 정수 3개를 담을 변수

var remainingAttempts: Int = 9

var targetNumbers: [Int] = generateRandomNumbers()

var ballCount: Int

var strikeCount: Int

func generateRandomNumbers() -> [Int] {
    var radomNumbers: Set<Int> = []
    
    while radomNumbers.count < 3 {
        let number: Int = Int.random(in: 1...9)
        radomNumbers.insert(number)
    }
    return Array(radomNumbers)
}

func countMatchingNumbers(target: [Int], player: [Int]) -> Int {
    let target = Set<Int>(target)
    let player = Set<Int>(player)
    let count = target.intersection(player).count
    return count
}

func calculateStrikeCount(target: [Int], player: [Int]) -> Int {
    let resultArray: [Int] = target.filter{ player.contains($0) }
    return resultArray.count
}

func calculateStrikeAndBall(targetNumbers: [Int], playerNumbers: [Int]) -> (Int, Int) {
    let total: Int = countMatchingNumbers(target: targetNumbers, player: playerNumbers)
    let strikes: Int = calculateStrikeCount(target: targetNumbers, player: playerNumbers)
    let ball = total - strikes
    
    return (strikes, ball)
}

func playinning() {
    
    let playerNumbers = generateRandomNumbers()
    print("임의의 수 : \(playerNumbers[0]) \(playerNumbers[1]) \(playerNumbers[2])")
    let (strikeCount, ballCount) = calculateStrikeAndBall(targetNumbers: targetNumbers, playerNumbers: playerNumbers)
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    remainingAttempts -= 1
    print("\(remainingAttempts)")
     
}






