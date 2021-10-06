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

1 2 4
3 2 1

-> 1스, 1볼

-> 2볼

func judgeBall(_ randomNumbers: Array<Int>, _ userNumbers: Array<Int>) -> Int{
    
}

func judgeStrike(_ randomNumbers: Array<Int>, _ userNumbers: Array<Int>) -> Int{
    var strikeNumber = 0
    
    if randomNumbers[0] == userNumbers[0] {
        strikeNumber += 1
    }
    
    if randomNumbers[1] == userNumbers[1] {
        strikeNumber += 1
    }
    
    if randomNumbers[2] == userNumbers[2] {
        strikeNumber += 1
    }
    
    return strikeNumber
}

func compareNumbers(_ randomNumbers: Array<Int>, _ userNumbers: Array<Int>) -> String{
    
}

let randomNumbers: Array<Int> = makeRandomNumberSet()
var userNumbers: Array<Int> = makeRandomNumberSet()

func printNumbers(_ radomArray: Array<Int>) {
    print("임의의 수: \(radomArray[0]) \(radomArray[1]) \(radomArray[2])")
}



printNumbers(userNumbers)
