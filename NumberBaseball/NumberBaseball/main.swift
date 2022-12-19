//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let numbers = Array(1...9)
let initialNumbers = makeRandomNumbers()

func makeRandomNumbers() -> [Int] {
    var resultnumbers: Set<Int> = []
    
    while resultnumbers.count < 3 {
        guard let randomElement = numbers.randomElement() else{
            return []
        }
        resultnumbers.insert(randomElement)
    }
    
    return Array(resultnumbers)
}


