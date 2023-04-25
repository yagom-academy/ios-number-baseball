//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func generateRandomNumber() -> Int {
    return Int.random(in: 1...9)
}

func drawRandomNumbers() -> [Int] {
    var uniqueRandomNumbers: Set<Int> = []
    var randomNumbers: [Int] = []
    var randomNumber: Int = 0
    
    while randomNumbers.count < 3 {
        randomNumber = generateRandomNumber()
        
        if uniqueRandomNumbers.insert(randomNumber).inserted {
            randomNumbers.append(randomNumber)
        }
    }
    
    return randomNumbers
}

func checkMatchingCount(with computerRandomNumbers: [Int], _ userRandomNumbers: [Int]) -> Int {
    return Set(computerRandomNumbers).intersection(userRandomNumbers).count
}

func checkStrikeCount(with computerRandomNumbers: [Int], _ userRandomNumbers: [Int]) -> Int {
    return (0..<computerRandomNumbers.count).filter { computerRandomNumbers[$0] == userRandomNumbers[$0] }.count
}

func checkBallCount(matching matchCount: Int, strike strikeCount: Int) -> Int {
    return matchCount - strikeCount
}

func playBaseballGame() {
    let computerRandomNumbers: [Int] = drawRandomNumbers()
    var remainCount: Int = 9
    
    while remainCount > 0 {
        let userRandomNumbers = drawRandomNumbers()
        let matchCount = checkMatchingCount(with: computerRandomNumbers, userRandomNumbers)
        let strikeCount = checkStrikeCount(with: computerRandomNumbers, userRandomNumbers)
        let ballCount = checkBallCount(matching: matchCount, strike: strikeCount)
        remainCount -= 1
        
        print("임의의 수 : \(userRandomNumbers.map { String($0) }.joined(separator: " "))")
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        
        if strikeCount != 3 && remainCount == 0 {
            print("컴퓨터 승리...!")
            return
        } else if strikeCount == 3 {
            print("사용자 승리!!!!")
            return
        } else {
            print("남은 기회 : \(remainCount)")
        }
    }
}

//MARK: 실행
playBaseballGame()
