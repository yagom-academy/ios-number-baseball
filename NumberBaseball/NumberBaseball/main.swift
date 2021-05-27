//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func generateRandom3() -> [Int] {
    var randomSet = Set<Int>()
    
    while randomSet.count < 3 {
        let number = Int.random(in: 1...9)
        randomSet.insert(number)
    }
     return Array(randomSet)
    
}

func compare(_ answer: [Int], _ userInput: [Int]) -> (Int,Int) {
    var strike = 0
    var ball = 0
    
    for i in 0...2 {
        strike += answer[i] == userInput[i] ? 1 : 0
    }
    for i in 0...2 {
        ball += answer.contains(userInput[i]) && answer[i] != userInput[i] ? 1 : 0
    }
    
    return (strike, ball)
}

func starStep1Game() {
    var remainingChances = 9
    let answer = generateRandom3()
    var userInput = generateRandom3()
    
    while remainingChances > 0 {
        let strikeAndBall = compare(answer, userInput)
        print("임의의 수 : \(userInput[0]) \(userInput[1]) \(userInput[2])")
        print("\(strikeAndBall.0) 스트라이크,\(strikeAndBall.1) 볼")
        
        if strikeAndBall.0 == 3 {
            return
        }
        
        remainingChances -= 1
        print("남은 기회 : \(remainingChances)")
        userInput = generateRandom3()
    }
    return
    
}
starStep1Game()



