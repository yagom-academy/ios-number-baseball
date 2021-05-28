//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func generateThreeRandomNumbers() -> [Int] {
    var numberSet: Set<Int> = Set<Int>()
    while numberSet.count < 3 {
        numberSet.insert(Int.random(in: 1...9))
    }
    
    return Array(numberSet)
}

func changeNumbersToString(numbers: [Int]) -> String {
    return numbers.map { element in
        "\(element)"
    }.joined(separator: " ")
}

func getStrikesAndBallsNumber(numbersToCheck numberList: [Int]) -> (strikeCount: Int, ballCount: Int) {
    let answerSet = Set(answerRandomNumbers)
    let attemptSet = Set(numberList)
    
    let intersectionSet = answerSet.intersection(attemptSet)
    var ballCount = intersectionSet.count
    
    var strikeCount = 0
    
    for index in 0...2 {
        let matchingCount = (answerRandomNumbers[index] == numberList[index] ? 1 : 0)
        strikeCount += matchingCount
        ballCount -= matchingCount
    }
    return (strikeCount, ballCount)
}

func printResult(numberOfStrikes: Int, numberOfBalls: Int) {
    print("\(numberOfStrikes) 스트라이크, \(numberOfBalls) 볼")
}

var answerRandomNumbers: [Int]
var attemptsRemaining: Int = 9
var attemptRandomNumbers: [Int]

answerRandomNumbers = generateThreeRandomNumbers()

while attemptsRemaining > 0 {
    attemptRandomNumbers = generateThreeRandomNumbers()
    let stringSequence = changeNumbersToString(numbers: attemptRandomNumbers)
    print("임의의 수 : \(stringSequence)")
    attemptsRemaining -= 1
    
    let (strikeCount, ballCount) = getStrikesAndBallsNumber(numbersToCheck: attemptRandomNumbers)
    
    if strikeCount == 3 {
        print("사용자 승리...!")
        printResult(numberOfStrikes: strikeCount, numberOfBalls: ballCount)
        break
    }
    else if attemptsRemaining == 0 {
        print("컴퓨터 승리...!")
    }
    printResult(numberOfStrikes: strikeCount, numberOfBalls: ballCount)
    print("남은 기회 : \(attemptsRemaining)")
}

