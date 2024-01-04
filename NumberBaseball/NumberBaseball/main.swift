//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var comNumbers = [Int]()
var userNumbers = [Int]()
var attemp = 9

func generateRandomNumbers() -> [Int] {
    var setNumber = Set<Int>()
    
    while setNumber.count < 3{
        let randomNumber = Int.random(in: 1...9)
        setNumber.insert(randomNumber)
    }
    
    return [Int](setNumber)
}

func judgeResult(val: [Int]) -> (countStrike: Int, countBall: Int) {
    var countStrike = 0
    var countBall = 0
    
    for i in 0...2 {
        if (comNumbers.contains(userNumbers[i]) && comNumbers[i] == userNumbers[i]) {
            countStrike += 1
        } else if (comNumbers.contains(userNumbers[i])) {
            countBall += 1
        }
    }
    print("\(countStrike) 스트라이크, \(countBall) 볼")
    
    return (countStrike, countBall)
}

func startGame() {
    comNumbers = [Int]()
    userNumbers = [Int]()
    attemp = 9
    comNumbers = generateRandomNumbers()

    print("Computer: \(comNumbers)")
    while attemp > 0 {
        userNumbers = generateRandomNumbers()
        print("임의의 수 : \(userNumbers)")
        
        let result = judgeResult(val: userNumbers)
        
        if result.countStrike == 3 {
            print("WIN!")
            
            return
        }
        attemp -= 1
        print("남은 기회 : \(attemp)")
    }
    print("컴퓨터 승리!")
}

startGame()
