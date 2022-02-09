//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var firstNumber: Int = 0
var secondNumber: Int = 0
var thirdNumber: Int = 0

var tryCount = 9

while firstNumber == secondNumber || firstNumber == thirdNumber || secondNumber == thirdNumber {
    firstNumber = Int.random(in: 1...9)
    secondNumber = Int.random(in: 1...9)
    thirdNumber = Int.random(in: 1...9)
    
}

var inputFirstNumber: Int = 0
var inputSecondNumber: Int = 0
var inputThirdNumber: Int = 0


func makeInputFirstNumber() {
    guard let inputFirstNumberString = readLine() else { return } 
}



while inputFirstNumber == inputSecondNumber || inputFirstNumber == inputThirdNumber || inputSecondNumber == inputThirdNumber {
    
}

