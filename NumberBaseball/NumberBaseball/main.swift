//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: [Int] = [Int]()
var trialNumber: Int = 9

func createThreeRandomInt() -> [Int] {
    var result: Set<Int> = Set<Int>()
    while result.count < 3 {
        result.insert(Int.random(in: 1...9))
    }
    
    return Array(result)
}
