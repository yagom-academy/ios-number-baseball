//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomNumbers: [Int] = []
var remainChances: Int = 9

func generate3RandomNumbers() -> [Int] {
    var numbers:[Int] = []
    
    while numbers.count < 3 {
        let randomNumber:Int = Int.random(in: 1...9)
        
        if numbers.contains(randomNumber) == false {
            numbers.append(randomNumber)
        }
    }
    
    return numbers
}
