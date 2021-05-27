//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func createThreeRandomNumbers() -> [Int] {
    var randomSet = Set<Int>()
    
    while randomSet.count < 3 {
        let number = Int.random(in: 1...9)
        randomSet.insert(number)
    }
     return Array(randomSet)
    
}

func compare(answers: [Int], userInputs: [Int]) -> (strikes: Int,balls: Int) {
    var strikes = 0
    var balls = 0
    
    for i in 0...2 {
        strikes += answers[i] == userInputs[i] ? 1 : 0
    }
    for i in 0...2 {
        balls += answers.contains(userInputs[i]) && answers[i] != userInputs[i] ? 1 : 0
    }
    
    return (strikes, balls)
}



func starStep1Game() {
    var remainingChances = 9
    let answers = createThreeRandomNumbers()
    var userInputs = createThreeRandomNumbers()
    
    while remainingChances > 0 {
        let strikeAndBall = compare(answers: answers, userInputs: userInputs)
        print("임의의 수 : \(userInputs[0]) \(userInputs[1]) \(userInputs[2])")
        print("\(strikeAndBall.strikes) 스트라이크,\(strikeAndBall.balls) 볼")
        
        remainingChances -= 1
        print("남은 기회 : \(remainingChances)")
        userInputs = createThreeRandomNumbers()
        
        remainingChances = strikeAndBall.strikes == 3 ? -1 : remainingChances
        
    }
    if remainingChances < 0 {
        print("사용자 승리!")
        return
    }
    print("컴퓨터 승리!")
    return
    
}
starStep1Game()


