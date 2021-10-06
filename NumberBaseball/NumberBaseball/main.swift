//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func makeRandomNumber() -> Int {
    var randomNumber: Int = 0
    
    randomNumber = Int.random(in: 1...9)
    return randomNumber
}

func makeRandomNumberSet() -> Array<Int> {
    var randomNumberSet = Set<Int>()
    
    repeat {
        randomNumberSet.insert(makeRandomNumber())
    } while randomNumberSet.count < 3
    
    let randomNumberArray = Array(randomNumberSet)
    
    return randomNumberArray
}

func makeUserInput() {
    var userRandomNumberSet = Set<Int>()
    
    while userRandomNumberSet.count < 3 {
        userRandomNumberSet.insert(makeRandomNumber())
    }
    
    print(userRandomNumberSet)
}

func judgeBall(_ randomNumbers: Array<Int>, _ userNumber: Int) -> Int{

    if randomNumbers.contains(userNumber){
        return 1
    } else {
        return 0
    }
}

func compareNumbers(_ randomNumbers: Array<Int>, _ userNumbers: Array<Int>) {
    var strikeNumber = 0
    var ballNumber = 0
    
    if randomNumbers[0] == userNumbers[0] {
        strikeNumber += 1
    } else {
        ballNumber += judgeBall(randomNumbers, userNumbers[0])
    }
    
    if randomNumbers[1] == userNumbers[1] {
        strikeNumber += 1
    } else {
        ballNumber += judgeBall(randomNumbers, userNumbers[1])
    }
    
    if randomNumbers[2] == userNumbers[2] {
        strikeNumber += 1
    } else {
        ballNumber += judgeBall(randomNumbers, userNumbers[2])
    }
    
    print("\(strikeNumber) 스트라이크, \(ballNumber) 볼")
}

let randomNumbers: Array<Int> = makeRandomNumberSet()
var userNumbers: Array<Int> = makeRandomNumberSet()

func printNumbers(_ radomArray: Array<Int>) {
    print("임의의 수: \(radomArray[0]) \(radomArray[1]) \(radomArray[2])")
}



printNumbers(userNumbers)
