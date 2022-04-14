//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

func startGame() {
    
    var givenChance: Int = 9
    var threeRandomNumbers: [Int]
    var userPickedNumbers: [Int]
    var resultOfStrikeAndBall: [Int]
    
    threeRandomNumbers = pickThreeRandomNumbers()
    
    while givenChance > 0 {
    
        userPickedNumbers = pickThreeRandomNumbers()
        
        resultOfStrikeAndBall = calculateResult(computer: threeRandomNumbers, user: userPickedNumbers)
        print("임의의 수 : \(userPickedNumbers[0]) \(userPickedNumbers[1]) \(userPickedNumbers[2])")
        print("\(resultOfStrikeAndBall[0]) 스트라이크, \(resultOfStrikeAndBall[1]) 볼")
        
        if resultOfStrikeAndBall[0] == 3 {
            print("사용자 승리...!")
            break
        }
        
        givenChance -= 1
        print("남은 기회 : \(givenChance)")
    }
    
    if givenChance == 0 {
        print("컴퓨터 승리...!")
    }
}

func pickThreeRandomNumbers() -> [Int] {
    var list: [Int] = []
    
    while true {
        list.append(Int.random(in: 1...9))
        
        list = Array(Set(list))
        
        if list.count == 3 {
            break
        }
    }
    
    return list
}

func calculateResult(computer: [Int], user: [Int]) -> [Int] {
    
    var resultStrikeAndBall: [Int] = [0, 0]

    for i in 0...2 {
        guard let foundIdx = computer.firstIndex(of: user[i]) else { continue }
        
        if foundIdx == i {
            resultStrikeAndBall[0] += 1
        } else {
            resultStrikeAndBall[1] += 1
        }
    }
    
    return resultStrikeAndBall
}

startGame()
