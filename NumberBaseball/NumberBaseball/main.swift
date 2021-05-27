//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Edited by Soll & Seunggi
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var comX = 0, comY = 0, comZ = 0
var myX, myY, myZ: Int
var count: Int = 9

func makeThreeRandomNo() -> Set<Int> {
    var tempArray = Set<Int>()
    
    while tempArray.count < 3 {
        let tempNo: Int = Int.random(in: 1...9)
        tempArray.insert(tempNo)
    }
    
    return tempArray
}

for i in 0...10 {
    var comArray: Set<Int> = Set(makeThreeRandomNo())
    var userArray: Set<Int> = Set(makeThreeRandomNo())
    
    print(comArray, userArray)
    
    var strike = 0, ball = 0
    
    for (index, number1) in comArray.enumerated() {
        for (j, number2) in userArray.enumerated() {
            if index == j && number1 == number2 {
                strike += 1
            } else if number1 == number2{
                ball += 1
            }
        }
    }
    
    //for (index, number1) in comArray.enumerated() {
    //    for (j, number2) in userArray.enumerated() {
    //        if index == j && number1 == number2 {
    //            strike += 1
    //        } else if number1 == number2{
    //            ball += 1
    //        }
    //    }
    //}
    
    print(strike, ball)
}
