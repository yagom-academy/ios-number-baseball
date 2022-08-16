//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerRandomNumberArray: Set<Int> = []
var numberOfAttempts = 9

func presentRandomNumber() -> Set<Int> {
    var randomNumArray: Set<Int> = []
    while randomNumArray.count < 3 {
        randomNumArray.insert(Int.random(in: 1...9))
    }
    return randomNumArray
}


