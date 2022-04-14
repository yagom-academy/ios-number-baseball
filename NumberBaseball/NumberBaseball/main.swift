//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

func startGame() {

    var givenChance: Int = 9
    var computerThreeNumbers: [Int]
    var userThreeNumbers: [Int]
    var resultOfStrikeAndBall: [Int]
    var strikeScore: Int
    var ballScore: Int
    var isSuccess: Bool = false
    
    computerThreeNumbers = makingThreeRandomNumbers()
    
    while !isSuccess && givenChance > 0 {
    
        userThreeNumbers = makingThreeRandomNumbers()
        
        resultOfStrikeAndBall = calculateResult(computer: computerThreeNumbers, user: userThreeNumbers)
        strikeScore = resultOfStrikeAndBall[0]
        ballScore = resultOfStrikeAndBall[1]
        
        print("임의의 수 : \(userThreeNumbers[0]) \(userThreeNumbers[1]) \(userThreeNumbers[2])")
        print("\(strikeScore) 스트라이크, \(ballScore) 볼")
        
        isSuccess = isThreeStrike(strikeScore)
        givenChance -= 1
        print("남은 기회 : \(givenChance)")
        
    }
    
    if isSuccess {
        print("사용자 승리...!")
    }
    
    if givenChance == 0 {
        print("컴퓨터 승리...!")
    }

}

func makingThreeRandomNumbers() -> [Int] {
    var list: [Int] = []
    
    while true {
        list.append(Int.random(in: 1...9))
        
        list = Array(Set(list))
        
        if list.count == 3 { break }
    }
    
    return list
}

func calculateResult(computer: [Int], user: [Int]) -> [Int] {
    
    var resultStrikeAndBall: [Int] = [0, 0]

    for userIndex in 0...2 {
        guard let computerIndex = computer.firstIndex(of: user[userIndex]) else { continue }
        
        if computerIndex == userIndex {
            resultStrikeAndBall[0] += 1
        } else {
            resultStrikeAndBall[1] += 1
        }
    }
    
    return resultStrikeAndBall
}

func isThreeStrike(_ strike: Int) -> Bool {
    if strike == 3 {
        return true
    } else {
        return false
    }
}

startGame()
