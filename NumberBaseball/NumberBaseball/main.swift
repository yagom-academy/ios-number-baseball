//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var initialComputerInput: Set<Int> = Set<Int>()
var verifiedComputerArray: Array<Int> = Array<Int>()
var initalUserInput: Set<Int> = Set<Int>()
var verifiedUserArray: Array<Int> = Array<Int>()

var remainingChance = 9

func generateRandomNumbersForComputer() {
    while initialComputerInput.count < 3 {
        let number: Int = Int.random(in: 1...9)
        initialComputerInput.insert(number)
    }
    verifiedComputerArray = Array(initialComputerInput)
}

func generateRandomNumbersForUser() {
    while initalUserInput.count < 3 {
        let number: Int = Int.random(in: 1...9)
        initalUserInput.insert(number)
    }
    verifiedUserArray = Array(initalUserInput)
}


