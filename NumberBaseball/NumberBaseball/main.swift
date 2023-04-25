//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerAnswer = createThreeNumber()
var tryCount = 9

func createThreeNumber() -> Array<Int> {
    return Array((1...9).shuffled()[0...2])
}

func baseballResult(answer: [Int]) -> [Int] {
    var ball = 0
    var strike = 0
    for (index, element) in answer.enumerated() {
        if element == computerAnswer[index] {
            strike += 1
        } else if computerAnswer.contains(element) {
            ball += 1
        }
    }
    return [ball, strike]
}

func startGame() {
    while tryCount > 0 {
        let someNumber = createThreeNumber()
        let gameResult = baseballResult(answer: someNumber)
        print("임의의 수 : \(someNumber.map { String($0) }.joined(separator: " "))")
        print("\(gameResult[1]) 스트라이크, \(gameResult[0]) 볼")
        if gameResult[1] == 3 {
            print("사용자 승리!")
            break
        }
        tryCount -= 1
        if tryCount == 0 {
            print("컴퓨터 승리...!")
            break
        }
        print("남은 기회 : \(tryCount)")
    }
}
startGame()
