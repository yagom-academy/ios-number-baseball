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
        computerNumbers = randomNumbers()
        
        for _ in 1 ..< gameCount {
            let userNums: [Int] = randomNumbers()
            print("임의의 수 : \(userNums[0]) \(userNums[1]) \(userNums[2])")
            
            result(with: userNums)
            
            self.gameCount -= 1
            print("남은 기회 : \(gameCount)")
        }
    }
}

let baseball = Baseball()
baseball.startGame()

extension Baseball {
    // 1 ~ 9까지의 임의의 수 3개 생성
    func randomNumbers() -> [Int] {
        var numArray: [Int] = []
        
        for _ in 0...2 {
            var num: Int
            
            repeat {
                num = Int.random(in: 1...9)
            } while numArray.contains(num)
            numArray.append(num)
        }
        
        return numArray
    }
    
    func result(with userNumbers: [Int]) {
        var strikeCount: Int = 0
        var ballCount: Int = 0
        
        for index in 0...2 {
            if computerNumbers[index] == userNumbers[index] {
                strikeCount += 1
            } else if computerNumbers.contains(userNumbers[index]) {
                ballCount += 1
            }
        }
        
        print("\(strikeCount) 스트라이크 \(ballCount) 볼")
    }
}
