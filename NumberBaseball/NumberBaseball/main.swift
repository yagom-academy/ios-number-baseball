//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

private func generateRandomNumbers() -> Set<Int> {
    var randomNumbers: Set<Int> = []
    
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1..<10))
    }

    return randomNumbers
}

private func calculateStrikeBall(from computerNumbers: Set<Int>, and playerNumbers: Set<Int>) -> (strikeCount: Int, ballCount: Int) {
    let maximumBallCount = computerNumbers.intersection(playerNumbers).count
    var strikeCount = 0
    let computerNumbers = Array(computerNumbers)
    let playerNumbers = Array(playerNumbers)
    
    for i in 0..<3 {
        let count = (computerNumbers[i] == playerNumbers[i] ? 1 : 0)
        strikeCount += count
    }
    
    let ballCount = maximumBallCount - strikeCount
    
    return (strikeCount, ballCount)
}

private func getGameResult(by strikeCount: Int) -> Bool {
    return strikeCount == 3
}

private func createPlayerNumbersString(with playerNumbers: Set<Int>) -> String {
    let playerNumbers = Array(playerNumbers)
    var playerNumbersString = "임의의 수 :"
    
    for number in playerNumbers {
        playerNumbersString += " \(number)"
    }

    return playerNumbersString
}

private func printGameResult(by playerHasWon: Bool) {
    let target = playerHasWon ? "사용자" : "컴퓨터"
    print("\(target) 승리하였습니다...!")
}

private func startNumberBaseballGame() {
    var remainingChance = 9
    let computerNumbers = generateRandomNumbers()
    var playerHasWon = false
    
    while remainingChance > 0 {
        let playerNumbers = generateRandomNumbers()
        print(createPlayerNumbersString(with: playerNumbers))
        
        let (strikeCount, ballCount) = calculateStrikeBall(from: computerNumbers, and: playerNumbers)
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        
        playerHasWon = getGameResult(by: strikeCount)
        if playerHasWon { break }
        
        remainingChance -= 1
        print("남은 기회 : \(remainingChance)")
    }
    printGameResult(by: playerHasWon)
}

startNumberBaseballGame()
