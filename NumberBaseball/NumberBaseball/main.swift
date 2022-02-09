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

print("임의의 수 : ", terminator: "")

func splitInputNumberStringToInt() {
    
    guard let inputNumberString = readLine()?.split(separator: " ") else { return }
    
    guard let inputFirstNumber = Int(inputNumberString[0]) else { return }
    guard let inputSecondNumber = Int(inputNumberString[1]) else { return }
    guard let inputThirdNumber = Int(inputNumberString[2]) else { return }
    
}

splitInputNumberStringToInt()

func result () {
    var strike = 0
    var ball = 0
    for i in 0...2 {
        if inputNumberString.contains(firstNumber) || inputNumberString.contains(secondNumber) || inputNumberString.contains(thirdNumber) {
            
        }
    }
}








//while inputFirstNumber == inputSecondNumber || inputFirstNumber == inputThirdNumber || inputSecondNumber == inputThirdNumber {
//
//}

