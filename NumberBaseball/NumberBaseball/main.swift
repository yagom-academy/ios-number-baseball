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



func isSame(first: Set<Int>, second: Set<Int>) -> Int {
    let winningSet = first.intersection(second).count
    switch winningSet {
    case 0:
        print("0 스트라이크, 0 볼")
    case 1:
        print("1 스트라이크, 0볼 혹은 0 스트라이크, 1 볼")
    case 2:
        print("2 스트라이크, 0볼 혹은 1 스트라이크, 1 볼 혹은 0 스트라이크 2 볼")
    case 3:
    default:
    }
    
}

// 임의의 3개 정수 만들고 반환

func makeRandomNumbers() {
    var numbers: [Int] = []
    
    while numbers.count < 3 {
        let number: Int = Int.random(in: 1...9)
        numbers.append(number)
    }
}

