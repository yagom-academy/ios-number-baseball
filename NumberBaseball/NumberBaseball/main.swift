//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: [Int] = []
var tryCount = 9

func generateRandomNumbers() -> [Int] {
    var randomNumbers: Set<Int> = []
    while randomNumbers.count < 3 {
        let number = Int.random(in: 1...9)
        randomNumbers.insert(number)
    }
    return Array(randomNumbers)
}

func judgeStrikeAndBall(with userNumbers: [Int]) -> [Int] {
    var ballCount: Int = 0
    var strikeCount: Int = 0
    for index in 0...(userNumbers.count - 1) {
        ballCount += computerNumbers.contains(userNumbers[index]) ? 1 : 0
    }
    for index in 0...(userNumbers.count - 1) {
        strikeCount += computerNumbers[index] == userNumbers[index] ? 1 : 0
    }
    ballCount -= strikeCount
    return [strikeCount, ballCount]
}

func startGame() {
    computerNumbers = generateRandomNumbers()
    var strikeCount = 0
    var ballCount = 0
    while tryCount != 0 && strikeCount != 3 {
        tryCount -= 1
        let userNumbers = generateRandomNumbers()
        let strikeAndBallCount: [Int] = judgeStrikeAndBall(with: userNumbers)
        strikeCount = strikeAndBallCount[0]
        ballCount = strikeAndBallCount[1]
        print("임의의 수 : " + userNumbers.map{String($0)}.joined(separator: " "))
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        print("남은 기회 : \(tryCount)")
    }
    
    if strikeCount == 3 {
        print("사용자 승리!")
    } else {
        print("컴퓨터 승리...!")
    }
}
startGame()

