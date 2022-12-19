//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation



while true {
    print(makeThreeBalls())
    break
}

func makeThreeBalls() -> Set<Int> {
    var balls: Set<Int> = []
    while balls.count < 3 {
        balls.insert(Int.random(in: 1...9))
    }
    return balls
}

