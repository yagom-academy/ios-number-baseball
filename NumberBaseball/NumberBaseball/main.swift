//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func makeRandomNumber() -> Int {
    var randomNumber: Int = 0
    
    randomNumber = Int.random(in: 1...9)
    return randomNumber
}

