//
//  NumberBaseball - main.swift
//  Created by redmango & dasanKim.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var computerRandomInt = [Int]()
var userRandomInt = [Int]()
var count: Int

func creatRandomNumber() -> [Int] {
    var outputRandomInput = [Int]()
    
    while outputRandomInput.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !outputRandomInput.contains(randomNumber) {
            outputRandomInput.append(randomNumber)
        }
    }
    return outputRandomInput
}

computerRandomInt = creatRandomNumber()
userRandomInt = creatRandomNumber()

func compare(to computerNumbers: [Int], from userNumbers: [Int]) -> (strikeCount: Int, ballCount: Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    for i in 0...2 {
        if computerNumbers.contains(userNumbers[i]) {
            ballCount += 1
        }
        
        if computerNumbers[i] == userNumbers[i] {
            strikeCount += 1
            ballCount -= 1
        }
    }
    return (strikeCount: strikeCount, ballCount: ballCount)
}

var one: Int = compare(to: computerRandomInt, from: userRandomInt).strikeCount
var two: Int = compare(to: computerRandomInt, from: userRandomInt).ballCount
//test용
//print(computerRandomInt)
//print(userRandomInt)
//print("strike: \(one), ball: \(two)")
