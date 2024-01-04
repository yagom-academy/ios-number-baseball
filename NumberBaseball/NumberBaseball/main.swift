//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var goalNumbers = [Int]()
var attemp = 9
var userNumbers = [1,2,3]

func generateRandomNumbers() {
    var setNumber = Set<Int> ()
    
    while setNumber.count < 3{
        let randomNumber = Int.random(in: 1...9)
        
        setNumber.insert(randomNumber)
    }
    goalNumbers = [Int](setNumber)
    print(goalNumbers)
}

func judgeResult(val: [Int]) -> (countStrike: Int, countBall: Int) {

    var countStrike = 0
    var countBall = 0
    
    if(userNumbers[0] == goalNumbers[0]){
        countStrike += 1
    }
    else if(userNumbers[0] == goalNumbers[1]){
        countBall += 1
    }
    else if(userNumbers[0] == goalNumbers[2]){
        countBall += 1
    }
    
    if(userNumbers[1] == goalNumbers[0]){
        countBall += 1
    }
    else if(userNumbers[1] == goalNumbers[1]){
        countStrike += 1
    }
    else if(userNumbers[1] == goalNumbers[2]){
        countBall += 1
    }
    
    if(userNumbers[2] == goalNumbers[0]){
        countBall += 1
    }
    else if(userNumbers[2] == goalNumbers[1]){
        countBall += 1
    }
    else if(userNumbers[2] == goalNumbers[2]){
        countStrike += 1
    }
    
    print("Strike = \(countStrike), ball = \(countBall)")
    return (countStrike, countBall)
}

//var goalNumbers = [Int]()
//var attemp = 9
//var userNumbers = [1,2,3]

func startGame() {
    generateRandomNumbers()
    print("Computer: \(goalNumbers)")
    print("User: \(userNumbers)")
    
    while attemp > 0 {
        let result = judgeResult(val: userNumbers)
        if result.countStrike == 3 {
            print("WIN!")
            
            return
        }
        attemp -= 1
    }
}

startGame()
