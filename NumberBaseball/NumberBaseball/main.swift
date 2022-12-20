//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var comNums = Set<Int>()
var chance = 9

func createRandNums() {
    while comNums.count < 3 {
        let randNum = Int.random(in: 1...9)
        comNums.insert(randNum)
    }
}
