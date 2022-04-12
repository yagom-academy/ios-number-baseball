//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var challenge: Int = 9
var isEnd: Bool = false
var randomNumberAnswer: Array<Int> = {
    var result = Set<Int>()
    while result.count < 3{
        result.insert(Int.random(in: 1...9))
    }
    return Array(result)
}()



while isEnd{
    print("임의의 수 :", terminator: " ")
    guard let userInput = readLine()?.components(separatedBy: " ") else{
        break
    }
    
}
