//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let numbers = Array(1...9)

func makeRandomNumbers() -> [Int] {
    var resultnumbers: Set<Int> = []
    
    guard let randomElement = numbers.randomElement() else{
        return []
    }
    
    while resultnumbers.count < 3 {
        resultnumbers.insert(randomElement)
    }
    
    return Array(resultnumbers)
}


