//
//  NumberBaseball - main.swift
//  Created by Henry, Bobby. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class Baseball {
    
    var gameCount: Int = 9
    var computerNumbers: [Int] = []
    
    func startGame() {
        computerNumbers = returnRandomNumbers()
        
        for _ in 1 ..< gameCount {
            let userNumbers: [Int] = returnRandomNumbers()
            print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
            
            result(with: userNumbers)
            
            self.gameCount -= 1
            print("남은 기회 : \(gameCount)")
        }
    }
}

let baseball = Baseball()
baseball.startGame()

extension Baseball {
    // 1 ~ 9까지의 임의의 수 3개 생성
    func returnRandomNumbers() -> [Int] {
        var numberArray: [Int] = []
        
        for _ in 0...2 {
            var randomElement: Int
            
            repeat {
                randomElement = Int.random(in: 1...9)
            } while numArray.contains(randomElement)
            numArray.append(randomElement)
        }
        
        return numberArray
    }
    
    func result(with userArray: [Int]) {
        var strikeCount: Int = 0
        var ballCount: Int = 0
        
        for index in 0...2 {
            if computerNumbers[index] == userArray[index] {
                strikeCount += 1
            } else if computerNumbers.contains(userArray[index]) {
                ballCount += 1
            }
        }
        
        print("\(strikeCount) 스트라이크 \(ballCount) 볼")
    }
}
