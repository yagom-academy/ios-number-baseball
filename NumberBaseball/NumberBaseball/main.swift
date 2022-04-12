//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var challenge: Int = 9
var isEnd: Bool = false
var randomNumberAnswer: Array<Int> = {
    var result = Set<Int>()
    while result.count < 3 {
        result.insert(Int.random(in: 1...9))
    }
    return Array(result)
}()

func checkStrikeAndBall(_ randomNumbers: Array<Int>) -> [Int] {
    var countList: [Int] = [0,0]
    var randomInput = randomNumbers
    for index in 0...2 {
        if randomNumbers[index] == randomNumberAnswer[index] {
            countList[0] += 1
            randomInput[index] = 0
        }
        if randomNumberAnswer.contains(randomInput[index]) {
            countList[1] += 1
        }
    }
    return countList
}

func createRandomNumbers() -> [Int] {
    var result = Set<Int>()
    while result.count < 3 {
        result.insert(Int.random(in: 1...9))
    }
    return Array(result)
}

func printWinner(_ winner: String) {
    isEnd = true
    print("\n\(winner) 승리...!", terminator: " ")
}

while !isEnd {
    print("임의의 수 :", terminator: " ")
    let randomNumbers = createRandomNumbers()
    for randomNumber in randomNumbers{
        print(randomNumber, terminator: " ")
    }
    let countList: [Int] = checkStrikeAndBall(randomNumbers)
    
    if countList[0] == 3 {
        printWinner("유저")
    }
    
    challenge -= 1
    if challenge == 0 {
        printWinner("컴퓨터")
    }
    
    print("\n\(countList[0]) 스트라이크, \(countList[1]) 볼")
    print("남은 기회 : \(challenge)")
}


