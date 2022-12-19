//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
/*
 let winNumbersArray = [2, 6, 3]
 var timesOfTry = 9
 var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
 func makeRandomNumber() {
 var randomNumbersArray: Array<Int> = []
 for _ in 1...3 {
 let randomNumbersArrayIndex = Int.random(in: 0...numbers.count)
 randomNumbersArray.append(numbers[randomNumbersArrayIndex])
 numbers.remove(at: randomNumbersArrayIndex)
 }
 }
 
 makeRandomNumber()
 
 func resultOfGame() {
 
 }
 */

//MARK: SET
var winNumbersArray = [2, 6, 3]
var remainingAttempts = 9

func makeRandomArray() -> [Int] {
    var randomNumbersSet : Set<Int> = Set<Int>()
    while randomNumbersSet.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        randomNumbersSet.insert(randomNumber)
    }
    return Array(randomNumbersSet)
}
print(winNumbersArray)
var randomNumbers = makeRandomArray()
print(randomNumbers)

func countNumbers() -> String {
    var strike: Int = 0
    var ball: Int = 0
    
    /*
    for index in 0...2 {
        if randomNumbers[index] == winNumbersArray[index] {
            print("\(randomNumbers[index]), \(winNumbersArray[index])")
            strike += 1
        }
    }
    */
    return "\(strike) 스트라이크, \(ball) 볼"
}

var result = countNumbers()
print(result)

