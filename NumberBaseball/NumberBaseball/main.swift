//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: Set<Int> = []

while true {
    checkBalls(computerNumbers)
    break
}
var restOfTimes: Int = 9
func makeThreeBalls() {
    while computerNumbers.count < 3 {
        computerNumbers.insert(Int.random(in: 1...9))
    }
}

func checkBalls(_ computerNumbers: Set<Int>) {
}
