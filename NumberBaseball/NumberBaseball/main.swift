//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomNumber = Set<Int>()

while randomNumber.count < 3 {
    randomNumber.insert(Int.random(in: 1...9))
}

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
    for round in (0...8).reversed() {
        insert()
        if round == 0 {
            print("컴퓨터 승리...!")
            break
        }
        print("남은 기회 : \(round)")
    }
}

