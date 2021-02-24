//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

//import Foundation

var randomValue: [Int] = []
var count = 9

let STRIKEOUT = 3
let FOURBALL = 4


// MARK: - Main Class
class NumberBaseball {
  
    func startGame() {
        randomValue = random()
        
        while count != 0 {
            count -= 1
            
            let inputNum = random()
            print("임의의 수 : \(inputNum[0]) \(inputNum[1]) \(inputNum[2])")
            let result = compare(pitch: inputNum)
            
            if result[0] == STRIKEOUT {
                print("사용자 승리!")
                return
                
            } else if result[1] == FOURBALL {
                break
                
            } else {
                print("\(result[0]) 스트라이크, \(result[1]) 볼")
                print("남은 기회 : \(count)")
            }
            
        }
        print("컴퓨터 승리...!")
        
    }
}

// MARK: - Extension
extension NumberBaseball {
    
    func random() -> [Int] {
        var randomNum: [Int] = []
        
        while randomNum.count != 3 {
            let num = Int.random(in: 1...9)
            
            if randomNum.contains(num) {
                continue
                
            } else {
                randomNum.append(num)
            }
        }
        
        return randomNum
    }
    
    func compare(pitch score: [Int]) -> [Int] {
        var status: [Int] = []
        
        status.append(checkStrike(user: score))
        status.append(checkBall(user: score))
       
        return status
    }
    
    // MARK: - Check State
    func checkStrike(user: [Int]) -> Int {
        var strike = 0
        
        for (com, user) in zip(randomValue, user) {
            if com == user {
                strike += 1
            }
        }
        
        return strike
    }
    
    func checkBall(user: [Int]) -> Int {
        var ball = 0
        
        for i in 0..<randomValue.count {
            if randomValue.contains(user[i]) && (randomValue[i] != user[i]) {
                ball += 1
            }
        }
        
        return ball
    }
}

// MARK: - Create Instance && Start
let NBGame = NumberBaseball()
NBGame.startGame()
