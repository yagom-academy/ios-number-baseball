//
//  NumberBaseball - main.swift
//  Created by JusBug, maxhyunm.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

typealias gameResultType = (strike: Int, ball: Int)

var opponentNumbers: Array<Int> = []
var chance: Int = 9

func makeRandomNumbers() -> Array<Int> {
    var opponentNumbers: Array<Int> = []
    
    while opponentNumbers.count < 3 {
        let randomNumber = Int.random(in:1...9)
        if opponentNumbers.contains(randomNumber) {
            continue
        }
        opponentNumbers.append(randomNumber)
    }
    
    return opponentNumbers
}

func compareNumbers(user userNumbers: Array<Int>, to opponentNumbers: Array<Int>) -> gameResultType {
    let strikes = userNumbers.enumerated()
        .filter { userNumbers[$0.offset] == opponentNumbers[$0.offset] }
        .map { $0.element }
    let balls = userNumbers
        .filter { (strikes.contains($0) == false) && (opponentNumbers.contains($0)) }
    let strike = strikes.count
    let ball = balls.count
    
    return (strike: strike, ball: ball)
}

func menuSelect() {
    opponentNumbers = makeRandomNumbers()
    
    while chance > 0 {
        let userNumbers = makeRandomNumbers()
        let result: gameResultType = compareNumbers(user: userNumbers, to: opponentNumbers)
        let printNumber = userNumbers.map { String($0) }.joined(separator: ", ")
        
        print("임의의 수 : \(printNumber)")
        print("\(result.strike) 스트라이크, \(result.ball) 볼")
        
        chance -= 1
        
        if chance == 0 {
            print("컴퓨터 승리...!")
            break
        } else if result.strike == 3 {
            print("사용자 승리!")
            break
        }
        
        print("남은 기회 : \(chance)")
    }
}

menuSelect()

