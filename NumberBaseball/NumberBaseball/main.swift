//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var answer: Array<Int>
var tryCount = 9

func createThreeNumber() -> Array<Int> {
    return Array((1...9).shuffled()[0...2])
}

answer = createThreeNumber()
print(answer)
