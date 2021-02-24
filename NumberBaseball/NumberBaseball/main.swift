//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

//import Foundation

var randomValue:[Int] = []
var count = 9

// MARK: - Main Class
class NumberBaseball {
  
    func startGame() {
        randomValue = random()
        
        while count != 0 {
            count -= 1
            
            let inputNum = random()
            print("임의의 수 : \(inputNum[0]) \(inputNum[1]) \(inputNum[2])")
            let result = compare(pitch: inputNum)
            
            if result[0] == 3 {
                print("사용자 승리!")
                return
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
    
    func random() -> [Int]{
        var randomNum:[Int] = []
        
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
    
    func compare(pitch score:[Int]) -> [Int] {
        var status:[Int] = []
        
        status.append(checkStrik(user: score))
        status.append(checkBall(user: score))
       
        return status
    }
    
    // MARK: - Check State
    func checkStrik(user:[Int]) -> Int{
        var strik = 0
        
        for (c, u) in zip(randomValue, user) {
            if c == u {
                strik += 1
            }
        }
        
        return strik
    }
    
    func checkBall(user:[Int]) -> Int {
        var ball = 0
        
        for i in 0..<3 {
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
