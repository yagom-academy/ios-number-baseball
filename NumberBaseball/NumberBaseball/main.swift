//
//  NumberBaseball - main.swift
//  Created by Chuuny & Doogie.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


var randomNumber: [String] = []
var userNumber: [String] = []
var maxRange = 8

func makeRandomNumber(_ list: [String]) {
    var numberList = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    for _ in 1...3 {
        let randomInt = Int.random(in: 0...maxRange)
        randomNumber.append(String(numberList[randomInt]))
        numberList.remove(at: randomInt)
        maxRange = maxRange - 1
    }
//    if Set(list).count != 3 {
//        return makeRandomNumber(<#T##list: [String]##[String]#>)
//    }
}


print("임의의 수 : \(userNumber[0]) \(userNumber[1]) \(userNumber[2])")
