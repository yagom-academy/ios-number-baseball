//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: Set<Int> = []
var gameCounter: Int = 0
var userNumbers: Set<Int> = []

func makeThreeNumbers() -> Set<Int>{
    var generatedNumbers: Set<Int> = []
    while generatedNumbers.count < 3{
        generatedNumbers.update(with: Int.random(in: 1...9))
    }
    return generatedNumbers
}

func gameStart(){
    computerNumbers = makeThreeNumbers()
    gameCounter = 9
    userNumbers = makeThreeNumbers()
    print(computerNumbers)
    print(userNumbers)
}


gameStart()
