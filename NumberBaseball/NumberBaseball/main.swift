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

func generateRandomThreeNumbers() -> [Int] {
    var numbers: Set<Int> = []
    
    while numbers.count < 3 {
        numbers.insert(Int.random(in: 1...9))
    }
    return Array(numbers)
}

func makeMatchScore(_ strikeCount: Int, _ ballCount: Int) -> String {
    return "\(strikeCount) 스트라이크, \(ballCount) 볼"
}

func checkStrikeCount() -> Int {
    var strikeCount: Int = 0
    
    for (playerNumber, computerNumber) in zip(playerNumbers, computerNumbers) {
        increase(in: &strikeCount, playerNumber, computerNumber)
    }
    return strikeCount
}

func increase(in strikeCount: inout Int, _ playerNumber: Int, _ computerNumber: Int) {
    if playerNumber == computerNumber {
        strikeCount += 1
    }
}

func checkBallCount() -> Int {
    var ballCount: Int = 0

    for (index, number) in computerNumbers.enumerated() {
        for i in 0...playerNumbers.count - 1 {
            if index != i && number == playerNumbers[i] {
                ballCount += 1
            }
        }
    }
    return ballCount
}

func convertArrayToString(of values: [Int]) -> String {
    return values.map { "\($0)" }.joined(separator: " ")
}

func playNumberBaseBallGame() {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    computerNumbers = generateRandomThreeNumbers()
    
    for match in stride(from: matchCount, to: 0, by: -1) {
        print("임의의 수 : ", terminator: "")

        playerNumbers = generateRandomThreeNumbers()
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
