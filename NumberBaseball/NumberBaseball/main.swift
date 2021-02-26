//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerAnswers: [Int] = [Int]()
var gameCount: Int = 9

struct NumberBaseball {
    func isUserWin(strikeCount: Int) -> Bool { return strikeCount == 3 }
    func isComputerWin() -> Bool { return gameCount == 0 }
    
    func generateRandomAnswers() -> [Int] {
        var randomAnswers: [Int] = [Int]()
        
        while randomAnswers.count < 3 {
            let randomAnswer: Int = Int.random(in: 1...9)
            if randomAnswers.contains(randomAnswer) { continue }
            randomAnswers.append(randomAnswer)
        }
        
        return randomAnswers
    }
    
    func getGameResult(_ userAnswers: [Int]) -> [Int] {
        var strikeCount: Int = 0
        var ballCount: Int = 0
        
        for index in 0..<userAnswers.count {
            if userAnswers[index] == computerAnswers[index] {
                strikeCount += 1
            } else if computerAnswers.contains(userAnswers[index]) {
                ballCount += 1
            }
        }
        
        return [strikeCount, ballCount]
    }
    
    func printGameResult(_ userAnswers: [Int], _ gameResult: [Int]) {
        print("임의의 수 : \(userAnswers[0]) \(userAnswers[1]) \(userAnswers[2])")
        
        if isComputerWin() {
            print("컴퓨터 승리...!")
        }
        
        print("\(gameResult[0]) 스트라이크, \(gameResult[1]) 볼")
        
        if isUserWin(strikeCount: gameResult[0]) {
            print("사용자 승리!")
            gameCount = 0
        } else {
            print("남은 기회 : \(gameCount)")
        }
    }
    
    func startGame() {
        let userAnswers: [Int] = generateRandomAnswers()
        
        if gameCount == 9 {
            computerAnswers = generateRandomAnswers()
        }
        
        gameCount -= 1
        let gameResult: [Int] = getGameResult(userAnswers)
        printGameResult(userAnswers, gameResult)
        
        if gameCount > 0 {
            startGame()
        }
    }
}

NumberBaseball().startGame()
