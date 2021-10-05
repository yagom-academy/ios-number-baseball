//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


var strikeCount = 0

var array1 = [3, 2, 1]
var array2 = [3, 2, 1]

func strikeCounter(a: Int) {
    if array1[a] == array2[a] {
        strikeCount += 1
    }
}

func readStrike() {
    for time in 0...2 {
        strikeCounter(a: time)
    }
    print("\(strikeCount) 스트라이크")
}

var randomTargetNums = generateUniqueRandomNums(start: 1, end: 9)
var randomPlayerNums = generateUniqueRandomNums(start: 1, end: 9)
var remainCounts = 9

func generateUniqueRandomNums(start: Int, end: Int) -> [Int] {
    var randomNums = [Int]()
    
    while randomNums.count < 3 {
        let nums = Int.random(in: start...end)
        guard !randomNums.contains(nums) else {
            continue
        }
        randomNums.append(nums)
    }
    
    return randomNums
}
