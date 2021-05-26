//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

//컴퓨터가 만드는 숫자
func numGenerator() -> [Int] {
    var randomNumbers = [Int]()
    while randomNumbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !randomNumbers.contains(randomNumber) {
            randomNumbers.append(randomNumber)
        }
    }
    return randomNumbers
}

var answer = numGenerator()
var tryCount = 9


//
func answerJudge(_ try: [Int]) {
    
}

