//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var challenge: Int = 9
var isEnd: Bool = false
var randomComputerInput: [Int] = []
var randomNumberAnswer: [Int] = []

func checkStrikeCount() -> Int {
    var strikeCount = 0
    
    for index in 0...2 where randomComputerInput[index] == randomNumberAnswer[index] {
            strikeCount += 1
        randomComputerInput[index] = 0
    }
    
    return strikeCount
}

func checkBallCount() -> Int {
    var ballCount = 0
    for index in 0...2 where randomNumberAnswer.contains(randomComputerInput[index]) {
        ballCount += 1
    }
    return ballCount
}

func createRandomNumbers() -> [Int] {
    var result = Set<Int>()
    while result.count < 3 {
        result.insert(Int.random(in: 1...9))
    }

    return Array(result)
}

func printRandomNumber(_ numbers: [Int]){
    for number in numbers{
        print(number, terminator: " ")
    }
}

func printWinner(_ winner: String) {
    isEnd = true
    print("\n\(winner) 승리...!", terminator: " ")
}


func startGame(){
    randomNumberAnswer = createRandomNumbers()
    while !isEnd {
        print("임의의 수 :", terminator: " ")
        
        randomComputerInput = createRandomNumbers()
        printRandomNumber(randomComputerInput)
        
        let strikeCount: Int = checkStrikeCount()
        let ballCount: Int = checkBallCount()
        
        if strikeCount == 3 {
            printWinner("유저")
        }
        
        challenge -= 1
        if challenge == 0 {
            printWinner("컴퓨터")
        }
        
        print("\n\(strikeCount) 스트라이크, \(ballCount) 볼 \n남은 기회 : \(challenge)")
    }
}

startGame()
