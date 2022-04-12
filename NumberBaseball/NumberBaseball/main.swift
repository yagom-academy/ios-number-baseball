//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func generateNumbers() -> Set<Int> {
    var randomNumber = Set<Int>()
    
    while randomNumber.count < 3 {
        randomNumber.insert(Int.random(in: 1...9))
    }
    
    return randomNumber
}
