//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

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

func compareNumbers(with userNumbers: Array<Int>, to computerNumbers: Array<Int>) -> (strike: Int, ball: Int) {
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
        var result: (strike: Int, ball: Int) = compareNumbers(with: computerNumbers, to: computerNumbers)
        print("임의의 수 : \(userNumbers)")
        print("\(result.strike) 스트라이크, \(result.ball) 볼")
        chance -= 1
        if chance == 0 {
            print("컴퓨터 승리...!")
            break
        }
        print("남은 기회 : \(chance)")
    }
}
menuSelect()

