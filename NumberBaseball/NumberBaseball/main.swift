//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

var randomThreeNumbers: Set<Int> = []
var tryCount: Int = 9

func makeThreeRandomNumbers() {
    var randomNumber: Int
    while(randomThreeNumbers.count < 3) {
        randomNumber = Int.random(in: 1...9)
        randomThreeNumbers.insert(randomNumber)
    }
}
