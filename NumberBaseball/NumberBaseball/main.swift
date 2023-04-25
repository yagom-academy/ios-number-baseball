//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumberList: [Int] = [8, 2, 4]
var countOfTurn = 9

func generateRandomIntegerList() -> [Int] {
    var randomIntegerList: Set<Int> = []
    
    while randomIntegerList.count != 3 {
        randomIntegerList.insert(Int.random(in: 1...9))
    }
    
    return Array(randomIntegerList)
}


