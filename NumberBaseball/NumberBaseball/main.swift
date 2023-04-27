//
//  NumberBaseball - main.swift
//  Created by redmango & dasanKim.
//  Copyright © yagom academy. All rights reserved.
//

func createRandomNumbers() -> [Int] {
    var uniqueRandomNumbers = Set<Int>()
    
    while uniqueRandomNumbers.count < 3 {
        uniqueRandomNumbers.insert(Int.random(in: 1...9))
    }
    return Array(uniqueRandomNumbers)
}

func compare(_ computerRandomNumbers: [Int], and userNumbers: [Int]) -> (strikeCount: Int, ballCount: Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    for index in 0..<computerRandomNumbers.count {
        if computerRandomNumbers[index] == userNumbers[index] {
            strikeCount += 1
        } else if computerRandomNumbers.contains(userNumbers[index]){
            ballCount += 1
        }
    }
    return (strikeCount: strikeCount, ballCount: ballCount)
}

func judgeWinner(by strikeCount: Int, _ remainingChance: Int, winCondition: Int) -> String {
    var winner: String = String()
    
    if strikeCount == winCondition {
        winner = "USER"
    } else if remainingChance == 0 {
        winner = "COMPUTER"
    }
    return winner
}

func startBaseballGame() {
    let computerRandomNumbers: [Int] = createRandomNumbers()
    var userRandomNumbers = [Int]()
    var remainingChance: Int = 9
    
    while remainingChance > 0 {
        remainingChance -= 1
        userRandomNumbers = createRandomNumbers()
        
        let gameResult: (strikeCount: Int, ballCount: Int) = compare(computerRandomNumbers, and: userRandomNumbers)
        
        print("임의의 수 : \(userRandomNumbers.map{ String($0) }.joined(separator: " "))")
        print("\(gameResult.strikeCount) 스트라이크, \(gameResult.ballCount) 볼")
        
        let winner: String = judgeWinner(by: gameResult.strikeCount, remainingChance, winCondition: computerRandomNumbers.count)
        
        if winner.isEmpty {
            print("남은 기회: \(remainingChance)")
        } else {
            print("\(winner) WIN!!")
            break
        }
    }
}

startBaseballGame()
