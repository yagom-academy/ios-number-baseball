//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var winNumbers: Set<Int> = []

while winNumbers.count < 3 {
    winNumbers.insert(Int.random(in: 1...9))
}

let winNumArr = Array(winNumbers)

var userNumArr: [Int] = []

func createUserNum() -> [Int] {
    var userNumbers: Set<Int> = []
    while userNumbers.count < 3 {
        userNumbers.insert(Int.random(in: 1...9))
    }
    
    return Array(userNumbers)
}

var strikeNum = 0

func countStrike() {
    if winNumArr[0] == userNumArr[0] {
        strikeNum += 1
    }
    if winNumArr[1] == userNumArr[1] {
        strikeNum += 1
    }
    if winNumArr[2] == userNumArr[2] {
        strikeNum += 1
    }
}

var ballNum = 0

func countBall() {
    if winNumArr[0] == userNumArr[1]  {
        ballNum += 1
    }
    if winNumArr[0] == userNumArr[2]  {
        ballNum += 1
    }
    if winNumArr[1] == userNumArr[0]  {
        ballNum += 1
    }
    if winNumArr[2] == userNumArr[0]  {
        ballNum += 1
    }
    if winNumArr[1] == userNumArr[2]  {
        ballNum += 1
    }
    if winNumArr[2] == userNumArr[1]  {
        ballNum += 1
    }
}


var chance = 9
for _ in 1...9 {
    userNumArr = createUserNum()
    countStrike()
    if strikeNum == 3 {
        print("사용자 승리!")
        break
    }
    countBall()
    chance -= 1
    print("임의의 수 :", userNumArr.map { String($0) }.joined(separator: " "))
    print("\(strikeNum) 스트라이크, \(ballNum) 볼")
    if chance != 0 {
        print("남은기회 : \(chance)")
    }
    else {
        print("컴퓨터 승리...!")
    }
    strikeNum = 0
    ballNum = 0
}
