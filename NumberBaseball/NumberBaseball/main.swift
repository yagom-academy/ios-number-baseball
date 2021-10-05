//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 변수 - 남은 시도횟수, (볼), 스트라이크 횟수, 임의의 정수 3개를 담을 변수

var remainingAttempts: Int = 9

var ballCount: Int

var strikeCount: Int

var winningNumbers: Set<Int>

var randomNumbers: Set<Int>


// 임의의 3개 정수 만들고 반환

func makeRandomNumbers() {
    var numbers: Set<Int> = []
    
    while numbers.count < 3 {
        let number: Int = Int.random(in: 1...9)
        numbers.insert(number)
    }
}

