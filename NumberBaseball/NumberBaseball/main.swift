//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var initialComputerInput: Set<Int> = Set<Int>()
var extractedForComputer: Array<Int> = Array<Int>()
var verifiedUserArray: Array<Int> = Array<Int>()

var remainingChance = 9

func getRandomNumbersForComputer() {
    while initialComputerInput.count < 3 {
        let number: Int = Int.random(in: 1...9)
        initialComputerInput.insert(number)
    }
    extractedForComputer = Array(initialComputerInput)
}

func getRandomNumbersForUser() {
    var initialUserInput: Set<Int> = Set<Int>()
    while initialUserInput.count < 3 {
        let number: Int = Int.random(in: 1...9)
        initialUserInput.insert(number)
    }
    verifiedUserArray = Array(initialUserInput)
}

func decide() {
    var strikeCount = 0
    var ballCount = 0
    for element in 0...2 {
        if extractedForComputer[element] == verifiedUserArray[element] {
            strikeCount += 1
        } else if verifiedUserArray.contains(extractedForComputer[element]) {
            ballCount += 1
        }
    }
    
    if strikeCount == 3 {
        print("\(strikeCount) 스트라이크, \(ballCount) 볼 - 사용자 승리!")
    } else {
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    }
}

func startGame() {
    getRandomNumbersForComputer()
    while remainingChance != 0 {
        getRandomNumbersForUser()
        var result: String = "임의의 수 : "
        for element in 0...2 {
            result += "\(verifiedUserArray[element]) "
        }
        result.removeLast()
        print(result)
        
        decide()
        
        remainingChance -= 1
        print("남은 기회 : \(remainingChance)")
        if remainingChance == 0 {
            print("컴퓨터 승리...!")
        }
    }
}

startGame()
