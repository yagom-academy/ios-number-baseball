//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomNumbers: [Int] = []
var tryCount: Int = 9

func getRandomNumbers() -> [Int] {
    
    var randomNumbers: [Int] = []
    
    while randomNumbers.count != 3 {
        
        let randomNumber = Int.random(in: 1...9)
        
        if !randomNumbers.contains(randomNumber) {
            randomNumbers.append(randomNumber)
        }
    }
    
    return randomNumbers
}

func compareToRandomNumbers(randomNumbers: [Int]) {
    var myBaseballNumbers: [Int] = getRandomNumbers()
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    if myBaseballNumbers == randomNumbers {
        print("사용자의 승리")
    }
    
    for elements in myBaseballNumbers {
        if randomNumbers[elements] == myBaseballNumbers[elements] {
            strikeCount += 1
        } else if randomNumbers.contains(myBaseballNumbers[elements]) {
            ballCount += 1
        }
    }
    
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
}
