//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let numbers = Array((1...9).shuffled()[..<3])
var times = 9

func generateNumbers() -> [Int] {
    return Array((1...9).shuffled()[..<3])
}

print(generateNumbers())

func showGameResult() {
    while times >= 1 {
        var strike = 0
        var ball = 0
        let myNumbers = generateNumbers()
        
        times -= 1
        
        for (number, myNumber) in zip(numbers, myNumbers) {
            print("number : \(number), myNumber : \(myNumber)")
            if numbers == myNumbers {
                strike += 1
            } else if numbers.contains(myNumber) {
                ball += 1
            }
        }
        
        print("임의의 수 : \(myNumbers)")
        print("\(strike) 스트라이크, \(ball) 볼")
        if strike == 3 {
            print("사용자 승리!")
            return
        } else {
            times != 0 ? print("남은 기회 : \(times)") : print("컴퓨터 승리...!")
        }
    }
}

showGameResult()
