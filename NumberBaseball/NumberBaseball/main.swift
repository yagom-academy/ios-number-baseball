//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


var computerRandomNumbers: Set<Int> = []
var remainCount: Int = 9

func randomNumberGenerator() -> Int {
    return Int.random(in: 1...9)
}
