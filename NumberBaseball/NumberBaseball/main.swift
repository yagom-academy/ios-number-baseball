//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var playerNums: Set<Int> = Set()
var computerNums: Set<Int> = Set()
var matchCount: Int = 9
var computerOut: Int = 3

func generateRandomThreeNums() -> Set<Int> {
    var nums: Set<Int> = Set()
    
    while nums.count < 3 {
        nums.insert(Int.random(in: 1...9))
    }
    return nums
}

func makeMatchScore(_ strikeCount: Int, _ ballCount: Int) -> String {
    return "\(strikeCount) 스트라이크, \(ballCount - strikeCount) 볼"
}

func checkStrikeCount() -> Int {
    var strikeCount: Int = 0
    
    for (playerNum, computerNum) in zip(playerNums, computerNums) {
        if playerNum == computerNum {
            strikeCount += 1
        }
    }
    return strikeCount
}

func checkBallCount() -> Int {
    return computerNums.intersection(playerNums).count
}

func convertSetToString(of values: Set<Int>) -> String {
    return values.map { "\($0)" }.joined(separator: " ")
}

func playGame() {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    computerNums = generateRandomThreeNums()
    
    for match in stride(from: matchCount, to: 0, by: -1) {
        print("임의의 수 : ", terminator: "")

        playerNums = generateRandomThreeNums()
        print(convertSetToString(of: playerNums))
        
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
    playGame()
}

main()
