//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


let totalAnswerNumbers = 3

var answerNumbers: [Int] = []

var remainingOpportunity = 9

func makeRandomNumbers() -> [Int] {
    let candidateNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    var result: [Int] = []
    result = candidateNumbers.shuffled()
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

func strikeOrBall(com: [Int], user: [Int]) -> (strike: Int, ball: Int){
    var strike: Int = 0
    var ball: Int = 0

    for index in 0...2{
        if com[index] == user[index]{
            strike += 1
        } else if com.contains(user[index]){
            ball += 1
        }
    }
    return (strike, ball)
}

func playGame() {
    let answerNumbers = makeRandomNumbers()
    var opportunityCount = 9
    
    while opportunityCount != 0 {
        opportunityCount -= 1
        
        let tryNumbers = makeRandomNumbers()
        let strike = strikeOrBall(com: answerNumbers, user: tryNumbers).strike
        let ball = strikeOrBall(com: answerNumbers, user: tryNumbers).ball
        
        printTryNumbers(whichIs: tryNumbers)
        print("\(strike) 스트라이크, \(ball) 볼")
        print("남은 기회: \(opportunityCount)")
        print()
        
        if strike == 3 {
            print("플레이어 승리...!")
            return
        }
    }
    print("컴퓨터 승리...!")
}

playGame()
