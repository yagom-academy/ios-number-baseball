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

func makeRandomNumberSet() {
    var randomNumberSet = Set<Int>()
    
    repeat {
        randomNumberSet.insert(makeRandomNumber())
    } while randomNumberSet.count < 3
    
    let randomNumberArray = Array(randomNumberSet)
}

func printMenu() {
    print("임의의 수 : ", terminator: "")
}

func makeUserInput() {
    var userRandomNumberSet = Set<Int>()
    
    while userRandomNumberSet.count < 3 {
        userRandomNumberSet.insert(makeRandomNumber())
    }
    
    print(userRandomNumberSet)
}

printMenu()
makeUserInput()

