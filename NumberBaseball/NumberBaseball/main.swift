//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: [Int] = [Int]()
var trialNumber: Int = 9

playGame()

func createThreeRandomInt() -> [Int] {
    var result: Set<Int> = Set<Int>()
    while result.count < 3 {
        result.insert(Int.random(in: 1...9))
    }
    
    return Array(result)
}

func compareResult(computerNumbers: [Int], userNumbers: [Int]) -> [Int] {
    var ball: Int = 0
    var strike: Int = 0
    
    for userNumber in userNumbers {
        if computerNumbers.contains(userNumber) {
            ball += 1
        }
    }
    
    for indexs in 0...2 {
        if userNumbers[indexs] == computerNumbers[indexs] {
            strike += 1
        }
    }
    
    ball -= strike
    return [strike, ball]
}

func playGame() {
    computerNumbers = createThreeRandomInt()
    
    while true {
        let userNumbers: [Int] = createThreeRandomInt()
        trialNumber -= 1
        print("임의의 수 : \(userNumbers.map { String($0) }.joined(separator: " "))")
        let result: [Int] = compareResult(computerNumbers: computerNumbers,
                                          userNumbers: userNumbers)
        print("\(result[0]) 스트라이크, \(result[1]) 볼")
        if result[0] == 3 {
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
