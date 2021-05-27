//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func generateThreeRandomNumbers() -> [Int] {
    
    
    return []
}

func changeNumbersToString(numbers: [Int]) -> String {
    return numbers.map { element in
        "\(element)"
    }.joined(separator: " ")
}

func getStrikesAndBallsNumber(numbersToCheck numberList: [Int]) -> (strike: Int, ball: Int) {
    
    return (0, 0)
}

func printResult() {
    
}

var answerRandomNumbers: [Int]
var attemptsRemaining: Int = 9
var attemptRandomNumbers: [Int]

answerRandomNumbers = generateThreeRandomNumbers()

while attemptsRemaining > 0 {
    attemptRandomNumbers = generateThreeRandomNumbers()
    let stringSequence = changeNumbersToString(numbers: attemptRandomNumbers)
    print("임의의 수 : \(stringSequence)")
    attemptsRemaining -= 1
    
    
    print("남은 기회 : \(attemptsRemaining)")
}

