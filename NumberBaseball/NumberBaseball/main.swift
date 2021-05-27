//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func generateRandomNumber() -> [Int] {
    var numbers: [Int] = []
    
    while numbers.count < 3 {
        let number = Int.random(in: 1...9)
        if !numbers.contains(number) {
            numbers.append(number)
        }
    }
    return numbers
}

func checkStrike(user: [Int], computer: [Int]) -> Int {
    var count = 0
    
    for number in 0...2 {
        if user[number] == computer[number] {
            count += 1
        }
    }
    return count
}

func checkBall(user: [Int], computer: [Int]) -> Int {
    var count = 0
    
    for computerNumber in computer {
        for userNumber in user {
            if computerNumber == userNumber {
                count += 1
            }
        }
    }
    return count
}
