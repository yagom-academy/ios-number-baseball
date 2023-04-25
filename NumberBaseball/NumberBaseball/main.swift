//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var input1: Int
var input2: Int
var input3: Int

var chance: Int = 9

func randomNumbers() -> Array<Int> {
    var computerNumbers: Array<Int> = []
    
    while computerNumbers.count < 3 {
        if computerNumbers.count == 3 {
            break
        }
        let randomNumber = Int.random(in:1...9)
        if computerNumbers.contains(randomNumber) {
            continue
        }
        computerNumbers.append(randomNumber)
    }
    return computerNumbers
}

func compareNumbers(to computerNumbers: Array<Int>) {
    let userNumbers = randomNumbers()
    let strikes = userNumbers.enumerated().filter {userNumbers[$0.offset] == computerNumbers[$0.offset]}.map {$0.element}
    
}

func menuSelect() {
    print("임의의 수 : \(computerNumbers)")
}


