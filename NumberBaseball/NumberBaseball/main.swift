//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func createThreeRandomNumber() -> Set<Int> {
    var returnSet = Set<Int>()
    
    while returnSet.count < 3 {
        returnSet.insert(Int.random(in: 1...9))
    }
    return returnSet
}
