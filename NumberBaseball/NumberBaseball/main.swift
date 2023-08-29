//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var tryCount: Int = 9

func makeRandomNumber() -> Set<Int> {
    var randomNum: Set<Int> = Set<Int>()
    while randomNum.count < 3 {
        randomNum.insert(Int.random(in: 1...9))
    }
    return Set(randomNum)
}
