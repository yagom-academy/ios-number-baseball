//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: Array<Int> = generateRandomNumbers()
var tryCount: Int = 9
var strikeCount: Int = 0
var ballCount: Int = 0

func generateRandomNumbers() -> Array<Int> {
    var numbers: Set<Int> = Set<Int>()
    
    while numbers.count < 3 {
        numbers.insert(Int.random(in: 1...9))
    }
    return Array(numbers)
}

func returnResult(of numbers: [Int]) -> String {
    
    for index in 0...2 {
        judgeStrikeOrBall(of: numbers[index], at: index)
    }

    return "\(strikeCount) 스트라이크, \(ballCount) 볼"
}

func judgeStrikeOrBall(of number: Int, at index: Int) {
    if number == computerNumbers[index] {
        strikeCount += 1
    }else if computerNumbers.contains(number) {
        ballCount += 1
    }
}

func playOneRound() {
    let randomNumbers = generateRandomNumbers()
    let randomNumberToString: String = randomNumbers.reduce(""){String($0) + " " + String($1)}
    let resultOfJudgement = returnResult(of: randomNumbers)
    
    tryCount -= 1
    strikeCount = 0
    ballCount = 0
    
    let message = """
    임의의 수 : \(randomNumberToString)
    \(resultOfJudgement)
    남은 기회 : \(tryCount)
    """
    print(message)
}

func startGame() {
    while tryCount > 0, strikeCount != 3 {
        playOneRound()
    }
    
    if tryCount == 0, strikeCount != 3 {
        print("컴퓨터 승리..!")
    }else {
        print("사용자 승리!")
    }
}

startGame()


