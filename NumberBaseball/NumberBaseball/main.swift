//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var answerNumber = [Int]()
var lastChance = 9
var ball: Int
var strike: Int
var answerCountCheck: Set<Int> = Set<Int>()

print("임의의 수 : ",terminator: "")

guard let playerNumber = readLine() else {
    return ""
}
