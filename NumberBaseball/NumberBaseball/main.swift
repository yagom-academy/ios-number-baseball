//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func CreateRandomNums() -> [Int] {
    var createdNums = [Int]()
    
    while createdNums.count < 3 {
        let createdRandomNum = Int.random(in:1...9)
        
        if createdNums.contains(createdRandomNum) {
            continue
        } else {
            createdNums.append(createdRandomNum)
        }
    }
    
    return createdNums
}

func ReturnResult() -> [Int] {
    let randomNums = CreateRandomNums()
    var strike = 0
    var ball = 0
    var result = [Int]()
    
    for i in 0...2 {
        if nums[i] == randomNums[i] {
            strike += 1
        } else if randomNums.contains(nums[i]) {
            ball += 1
        }
    }
    
    result.append(strike)
    result.append(ball)
    
    return result
}

let nums = [Int]()
var tryNum = 9
