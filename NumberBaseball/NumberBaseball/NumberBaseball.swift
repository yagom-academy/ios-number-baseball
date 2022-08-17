//
//  NumberBaseball.swift
//  NumberBaseball
//
//  Created by Gundy, mene on 2022/08/16.
//

import Foundation

var baseballRandomNumbers: [Int] = makeThreeRandomNumbers()
var remainCount: Int = 9

func makeThreeRandomNumbers() -> [Int] {
    let randomNumbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffled()
    var baseballGameNumbers: [Int] = []
    for index in randomNumbers {
        baseballGameNumbers.append(randomNumbers[index])
    }
    return baseballGameNumbers
}

func compare(my numbers: [Int]) -> (Int, Int) {
    var strike: Int = 0
    var ball: Int = 0
    for index in 0...2 {
        if baseballRandomNumbers[index] == numbers[index] {
            strike += 1
        } else if baseballRandomNumbers.contains(numbers[index]) {
            ball += 1
        }
    }
    remainCount -= 1
    return (strike, ball)
}

func checkResult(strike: Int, ball: Int) {
    print("""
          \(strike) 스트라이크, \(ball) 볼
          남은 기회: \(remainCount)
          """)
    if strike == 3 {
        print("사용자 승리!")
    } else if remainCount == 0 {
        print("컴퓨터 승리...!")
    }
}

func startGame() {
    var isLoop = true
    while isLoop {
        let myNumbers: [Int] = makeThreeRandomNumbers()
        let myNumbersString: String = myNumbers.map{String($0)}.joined(separator: ", ")
        print("임의의 수 : \(myNumbersString)")
        let gameScore: (strike: Int, ball: Int) = compare(my: myNumbers)
        checkResult(strike: gameScore.strike, ball: gameScore.ball)
        if gameScore.strike == 3 || remainCount == 0 {
            isLoop = false
        }
    }
}
