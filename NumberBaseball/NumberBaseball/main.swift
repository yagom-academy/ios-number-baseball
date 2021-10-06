//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomTargetNums: [Int] = generateUniqueRandomNums(start: 1, end: 9)
var randomPlayerNums: [Int] = [Int]()

var remainingCounts = 9
var strikeCount = 0
var ballCount = 0

func countStrikeAndBall(index: Int) {
    if randomTargetNums[index] == randomPlayerNums[index] {
        strikeCount += 1
    } else if randomTargetNums.contains(randomPlayerNums[index]) {
        ballCount += 1
    }
}

func readStrikeAndBall() {
    for time in 0..<randomTargetNums.count {
        countStrikeAndBall(index: time)
    }
}

func printStrikeAndBall() {
    print("\(strikeCount)스트라이크 \(ballCount)볼")
}

func generateUniqueRandomNums(start: Int, end: Int) -> [Int] {
    var randomNums = [Int]()
    
    while randomNums.count < 3 {
        let num = Int.random(in: start...end)
        guard !randomNums.contains(num) else {
            continue
        }
        randomNums.append(num)
    }
    
    return randomNums
}

