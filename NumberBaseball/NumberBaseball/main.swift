//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomNumber: Set<Int> = []

func chooseRandomNumber() {
    var number = Int.random(in: 1...9)
    randomNumber.insert(number)
}

while randomNumber.count < 3 {
    chooseRandomNumber()
}
