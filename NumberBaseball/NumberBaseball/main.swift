//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: [Int] = [Int]()
let userNumbers: [Int] = [3, 4, 5]
var trialNumber: Int = 9

func createThreeRandomInt() -> [Int] {
    var result: Set<Int> = Set<Int>()
    while result.count < 3 {
        result.insert(Int.random(in: 1...9))
    }
    
    return Array(result)
}

func compareResult() -> [Int] {
    var ball: Int = 0
    var strike: Int = 0
    computerNumbers = createThreeRandomInt()
    
    for userNumber in userNumbers {
        if computerNumbers.contains(userNumber) {
            ball += 1
        }
    }
    
    for indexs in 0...2 {
        if userNumbers[indexs] == computerNumbers[indexs] {
            strike += 1
        }
    }
    
    ball -= strike
    return [strike, ball]
}
