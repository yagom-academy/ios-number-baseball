//
//  NumberBaseball - main.swift
//  Created by Chuuny & Doogie.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var chance = 9

func makeRandomNumbers() -> [String] {
    var randomNumbers: Set<String> = []

    while randomNumbers.count < 3 {
        let numbers = Int.random(in: 1...9)
        randomNumbers.insert(String(numbers))
    }

    return Array(randomNumbers)
}

func calculateCounts(userNumbers: [String], randomNumbers: [String]) -> (strikeCounts: Int, ballCounts: Int) {
    var strikeCounts = 0
    var ballCounts = 0

    for number in userNumbers {
        ballCounts += randomNumbers.filter { $0.contains(number) }.count
    }

    for (index, number) in userNumbers.enumerated() {
        strikeCounts += randomNumbers.enumerated().filter { $0.element == number && $0.offset == index }.count
    }

    ballCounts -= strikeCounts

    return (strikeCounts, ballCounts)
}

func checkVictory(userNumbers: [String], randomNumbers: [String]) -> Bool {
    if userNumbers == randomNumbers {
        print("사용자 승리...!")
        return true
    }
    else {
        chance -= 1
    }

    return false
}

func playGame() {
    chance = 9
    let randomNumbers = makeRandomNumbers()
    while chance > 0 {
        let userNumbers = makeRandomNumbers()

        print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
        if checkVictory(userNumbers: userNumbers, randomNumbers: randomNumbers) {
            return
        }
        else if chance == 0 {
            print("컴퓨터 승리...!")
        }
        print("\(calculateCounts(userNumbers: userNumbers, randomNumbers: randomNumbers).strikeCounts) 스트라이크, \(calculateCounts(userNumbers: userNumbers, randomNumbers: randomNumbers).ballCounts) 볼")

        print("남은 기회 \(chance)")
    }
}

playGame()
