//
//  NumberBaseball - main.swift
//  Created by Chuuny & Doogie.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var userNumber: [String] = []
var chance = 9

func makeRandomNumber() -> [String] {
    var randomNumber: [String] = []
    var numberList = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    numberList.shuffle()
    randomNumber.append(String(numberList[0]))
    randomNumber.append(String(numberList[1]))
    randomNumber.append(String(numberList[2]))
    
    return randomNumber
}

func checkNumber(_ userNumbers: [String], randomNumbers: [String]) -> (Int, Int) {
    var strike = 0
    var ball = 0
    
    for i in 0..<userNumbers.count {
        if userNumbers[i] == randomNumbers[i] {
            strike += 1
        }
    }
    return (0, 0)
}

let randomNumber = makeRandomNumber()

while chance > 0 {
    let userNumber = makeRandomNumber()
    print("임의의 수 : \(userNumber[0]) \(userNumber[1]) \(userNumber[2])")
//    print("\(checkNumber(userNumber).0) 스트라이크, \(checkNumber(userNumber).1) 볼")
    chance -= 1
    print("남은 기회 \(chance)")
}
