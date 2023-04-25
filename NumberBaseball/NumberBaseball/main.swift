//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


func createThreeNumbers() -> [Int] {
    return Array((1...9).shuffled()[0...2])
}

func computeGameResult(correctAnswer: [Int], userAnswer: [Int]) -> (ball: Int, strike: Int) {
    var ball = 0
    var strike = 0
    
    for (index, element) in userAnswer.enumerated() {
        if element == correctAnswer[index] {
            strike += 1
        } else if correctAnswer.contains(element) {
            ball += 1
        }
    }
    
    return (ball, strike)
}

func startGame() {
    let correctAnswer = createThreeNumbers()
    var tryCount = 9
    
    while tryCount > 0 {
        let someNumber = createThreeNumbers()
        let gameResult = computeGameResult(correctAnswer: correctAnswer, userAnswer: someNumber)
        
        print("임의의 수 : \(someNumber.map { String($0) }.joined(separator: " "))")
        print("\(gameResult.strike) 스트라이크, \(gameResult.ball) 볼")
        if gameResult.strike == 3 {
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
