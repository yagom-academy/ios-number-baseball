//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var answer = [Int]()
var remainCount = 9

func generateAnswer() -> [Int] {
    var array = Array(1...9)
    array.shuffle()
    return array[...2].map(){Int($0)}
}
