//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var winningNumber: Set<Int> = Set<Int>()
var gameCount: Int = 9

func randomInt(to: Int, from: Int) -> Int { Int.random(in: to...from) }
func makeNonOverlappingNumber() -> Set<Int> {
    var nonOverlappingNumber: Set<Int> = Set<Int>()
    while nonOverlappingNumber.count < 3 {
        nonOverlappingNumber.insert(randomInt(to: 1, from: 9))
    }
    return nonOverlappingNumber
}

