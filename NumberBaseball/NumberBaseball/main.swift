//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var playerNumbers: [Int] = []
var computerNumbers: [Int] = []
var matchCount: Int = 9
var targetStrikeCount: Int = 3

func generateRandomNumbers(from startNumber: Int = 1, to endNumber: Int = 9, quantity: Int = 3) -> [Int] {
    var numbers: Set<Int> = []

    while numbers.count < quantity {
        numbers.insert(Int.random(in: startNumber...endNumber))
    }
    return Array(numbers)
}

func checkStrikeCount() -> Int {
    var strikeCount: Int = 0
    
    for (playerNumber, computerNumber) in zip(playerNumbers, computerNumbers) {
        increase(in: &strikeCount) { () -> Bool in
            return playerNumber == computerNumber
        }
    }
    return strikeCount
}

func checkBallCount() -> Int {
    var ballCount: Int = 0
    
    for (index, number) in playerNumbers.enumerated() {
        increase(in: &ballCount) { () -> Bool in
            return number != computerNumbers[index] && computerNumbers.contains(number)
        }
    }
    return ballCount
}

func increase(in count: inout Int, condition: () -> Bool) {
    if condition() {
        count += 1
    }
}

func convertArrayToString(of values: [Int]) -> String {
    return values.map { "\($0)" }.joined(separator: " ")
}

func playNumberBaseBallGame() {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    computerNumbers = generateRandomNumbers()
    
    while matchCount > 0 {
        print("임의의 수 : ", terminator: "")
        
        playerNumbers = generateRandomNumbers()
        print(convertArrayToString(of: playerNumbers))
        
        strikeCount = checkStrikeCount()
        ballCount = checkBallCount()
        
        matchCount -= 1
        
        displayScoreBoard(&strikeCount, &ballCount)
    }
}

func displayScoreBoard(_ strikeCount: inout Int, _ ballCount: inout Int) {
    if strikeCount == targetStrikeCount {
        matchCount = 0
        print("사용자 승리!")
        return
    } else if matchCount == 0 {
        print("컴퓨터 승리...!")
        return
    }
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    print("남은 기회 : \(matchCount)")
}

func main() {
    playNumberBaseBallGame()
}

main()
