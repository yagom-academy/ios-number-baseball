//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var playerNum: Set<Int> = Set()
var computerNum: Set<Int> = Set()
var matchCount: Int = 9

func generateComputerNum() -> Set<Int> {
    var nums: Set<Int> = Set()
    while nums.count <= 3 {
        nums.insert(Int.random(in: 1...9))
    }
    return nums
}

func validatePlayerNum(from userInput) {
    
}

func main() {
    print("임의의 수 : ", terminator: "")
    guard let input = readLine() else { return }
    let playerInput = input.split(separator: " ")
}

