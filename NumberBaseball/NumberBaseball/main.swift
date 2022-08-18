//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var comNumArr: Array(Int) = []
var tryCount: Int = 9
var menuNum: Int
var strikeCount = 0
var ballCount = 0

while tryCount == 0 {
    for i in 0...2 {
    comNumArr[i] = Int.random(in: 1...9)
    /*
    중복검증 해야 함
     */
    }
    print("임의의 수 : \(comNumArr[0]), \(comNumArr[1]), \(comNumArr[2])")
}

print("\(strikeCount) 스트라이크, \(ballCount) 볼")

if strikeCount != 3 {
    print("컴퓨터 승리...!")
} else {
    print("사용자 승리...!")
}
