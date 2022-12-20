//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func CreateRandomNums() -> [Int] {
    var createdNums = [Int]()
    
    while createdNums.count < 3 {
        let createdRandomNum = Int.random(in:1...9)
        
        if createdNums.contains(createdRandomNum) {
            continue
        } else {
            createdNums.append(createdRandomNum)
        }
    }
    
    return createdNums
}

