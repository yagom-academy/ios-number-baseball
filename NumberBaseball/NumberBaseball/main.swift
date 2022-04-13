//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerRandomNumbers = [Int]()
var totalTrialNumber = 9

func makeRandomNumbers() -> Array<Int> {
    var randomNumbers = Set<Int>()
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomNumbers)
}

func checkStrikeBall(numbers: Array<Int>) -> (Int, Int) {
    var strike = 0
    var ball = 0
    
    for numberindex in (0...numbers.count - 1) {
        if computerRandomNumbers.contains(numbers[numberindex]) && computerRandomNumbers[numberindex] == numbers[numberindex] {
            strike += 1
        } else if computerRandomNumbers.contains(numbers[numberindex]) && computerRandomNumbers[numberindex] != numbers[numberindex] {
            ball += 1
        }
    }
    return (strike, ball)
}

func printResult(result : (Int, Int)) {
    print("\(result.0) 스트라이크, \(result.1) 볼")
    if result.0 == 3 {
        print("사용자 승리!")
        return
    } else {
        print("남은 기회 : \(totalTrialNumber)")
    }
    if totalTrialNumber == 0 {
        print("컴퓨터 승리...!")
    }
}

func printRandomNumbers(numbers: Array<Int>) {
    print("임의의 수 : ", terminator: "")
    for index in 0...numbers.count - 1 {
        print(numbers[index], terminator: " ")
    }
    print()
}

func startGame() {
    computerRandomNumbers = makeRandomNumbers()
    while totalTrialNumber > 0 {
        let numbers = makeRandomNumbers()
        printRandomNumbers(numbers: numbers)
        totalTrialNumber -= 1
        printResult(result: checkStrikeBall(numbers: numbers))
    }
}

startGame()

