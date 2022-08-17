//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var randomNumber = Set<Int>()
var modeSelect = ""

while randomNumber.count < 3 {
    randomNumber.insert(Int.random(in: 1...9))
}
print(randomNumber)


gameStart()


func insert() {
    print("임의의 수 : ", terminator: "")
    let userNumber = readLine()!.split(separator: " ").map{Int($0)!}
    var strike = 0
    var ball = 0

    userNumber.forEach {
        if randomNumber.contains($0) { ball += 1 }
    }
    strike = zip(randomNumber, userNumber).compactMap {
        $0.0 == $0.1 ? true : nil
    }.count
    ball -= strike

    print("\(strike) 스트라이크, \(ball) 볼")
}

func gameStart() {
    gameSelect()
    while true {
        if modeSelect == "1" {
            for round in (0...8).reversed() {
                insert()
                if round == 0 {
                    print("컴퓨터 승리...!")
                }
                print("남은 기회 : \(round)")
            }
        }
    }
}

func gameSelect() {
    print("1. 게임시작"); print("2. 게임종료"); print("원하는 기능을 선택해주세요 : ", terminator: "")
    let userSelect = readLine()!

    modeSelect = userSelect
}
