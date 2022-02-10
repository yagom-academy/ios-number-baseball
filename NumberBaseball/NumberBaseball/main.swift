//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var playerNumbers: Set<Int> = Set()
var computerNumbers: Set<Int> = Set()
var matchCount: Int = 9
var computerOut: Int = 3

func generateRandomThreeNumbers() -> Set<Int> {
    var numbers: Set<Int> = Set()
    
    while numbers.count < 3 {
        numbers.insert(Int.random(in: 1...9))
    }
    return numbers
}

func makeMatchScore(_ strikeCount: Int, _ ballCount: Int) -> String {
    return "\(strikeCount) 스트라이크, \(ballCount - strikeCount) 볼"
}

func checkStrikeCount() -> Int {
    var strikeCount: Int = 0
    
    for (playerNumber, computerNumber) in zip(playerNumbers, computerNumbers) {
        if playerNumber == computerNumber {
            strikeCount += 1
        }
    }
    return strikeCount
}

func checkBallCount() -> Int {
    return computerNumbers.intersection(playerNumbers).count
}

func convertSetToString(of values: Set<Int>) -> String {
    return values.map { "\($0)" }.joined(separator: " ")
}

func playNumberBaseBallGame() {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    computerNumbers = generateRandomThreeNumbers()
    
    for match in stride(from: matchCount, to: 0, by: -1) {
        print("임의의 수 : ", terminator: "")

        playerNumbers = generateRandomThreeNumbers()
        print(convertSetToString(of: playerNumbers))
        
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
