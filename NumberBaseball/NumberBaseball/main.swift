//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomNumbers: [Int] = []
var tryCount: Int = 9

start()

func start() {
    while true {
        randomNumbers = getRandomNumbers()
        compareToRandomNumbers(randomNumbers: getRandomNumbers())
        if tryCount == 0 {
            break
        }
    }
}

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
    let myBaseballNumbers: [Int] = getRandomNumbers()
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    if myBaseballNumbers == randomNumbers {
        print("사용자의 승리")
    }
    
    print("randomNumbers: \(randomNumbers)")
    print("mybaseballNumbers: \(myBaseballNumbers)")
    
    for elements in 0...2 {
        if randomNumbers[elements] == myBaseballNumbers[elements] {
            strikeCount += 1
        } else if randomNumbers.contains(myBaseballNumbers[elements]) {
            ballCount += 1
        }
    }
    
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    
    tryCount -= 1
    print("남은 기회 : \(tryCount)")
}
