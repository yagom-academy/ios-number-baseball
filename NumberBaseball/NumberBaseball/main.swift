//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var choiceOpportunity = 9
let comArray: [Int] = comChoice()
for _ in 0...choiceOpportunity {
    let userArray: [Int] = comChoice()
    let strikeCnt = strike(com: comArray, user: userArray)
    let ballCnt = ball(com: comArray, user: userArray) - strikeCnt

    print("임의의수 :", terminator: " ")
    for element in userArray {
        print(element, terminator: " ")
    }
    print("\n\(strikeCnt) 스트라이크, \(ballCnt) 볼", terminator: " ")
    if strikeCnt == 3 {
        print("- 사용자 승리")
        break
    }
    print("\n남은기회: \(choiceOpportunity)")
    
    if choiceOpportunity == 0 {
        print("컴퓨터 승리...!")
    }
    choiceOpportunity -= 1
}

func comChoice() -> [Int] {
    var RanArray: [Int] = []

    while RanArray.count < 3 {
        let RanNum = Int.random(in: 1...9)
        if RanArray.contains(RanNum) == false {
            RanArray.append(RanNum)
        }
    }
    return RanArray
}

func ball (com: [Int], user: [Int]) -> Int {
    var cnt = 0
    for i in user {
        if com.contains(i) {
            cnt += 1
        }
    }
    return cnt
}

func strike(com: [Int], user: [Int]) -> Int {
    var result = 0
    for i in 0...2 {
        if com[i] == user[i] {
            result += 1
        }
    }
    return result
}
