//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var playerNums: Set<Int> = Set()
var computerNums: Set<Int> = Set()
var matchCount: Int = 9

func generateComputerNums() -> Set<Int> {
    var nums: Set<Int> = Set()
    while nums.count < 3 {
        nums.insert(Int.random(in: 1...9))
    }
    return nums
}

func generatePlayerNums() -> Set<Int> {
    var nums: Set<Int> = Set()
    while nums.count < 3 {
        nums.insert(Int.random(in: 1...9))
    }
    return nums
}

func matchNums() {
    var strikeNums: Int = 0
    var ballNums: Int = 0
    
}
func matchStrikeNums() -> Int {
    var matchStrikeCount: Int = 0
    
    for (playerNum, computerNum) in zip(playerNums, computerNums) {
        if playerNum == computerNum {
            matchStrikeCount += 1
        }
    }
    return matchStrikeCount
}

func matchBallNums() -> Int {
    var matchBallCount: Int = 0
    
    for playerNum in playerNums {
        if computerNums.contains(playerNum) {
            matchBallCount += 1
        }
    }
    
    return matchBallCount
}

func main() {
    
    while matchCount > 0 {
        print("임의의 수 : ", terminator: "")
        
        computerNums = generateComputerNums()
        playerNums = generatePlayerNums()
        print(playerNums)
        matchCount -= 1
        let matchStrikeCount = matchStrikeNums()
        let matchBallCount = matchBallNums()
        
        print("\(matchStrikeCount) 스트라이크, \(matchBallCount) 볼")
        
    }
}

main()
