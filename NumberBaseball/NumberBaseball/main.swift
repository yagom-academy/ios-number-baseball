//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var targetNumbers: [Int] = []

var strikeCount: Int = 0
var ballCount: Int = 0

var tryCount: Int = 9

var randomNumbers: [Int] = []

func createRandomNumbers(first: Int = 1, last: Int = 9, count: Int = 3) -> [Int] {
    var resultNumbers: [Int] = []
    
    repeat {
        let num: Int = Int.random(in: first...last)
        if !resultNumbers.contains(num) {
            resultNumbers.append(num)
        }
        
    } while resultNumbers.count < count
    
    return resultNumbers
}

targetNumbers = createRandomNumbers()

func startGame() {
    print("임의의 수 : ", terminator: "")
    let randomNumbers = createRandomNumbers()
    
    print("\(randomNumbers[0]) \(randomNumbers[1]) \(randomNumbers[2])")
    
    strikeCount = compareStrike(by: randomNumbers)
}

func compareStrike(by randomNumbers: [Int], targetNumbers: [Int] = targetNumbers) -> Int {
    var strikeCount: Int = 0
    
    for i in randomNumbers.indices {
        if randomNumbers[i] == targetNumbers[i] {
            strikeCount += 1
        }
    }
    
    return strikeCount
}

print("타겟 숫자 : \(targetNumbers)")
for _ in 1...10 {
    startGame()
}

