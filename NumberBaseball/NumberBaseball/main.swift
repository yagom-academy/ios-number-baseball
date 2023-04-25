//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

typealias resultType = (strike: Int, ball: Int)

func randomNumbers() -> Array<Int> {
    var computerNumbers: Array<Int> = []
    
    while computerNumbers.count < 3 {
        if computerNumbers.count == 3 {
            break
        }
        let randomNumber = Int.random(in:1...9)
        if computerNumbers.contains(randomNumber) {
            continue
        }
        computerNumbers.append(randomNumber)
    }
    return computerNumbers
}

func compareNumbers(user userNumbers: Array<Int>, to computerNumbers: Array<Int>) -> resultType {
    let strikes = userNumbers.enumerated().filter {userNumbers[$0.offset] == computerNumbers[$0.offset]}.map {$0.element}
    let balls = userNumbers.filter {(strikes.contains($0) == false) && (computerNumbers.contains($0))}
    let strike = strikes.count
    let ball = balls.count
    
    return (strike: strike, ball: ball)
}

func menuSelect() {
    var computerNumbers: Array<Int>
    var chance: Int = 9
    computerNumbers = randomNumbers()
    while chance > 0 {
        let userNumbers = randomNumbers()
        var result: resultType = compareNumbers(user: userNumbers, to: computerNumbers)
        var printNumber = userNumbers.map {String($0)}.joined(separator: ", ")
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

