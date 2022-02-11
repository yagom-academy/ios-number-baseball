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
        if isDuplicated(compareNumbers: returnNumbers, newNumber: randomNumber) == false {
            returnNumbers.append(randomNumber)
        }
    }
    return returnNumbers
}

func isDuplicated(compareNumbers: Array<Int>, newNumber: Int) -> Bool {
    if compareNumbers.contains(newNumber) {
        return true
    }
    return false
}

func getScore(answerNumbers: Array<Int>, guessNumbers: Array<Int>) -> (strike: Int, ball: Int) {
    var strike = 0
    var ball = 0
    
    for answerIndex in 0..<answerNumbers.count {
        for guessIndex in 0..<guessNumbers.count {
            if answerNumbers[answerIndex] == guessNumbers[guessIndex] && answerIndex == guessIndex {
                strike += 1
                //스트라이크: 순서와 숫자가 모두 일치할때
            } else if answerNumbers[answerIndex] == guessNumbers[guessIndex] && answerIndex != guessIndex {
                ball += 1
                //ball: 숫자는 일치하는대 순서는 다를때
            }
        }
    }
    return (strike, ball)
}

func playGame() {
    let answerNumbers = createThreeRandomNumbers()
    var trialCount: Int = 9
    
    while trialCount != 0 {
        let guessNumbers = createThreeRandomNumbers()
        let score = getScore(answerNumbers: answerNumbers, guessNumbers: guessNumbers)
        
        print("""
         \(score.strike) 스트라이크, \(score.ball) 볼
         임의의 수 : \(guessNumbers[0]) \(guessNumbers[1]) \(guessNumbers[2])
         """)
        trialCount -= 1
        if score.strike == 3 {
            print("사용자의 승리...!")
            break
        } else if trialCount == 0 {
            print("컴퓨터의 승리...!")
        }
        print("남은 기회 : \(trialCount)")
    }
}

playGame()










