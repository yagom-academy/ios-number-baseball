//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerRandomNumberArray: [Int] = []
var numberOfAttempts = 9
var otherComputerRandomNumberArray: [Int] = []
var strike: Int = 0
var ball: Int = 0

func presentRandomNumber() -> [Int] {
    var randomNumArray: [Int] = []
    while randomNumArray.count < 3 {
        let number = Int.random(in: 1...9)
        if randomNumArray.contains(number) == false {
            randomNumArray.append(number)
        }
    }
    return randomNumArray
}

func putNumberInArray() {
    computerRandomNumberArray = presentRandomNumber()
    print(computerRandomNumberArray)
    print(otherComputerRandomNumberArray)
}

func matchIndex(_ x: Int, _ y: Int) -> Bool {
    if x == y {
        return true
    } else {
        return false
    }
}

func matchNumberArray(_ computerArray: [Int], _ otherComputerArray: [Int]) -> (Int, Int) {
    for i in 0...2 {
        if matchIndex(Int(computerArray[i]), Int(otherComputerArray[i])) == true {
            strike += 1
        } else if computerArray.contains(otherComputerArray[i]) {
            ball += 1
        }
    }
    return ball
}

putNumberInArray()
print(matchNumberArray(computerRandomNumberArray, otherComputerRandomNumberArray))
