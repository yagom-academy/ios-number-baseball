//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

var randomValue: [Int] = []
var gameCount = 9

let strike_out = 3
let four_ball = 4


// MARK: - Main Class
class NumberBaseball {
    
  
    func startGame() {
        randomValue = createRandom()
        
        while gameCount != 0 {
               
            gameCount -= 1
            
            let inputNum = createRandom()
            print("임의의 수 : \(inputNum[0]) \(inputNum[1]) \(inputNum[2])")
            let result = compare(pitch: inputNum)
            
            if result[0] == strike_out {
                print("사용자 승리!")
                return
                
            } else if result[1] == four_ball {
                break
                
            } else {
                print("\(result[0]) 스트라이크, \(result[1]) 볼")
                print("남은 기회 : \(gameCount)")
            }
            
        }
        print("컴퓨터 승리...!")
        
    }
}

// MARK: - Extension
extension NumberBaseball {
    
    func startMenu() -> Int {
        print("1. 게임시작")
        print("2. 게임종료")
        print("원하는 기능을 선택해 주세요 : ", terminator : "")
        
        guard let menuNum = Int(readLine()!) else {
            return startMenu()
        }
            
        return 0
    }
    
    func createRandom() -> [Int] {
        var randomPitches: [Int] = []
        
        while randomPitches.count != 3 {
            let num = Int.random(in: 1...9)
            
            if randomPitches.contains(num) {
                continue
                
            } else {
                randomPitches.append(num)
            }
        }
        
        return randomPitches
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
        
        for (com, pitcher) in zip(randomValue, user) {
            if com == pitcher {
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
