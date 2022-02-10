//
//  NumberBaseball - main.swift
//  Created by Roy and 쿼카 .
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let computerNumbers = generateRandomNumbers()
var remainingChangeCount: Int = 9

func generateRandomNumbers(range: ClosedRange<Int> = 1...9, three: Int = 3) -> Set<Int> {
    var randomNumbers: Set<Int> = []
    while randomNumbers.count < three {
        randomNumbers.insert(Int.random(in: range))
    }
    return randomNumbers
}

func compareNumbers(user: Set<Int>, computer: Set<Int>) -> (strikeResult: Int, ballResult: Int) {
    var (strikeCount, ballCount) = (Int.zero, Int.zero)
    for index in Array(user).indices {
        strikeCount += Array(user)[index] == Array(computer)[index] ? 1 : 0
    }
    ballCount = (computer.intersection(user).count - strikeCount)
    return (strikeCount, ballCount)
}

func printPlayingGameMessage(userNumbers: Set<Int> ,ballCount: Int ,strikeCount: Int) {
    let (strike, ball) =  ("스트라이크," ,"볼")
    let (randomNumbers, remainingChance) = ("임이의 수 : " ,"남은 기회 :")
    let squareBraketRight: CharacterSet = ["[","]"]
    
    print("\(randomNumbers) \(userNumbers.description.replacingOccurrences(of: ",", with: "").trimmingCharacters(in: squareBraketRight))")
    print("\(strikeCount) \(strike) \(ballCount) \(ball) ")
    print("\(remainingChance) \(remainingChangeCount)")
}

func startGame() {
    while remainingChangeCount > .zero {
        let userNumbers = generateRandomNumbers()
        let (strikeCount, ballCount) = compareNumbers(user: userNumbers, computer: computerNumbers)
        remainingChangeCount -= 1
        printPlayingGameMessage(userNumbers: userNumbers, ballCount: ballCount, strikeCount: strikeCount)
        if strikeCount > 2 {
            print("사용자 승리...!")
            return
        } else if remainingChangeCount == .zero {
            print("컴퓨터 승리...!")
        }
    }
}
startGame()
