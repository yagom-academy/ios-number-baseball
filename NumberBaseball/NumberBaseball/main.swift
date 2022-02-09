//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


var numbersByComputer: [Int] = []
var numberOfChance: Int = 9

func returnRandomNumbers() -> [Int] {
    var tempSet = Set<Int>()
    
    while(tempSet.count < 3) {
        tempSet.insert(Int.random(in:1...9))
    }
    return Array(tempSet)
}

/*
func returnResult(numbers: [Int]) -> String {
    
}
*/

func startGame() {
    
}

numbersByComputer = returnRandomNumbers()


