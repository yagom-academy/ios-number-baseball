//
//  NumberBaseball - main.swift
//  Created by Henry, Bobby. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class Baseball {
    
    var gameCount: Int = 9
    var computerNumbers: [Int] = []
}

let baseball = Baseball()
baseball.startGame()

extension Baseball {
    
    func startGame() {
        computerNumbers = returnRandomNumbers()
        
        for _ in 1 ..< gameCount {
            let userNumbers: [Int] = returnRandomNumbers()
            print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
            
            if let strikeCount = returnComparedResult(with: userNumbers)["strikeCount"],  let ballCount = returnComparedResult(with: userNumbers)["ballCount"] {
                printGameResult(strike: strikeCount, ball: ballCount)
            }
        }
    }
    
    // 1 ~ 9까지의 임의의 수 3개 생성
    func returnRandomNumbers() -> [Int] {
        var numberArray: [Int] = []
        
        for _ in 0...2 {
            var randomElement: Int
            
            repeat {
                randomElement = Int.random(in: 1...9)
            } while numberArray.contains(randomElement)
            numberArray.append(randomElement)
        }
        
        return numberArray
    }
    
    func returnComparedResult(with userRandomArray: [Int]) -> [String: Int] {
        var resultDict: [String : Int] = ["strikeCount": 0, "ballCount": 0]
        
        for index in 0..<userRandomArray.count {
            if computerNumbers[index] == userRandomArray[index] {
                guard let strike = resultDict["strikeCount"] else { continue }
                resultDict["strikeCount"] = strike + 1
            } else if computerNumbers.contains(userRandomArray[index]) {
                guard let ball = resultDict["ballCount"] else { continue }
                resultDict["ballCount"] = ball + 1
            }
        }
        return resultDict
    }
    
    func printGameResult(strike : Int, ball : Int) {
        print("\(strike) 스트라이크 \(ball) 볼")
        gameCount -= 1
        print("남은 기회 : \(gameCount)")
    }
}

