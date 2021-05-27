//
//  NumberBaseball - main.swift
//  Created by luyan, hosinging.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func generateRandomNumbers() -> [Int] {
    var randomNumbers: Set = Set<Int>()
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomNumbers)
}

func printNumbers(_ numbers: [Int]){
    print("임의의 수 : \(numbers.map{String($0)}.joined(separator: " "))")
}

func checkStrike(userNumbers: [Int], to computerNumbers: [Int], index: Int) -> Int {
    if(userNumbers[index] == computerNumbers[index]){
        return 1
    }else {
        return 0
    }
}

func checkTotalCalls(userNumbers: [Int], computerNumbers: [Int])-> Int {
    return Set(userNumbers).intersection(Set(computerNumbers)).count
}

func oneMatch(userNumbers: [Int],vs computerNumbers: [Int]) -> (Int, Int) {
    let totalCall = checkTotalCalls(userNumbers: userNumbers, computerNumbers: computerNumbers)
    if totalCall == 0 {
        print("0 스트라이크, 0 볼")
        return (0, 0)
    }
    var strike = 0
    for i in 0..<3{
        strike += checkStrike(userNumbers: userNumbers, to: computerNumbers, index: i)
    }
    let ball = totalCall - strike
    print("\(strike) 스트라이크, \(ball) 볼")
    
    if strike == 3 {
        printWinner(name: "사용자")
    }
    return (strike, ball)
}

func printWinner(name: String){
    print("\(name) 승리...!")
}


func gameStart(){
    let computerNumbers = generateRandomNumbers()
    printNumbers(computerNumbers)
    var gameCount: Int = 9
    var userNumbers = [Int]()
    var callResult: (strike: Int, ball: Int)
    while gameCount > 0 {
        userNumbers = generateRandomNumbers()
        printNumbers(userNumbers)
        callResult = oneMatch(userNumbers: userNumbers, vs: computerNumbers)
        gameCount -= 1
        print("남은 기회 : \(gameCount)")
    }
    printWinner(name: "컴퓨터")
    
    return
}

gameStart()







