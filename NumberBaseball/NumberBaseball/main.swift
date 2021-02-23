//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomAnswer = [Int]()
var count: Int = 9

struct NumberBaseball{
    func randomNumber() -> [Int] {
        var result = [Int]()
        while result.count < 3 {
            let number = Int.random(in: 1...9)
            if result.contains(number) { continue }
            result.append(number)
        }
        return result
    }
    
    func getResult(userInput: [Int], answer: [Int]) -> [Int] {
        var strike: Int = 0
        var ball: Int = 0
        for i in 0..<userInput.count {
            if userInput[i] == answer[i] {
                strike += 1
            } else if answer.contains(userInput[i]){
                ball += 1
            }
        }
        return [strike, ball]
    }
    
    func startGame() {
        let input = randomNumber()
        randomAnswer = randomNumber()
        getResult(userInput: input, answer: randomAnswer)
        count -= 1
    }
}

