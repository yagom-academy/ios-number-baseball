//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func createThreeRandomNumbers() -> [Int] {
    var returnNumbers: [Int] = []
    
    while returnNumbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !isDuplicated(compareNumbers: returnNumbers, compareNumber: randomNumber) {
            returnNumbers.append(randomNumber)
        }
    }
    return returnNumbers
}

func isDuplicated(compareNumbers: Array<Int>, compareNumber: Int) -> Bool {
    
    if compareNumbers.count == 0 {
        return false
    }
    for arrayIndex in 0..<compareNumbers.count {
        if compareNumbers[arrayIndex] == compareNumber {
            return true
        }
    }
    return false
}

func getScore(answerNumbers: Array<Int>, guessNumbers: Array<Int>) -> (strike: Int, ball: Int) {
    var strike = 0
    var ball = 0
    
    for answerIndex in 0..<answerNumbers.count {
        for guessIndex in 0..<guessNumbers.count {
            //스트라이크: 순서와 숫자가 모두 일치할때
            if answerNumbers[answerIndex] == guessNumbers[guessIndex] && answerIndex == guessIndex {
                strike += 1
            }
            //ball: 숫자는 일치하는대 순서는 다를때
            else if answerNumbers[answerIndex] == guessNumbers[guessIndex] && answerIndex != guessIndex {
                ball += 1
            }
        }
    }
    return (strike, ball)
}
