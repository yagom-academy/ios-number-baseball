//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var playerNumbers: [Int] = []
var computerNumbers: [Int] = []
var matchCount: Int = 9
var computerOut: Int = 3

func generateRandomNumbers(from startNumber: Int = 1, to endNumber: Int = 9, quantity: Int = 3) -> [Int] {
    var numbers: Set<Int> = []

    while numbers.count < quantity {
        numbers.insert(Int.random(in: startNumber...endNumber))
    }
    return Array(numbers)
}

func makeMatchScore(_ strikeCount: Int, _ ballCount: Int) -> String {
    return "\(strikeCount) 스트라이크, \(ballCount) 볼"
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
    
    for match in stride(from: matchCount, to: 0, by: -1) {
        print("임의의 수 : ", terminator: "")

        playerNumbers = generateRandomNumbers()
        print(convertArrayToString(of: playerNumbers))
        
        strikeCount = checkStrikeCount()
        ballCount = checkBallCount()
        
        if strikeCount == computerOut {
            print("사용자 승리!")
            break
        } else if match == 1 {
            print("컴퓨터 승리...!")
        }
        
        print(makeMatchScore(strikeCount, ballCount))
        print("남은 기회 : \(match - 1)")
    }
}

func main() {
    playNumberBaseBallGame()
}

main()
