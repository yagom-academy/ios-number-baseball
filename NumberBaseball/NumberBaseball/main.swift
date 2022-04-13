//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

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
    
    for numberIndex in (0...numbers.count - 1) {
        if computerRandomNumbers.contains(numbers[numberIndex]) && computerRandomNumbers[numberIndex] == numbers[numberIndex] {
            strike += 1
        } else if computerRandomNumbers.contains(numbers[numberIndex]) && computerRandomNumbers[numberIndex] != numbers[numberIndex] {
            ball += 1
        }
    }
    return (strike, ball)
}

func printResult(result: (strike: Int, ball: Int)) {
    print("\(result.strike) 스트라이크, \(result.ball) 볼")
    if result.strike == 3 {
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
    for elements in numbers {
        print(elements, terminator: " ")
    }
    print()
}

func startGame() {
    computerRandomNumbers = makeRandomNumbers()
    while totalTrialNumber > 0 {
        let playerRandomNumbers = makeRandomNumbers()
        printRandomNumbers(numbers: playerRandomNumbers)
        totalTrialNumber -= 1
        printResult(result: checkStrikeBall(numbers: playerRandomNumbers))
    }
}

startGame()

