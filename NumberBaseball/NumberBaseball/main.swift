//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

func generateRandomNumbers() -> [Int] {
    return Array((1...9).shuffled()[0..<3])
}

func calculateRoundResult(computerNumbers: [Int], playerNumbers: [Int]) -> (strikeCount: Int, ballCount: Int) {
    let computerNumbersSet = Set(computerNumbers)
    let playerNumbersSet = Set(playerNumbers)
    
    var strikeCount = 0
    var ballCount = 0
    
    for i in 0..<3 {
        if computerNumbers[i] == playerNumbers[i] {
            strikeCount += 1
        }
    }
    
    ballCount = computerNumbersSet.intersection(playerNumbersSet).count - strikeCount
    
    return (strikeCount: strikeCount, ballCount: ballCount)
}

func runGame() {
    var computerNumbers = generateRandomNumbers()
    var remainedInnings = 9
    
    while remainedInnings > 0 {
        let playerNumbers = generateRandomNumbers()
        
        print("임의의 수 : \(playerNumbers[0]) \(playerNumbers[1]) \(playerNumbers[2])")
        
        let roundResult = calculateRoundResult(computerNumbers: computerNumbers, playerNumbers: playerNumbers)
        let strikeCount = roundResult.strikeCount
        let ballCount = roundResult.ballCount
        
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        
        if strikeCount == 3 {
            print("사용자 승리!")
            return
        }
        
        remainedInnings -= 1
        print("남은 기회 : \(remainedInnings)")
    }
    
    print("컴퓨터 승리...!")
}

runGame()
