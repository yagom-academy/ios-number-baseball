//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var answer = [Int]()
var remainCount = 9

func generateAnswer() -> [Int] {
    var array = Array(1...9)
    array.shuffle()
    return array[...2].map(){Int($0)}
}

func decideBallCount(comparing answer: [Int], with userNumbers: [Int]) -> [Int] {
    var strikeCount = 0
    var ballCount = 0
    
    for index in 0...2 {
        if userNumbers[index] == answer[index] {
            strikeCount += 1
        } else if answer.contains(userNumbers[index]) {
            ballCount += 1
        }
    }
    return [strikeCount, ballCount]
}



add: error에 Inputvalueerror 추가

