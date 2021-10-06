//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

//MARK: - Step 1

/// 1. 변수 설정
/// 2. 난수 3개 생성하는 함수 구현
///   - 중복된 숫자가 없어야한다
///   - 1~9 사이의 숫자여야 한다
/// 3. 게임 시작 함수 구현

private func generateRandomNumbers() -> Set<Int> {
    var randomNumbers: Set<Int> = []
    
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1..<10))
    }
    
    return randomNumbers
}

private func calculateStrikeBall(from computerNumbers: Set<Int>, from playerNumbers: Set<Int>) -> Bool {
    var ballCount = computerNumbers.intersection(playerNumbers).count
    var strikeCount = 0
    let computerNumbers = Array(computerNumbers)
    let playerNumbers = Array(playerNumbers)
    
    for i in 0..<3 {
        if computerNumbers[i] == playerNumbers[i] {
            strikeCount += 1
            ballCount -= 1
        }
    }
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    if strikeCount == 3 {
        return true
    }
    return false
}

private func createString(with numbers: Set<Int>) -> String {
    let numbers = Array(numbers)
    return "임의의 수 : \(numbers[0]) \(numbers[1]) \(numbers[2])"
}

private func startGame() {
    var chance = 9
    let computerNumbers = generateRandomNumbers()
    var playerWins = false
    
    while chance > 0 {
        let playerNumbers = generateRandomNumbers()
        print(createString(with: playerNumbers))
        if calculateStrikeBall(from: computerNumbers, from: playerNumbers) {
            playerWins = true
            break
        } else {
            chance -= 1
            print("남은 기회: \(chance)")
        }
    }
    
    if playerWins {
        print("사용자 승리...!")
    } else {
        print("컴퓨터 승리...!")
    }
}

startGame()
