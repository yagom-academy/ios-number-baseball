//
//  NumberBaseball - main.swift
//  Created by Henry, Bobby. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class Baseball {
    
    var gameCount: Int = 9
    var comNums: Array<Int> = []
    
    func startGame() {
        comNums = randomNumber()
        
        while gameCount > 0 {
            let userNums: Array<Int> = randomNumber()
            print("임의의 수 : \(userNums[0]) \(userNums[1]) \(userNums[2])")
            
            result(user: userNums)
            
            gameCount -= 1
            print("남은 기회 : \(gameCount)")
        }
    }
}

var gameStart: Baseball = Baseball()
gameStart.startGame()

extension Baseball {
    
    func randomNumber() -> Array<Int> {
        var numArray: Array<Int> = []
        
        for _ in 0...2 {
            var num: Int
            
            repeat {
                num = Int.random(in: 1...9)
            } while numArray.contains(num) == true
            numArray.append(num)
        }
        
        return numArray
    }
    
    func result(user: [Int]) {
        var strikeCount: Int = 0
        var ballCount: Int = 0
        
        for i in 0...2 {
            if comNums[i] == user[i] {
                strikeCount += 1
                
            }else if comNums.contains(user[i]) {
                ballCount += 1
            }
        }
        
        print("\(strikeCount) 스트라이크 \(ballCount) 볼")
    }
}
