//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomAnswer = [Int]()
var gameCount: Int = 9

struct NumberBaseball{
    func generateRandomNumber() -> [Int] {
        var result = [Int]()
        while result.count < 3 {
            let number = Int.random(in: 1...9)
            if result.contains(number) { continue }
            result.append(number)
        }
        return result
    }
    
    func getResult(userInput: [Int], answer: [Int]) -> [Int] {
        var strike: Int = 0
        var ball: Int = 0
        for i in 0..<userInput.count {
            if userInput[i] == answer[i] {
                strike += 1
            } else if answer.contains(userInput[i]){
                ball += 1
            }
        }
        return [strike, ball]
    }
    
    func printGameResult(userInput: [Int], gameResult: [Int], gameCount: Int) {
        print("임의의 수: \(userInput[0]) \(userInput[1]) \(userInput[2])")
        if gameCount == 0 {
            print("컴퓨터 승리...!")
        }
        print("\(gameResult[0]) 스트라이크, \(gameResult[1]) 볼")
        if gameResult[0] == 3 {
            print("사용자 승리!")
        } else {
        print("남은 기회 : \(gameCount)")
        }
    }
    
    func startGame() {
        gameCount -= 1
        let input = generateRandomNumber()
        let userInput = generateRandomNumber()
        randomAnswer = generateRandomNumber()
        // get userInput
        let gameResult:[Int] = getResult(userInput: input, answer: randomAnswer)
        printGameResult(userInput: userInput, gameResult: gameResult, gameCount: gameCount)
        if gameCount > 0 {
            startGame()
        }
    }
}

NumberBaseball().startGame()
