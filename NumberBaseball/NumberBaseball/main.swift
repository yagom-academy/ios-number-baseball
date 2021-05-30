//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Edited by Soll & Seunggi
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

var remainingChance: Int = 9

func makeThreeRandomNumber() -> [String] {
    var tempComNumbers:Set<String> = []
    
    while tempComNumbers.count < 3 {
        tempComNumbers.insert(String(Int.random(in: 1...9)))
    }
    let comNumbers = Array(tempComNumbers)
    return comNumbers
}

func judgeStrikeBall(comNumbers: [String], userNumbers: [String]) -> String {
    var strike = 0, ball = 0
    
    if comNumbers == userNumbers {
        remainingChance = 0
        return "사용자 승리!"
    }
    
    for index in 0..<comNumbers.count {
        if comNumbers[index] == userNumbers[index] {
            strike += 1
        }
    }
    
    for index in 0..<comNumbers.count {
        if comNumbers.contains(userNumbers[index]) {
            ball += 1
        }
    }
    
    ball = ball - strike
    remainingChance -= 1
    return "\(strike) 스트라이크, \(ball) 볼"
}

func startGame() {
    let comNumbers: [String] = makeThreeRandomNumber()
    while remainingChance != 0 {
        let userNumbers: [String] = makeThreeRandomNumber()
        let randomNumbers: String = userNumbers.joined(separator: " ")
        
        print("임의의 수: \(randomNumbers)")
        if remainingChance == 1 {
            print("컴퓨터 승리...!")
        }
        print(judgeStrikeBall(comNumbers: comNumbers, userNumbers: userNumbers))
        print("남은 기회: \(remainingChance)")
    }
}

startGame()

