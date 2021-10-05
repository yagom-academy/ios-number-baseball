//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

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
