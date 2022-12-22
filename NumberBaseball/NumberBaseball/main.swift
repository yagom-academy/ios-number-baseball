//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var winNumberArray: [Int] = []
var userNumberArray: [Int] = []
var strikeNumber = 0
var ballNumber = 0
var chance = 9

func createRandomNumbers() -> [Int] {
    var randomNumbers: Set<Int> = []
    
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    
    return Array(randomNumbers)
}

func countStrikeBall() {
    for index in 0 ..< winNumberArray.count {
        if winNumberArray[index] == userNumberArray[index] {
            strikeNumber += 1
        } else if winNumberArray.contains(userNumberArray[index]) {
            ballNumber += 1
        }
    }
}

func playGame() {
    winNumberArray = createRandomNumbers()
    
    for _ in 1...9 {
        userNumberArray = createRandomNumbers()
        countStrikeBall()
        chance -= 1
        
        print("임의의 수 :", userNumberArray.map { String($0) }.joined(separator: " "))
        print("\(strikeNumber) 스트라이크, \(ballNumber) 볼")
        
        if strikeNumber == 3 {
            print("사용자 승리!")
            break
        }
        
        if chance != 0 {
            print("남은기회 : \(chance)")
        }
        else {
            print("컴퓨터 승리...!")
        }
        
        strikeNumber = 0
        ballNumber = 0
    }
}

playGame()
