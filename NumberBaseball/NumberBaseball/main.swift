//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomAnswer = [Int]()
var count: Int = 9

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
    
    func printGameResult(gameResult:[Int], count: Int) {
        print("\(gameResult[0]) 스트라이크, \(gameResult[1]) 볼")
        print("남은 기회 : \(count)")
    }
    
    func startGame() {
        count -= 1
        let input = generateRandomNumber()
        randomAnswer = generateRandomNumber()
        // get userInput
        let gameResult:[Int] = getResult(userInput: input, answer: randomAnswer)
        printGameResult(gameResult: gameResult, count: count)
        if count > 0 {
            startGame()
        }
    }
}

