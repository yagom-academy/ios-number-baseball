//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerAnswer = createThreeNumber()
var tryCount = 9

func createThreeNumber() -> Array<Int> {
    return Array((1...9).shuffled()[0...2])
}

func baseballResult(answer: [Int]) -> [Int] {
    var ball = 0
    var strike = 0
    for (index, element) in answer.enumerated() {
        if element == computerAnswer[index] {
            strike += 1
        } else if computerAnswer.contains(element) {
            ball += 1
        }
    }
    return [ball, strike]
}
print(computerAnswer)
print(baseballResult(answer: [1,2,3]))
