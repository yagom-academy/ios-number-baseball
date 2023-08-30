//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//


func playNumberBaseBallGame() {
    let computerRandomNumbers: [Int] = generateRandomNumber()
    var userRandomNumbers: [Int] = []
    var chance: Int = 9

    while chance != 0 {
        userRandomNumbers = generateRandomNumber()
        print("임의의 수 : \(userRandomNumbers.map { String($0) }.joined(separator: " "))")
        let (strike, ball) = checkStrikeAndBall(userNumbers: userRandomNumbers, randomNumbers: computerRandomNumbers)

        print("\(strike) 스트라이크, \(ball) 볼")
        if strike == 3 {
            print("사용자 승리!")

            return
        }
        chance -= 1
        if chance > 0 {
            print("남은 기회 : \(chance)")
        }
    }
    print("컴퓨터 승리...!")
}

func generateRandomNumber() -> [Int] {
    var numbers: Set<Int> = []

    while numbers.count < 3 {
        numbers.insert(Int.random(in: 1...9))
    }

    return numbers.map { Int($0) }
}

func checkStrikeAndBall(userNumbers: [Int], randomNumbers: [Int]) -> (Int, Int) {
    var strike: Int = 0
    var ball: Int = 0

    for (index, number) in userNumbers.enumerated() {
        if number == randomNumbers[index] {
            strike += 1
        } else if randomNumbers.contains(number) {
            ball += 1
        }
    }

    return (strike, ball)
}

playNumberBaseBallGame()
