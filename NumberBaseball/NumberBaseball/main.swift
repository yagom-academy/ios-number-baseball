//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func generateNumbers() -> Set<Int> {
    var randomNumber = Set<Int>()
    
    while randomNumber.count < 3 {
        randomNumber.insert(Int.random(in: 1...9))
    }
    return randomNumber
}

func checkStrikeOrBall( answerNumber: Array<Int>, count: Int) {
    let suggestNumber = Array<Int>(generateNumbers())
    var strikeCount = 0
    var ballCount = 0
    
    if answerNumber[0] == suggestNumber[0] {
        strikeCount += 1
    } else if suggestNumber.contains(answerNumber[0]) {
        ballCount += 1
    }
    if answerNumber[1] == suggestNumber[1] {
        strikeCount += 1
    } else if suggestNumber.contains(answerNumber[1]) {
        ballCount += 1
    }
    if answerNumber[2] == suggestNumber[2] {
        strikeCount += 1
    } else if suggestNumber.contains(answerNumber[2]) {
        ballCount += 1
    }
}

