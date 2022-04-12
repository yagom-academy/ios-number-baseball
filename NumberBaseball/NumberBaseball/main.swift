//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var candidateNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]

let totalAnswerNumbers = 3

var answerNumbers: [Int] = []

var remainingOpportunity = 9

func makeRandomNumbers(in numbers: [Int]) -> [Int] {
    var result: [Int] = []
    result = numbers.shuffled()
    result.removeSubrange(0...result.count - totalAnswerNumbers - 1)
    return result
}

func printTryNumbers(whichIs numbers: [Int]) {
    print("임의의 수 : ", terminator: "")
    
    for number in numbers {
        print(number, terminator: " ")
    }
    print()
}

