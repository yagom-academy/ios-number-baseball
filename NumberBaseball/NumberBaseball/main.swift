//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var comNumArr: Array<Int> = []
var tryCount: Int = 9
var menuNum: Int
var strikeCount = 0
var ballCount = 0

func createRandomNumbers() -> [Int] {
    var numbersSet: Set<Int> = []
    
    while numbersSet.count < 3 {
        numbersSet.insert(Int.random(in: 1...9))
    }
    comNumArr = Array(numbersSet)
    return comNumArr
}


while tryCount == 0 {
    print("임의의 수 : \(comNumArr[0]), \(comNumArr[1]), \(comNumArr[2])")
}


print("\(strikeCount) 스트라이크, \(ballCount) 볼")

if strikeCount != 3 {
    print("컴퓨터 승리...!")
} else {
    print("사용자 승리...!")
}

