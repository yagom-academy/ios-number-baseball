//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

//컴퓨터가 만드는 숫자
func numGenerator() -> [Int] {
    var randomNumbers = [Int]()
    while randomNumbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !randomNumbers.contains(randomNumber) {
            randomNumbers.append(randomNumber)
        }
    }
    return randomNumbers
}

var answer = numGenerator()
var query = numGenerator()
var leftCount = 9


func answerJudge(attempt: [Int]) -> String {
    
    var strike = 0
    var ball = 0
    let answerSet = Set(answer)
    let querySet = Set(attempt)
    let ballNum = answerSet.intersection(querySet)
    ball = ballNum.count
    
    for index in 0...2 {
        if answer[index] == attempt[index] {
            strike += 1
        }
    }
    
    ball -= strike
    
    return "\(strike) 스트라이크, \(ball) 볼"
    
}

print("answer : \(answer)")
print("query : \(query)")
print(answerJudge(attempt: query))
