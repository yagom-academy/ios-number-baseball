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
    var RanArray:[Int] = []
    var RanSet:Set<Int> = []
    while RanSet.count < 3 {
        let RanNum = Int.random(in: 1...9)
        RanSet.insert(RanNum)
    }
    RanArray = Array<Int>(RanSet)

    return RanArray
}

func ball (com: [Int], user: [Int]) -> Int {
    var ballCnt = 0
    if com.contains(user[0]) {
        ballCnt += 1
    }
    if com.contains(user[1]) {
        ballCnt += 1
    }
    if com.contains(user[2]) {
        ballCnt += 1
    }
    return ballCnt
}

func strike(com: [Int], user: [Int]) -> Int {
    var strikeCnt = 0
    if com[0] == user[0] {
        strikeCnt += 1
    }
    if com[1] == user[1] {
        strikeCnt += 1
    }
    if com[2] == user[2] {
        strikeCnt += 1
    }
    return strikeCnt
}
