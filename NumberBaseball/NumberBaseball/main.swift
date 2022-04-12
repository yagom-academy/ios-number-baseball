//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumber = Set<Int>()

while computerNumber.count < 3 {
    computerNumber.insert(Int.random(in: 1...9))
}

var remainingNumber = 9
var userNumber = Set<Int>()

func makeRandomNumber() -> Set<Int> {
    while userNumber.count < 3 {
        userNumber.insert(Int.random(in: 1...9))
    }
    
    return userNumber
}

makeRandomNumber()
let userNumberList = Array(userNumber)
let computerNumberList = Array(computerNumber)
