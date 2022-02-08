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
    while nums.count <= 3 {
        nums.insert(Int.random(in: 1...9))
    }
    return nums
}

func generatePlayerNums() {
    playerNums = Set()
    
    if playerNums.count != 3 {
        playerNums.insert(Int.random(in: 1...9))
    }
}

/*
func validatePlayerNum(from userInput) {
    
}
*/

func main() {
    print("임의의 수 : ", terminator: "")
    generatePlayerNums()
    print(playerNums)
    //guard let input = readLine() else { return }
    //let playerInput = input.split(separator: " ")
}

func matchNums() -> String {
    var strikeNums: Int = 0
    var ballNums: Int = 0
    
}

func matchBallNums() -> Int {
    var matchPlayerNums: Set<Int> = Set()
    
    for index in 0...computerNums.count {
        matchPlayerNums = playerNums.filter { $0 == computerNums["\(index)"] }
    }
    
    return matchPlayerNums.count
}

