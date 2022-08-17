//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

playGame()

func createThreeRandomInt() -> [Int] {
    var result: Set<Int> = Set<Int>()
    while result.count < 3 {
        result.insert(Int.random(in: 1...9))
    }
    
    return Array(result)
}

func determineStrikesBallsInTwoNumbers(_ computerNumbers: [Int], _ userNumbers: [Int]) -> (strike: Int, ball: Int) {
    var ball: Int = 0
    var strike: Int = 0
    
    for userNumber in userNumbers {
        if computerNumbers.contains(userNumber) {
            ball += 1
        }
    }
    
    for index in 0...2 {
        if userNumbers[index] == computerNumbers[index] {
            strike += 1
        }
    }
    
    ball -= strike
    return (strike: strike, ball: ball)
}

func playGame() {
    var trialNumber: Int = 9
    let computerNumbers = createThreeRandomInt()
    
    while true {
        trialNumber -= 1
        let userNumbers: [Int] = createThreeRandomInt()
        print("임의의 수 : \(userNumbers.map { String($0) }.joined(separator: " "))")
        let result = determineStrikesBallsInTwoNumbers(computerNumbers,
                                                       userNumbers)
        print("\(result.strike) 스트라이크, \(result.ball) 볼")
        
        if result.strike == 3 {
            print("사용자 승리")
            break
        } else if trialNumber == 0 {
            print("컴퓨터 승리")
            break
        } else {
            print("남은 기회 : \(trialNumber)")
        }
    }
}
