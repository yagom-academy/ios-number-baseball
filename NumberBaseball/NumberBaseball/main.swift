//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

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
  
    for index in 0...2 {
        if answer[index] == attempt[index] {
            strike += 1
        } else if answer.contains(attempt[index]) {
            ball += 1
        }
    }
    
    if strike == 3 {
        return "사용자 승리...!"
    }
    
    return "\(strike) 스트라이크, \(ball) 볼"
    
}

func gameStart() {
    while leftCount > 0 {
        leftCount -= 1
        print("임의의 수 : \(query[0]) \(query[1]) \(query[2])")
        
        if leftCount == 0 && answer != query {
            print("컴퓨터 승리...!")
        }
        
        print(answerJudge(attempt: query))
        print("남은 기회 : \(leftCount)")
        query = numGenerator()
    }
}

gameStart()
