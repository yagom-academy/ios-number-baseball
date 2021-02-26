//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var BossCollections : [Int] = [] // 임의의 정수 3개를 담아둘 변수
var chance : Int = 9  // 남은 시도횟수

func randomNums () {
    var randomNumber : Int
    while BossCollections.count < 3 {
        randomNumber = Int.random(in: 1...9)
        if !BossCollections.contains(randomNumber){
            BossCollections.append(randomNumber)
        }
    }
}

func Comparison () {
    
}
