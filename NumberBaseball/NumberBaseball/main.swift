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

        while count != 0 {
            print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
            print("중복 숫자는 허용하지 않습니다.")
            print("입력", terminator: ":")
            var inputNum = readLine()!.split(separator: " ").map { Int(String($0))! }
            if inputNum.count == 3 {
                inputNum = checkRepeat(userInput: inputNum)
                print("임의의 수 : \(inputNum[0]) \(inputNum[1]) \(inputNum[2])")
                count -= 1
                let result = compare(pitch: inputNum)
                
                if result[0] == STRIKEOUT {
                    print("사용자 승리!")
                    print("1. 게임시작")
                    print("2. 게임 종료")
                    return
                    
                } else if result[1] == FOURBALL {
                    break
                    
                } else {
                    print("\(result[0]) 스트라이크, \(result[1]) 볼")
                    print("남은 기회 : \(count)")
                    }
            }
            else {
                print("잘못입력하셨습니다.")
                startGame()
            }
        }
        print("컴퓨터 승리...!")
    }
    func chooseGame() {
        print("1. 게임시작")
        print("2. 게임 종료")
        print("원하는 기능을 선택해주세요", terminator: ": ")
      
        if let userInput = readLine() {
            switch userInput {
            case "1":
                startGame()
              
            case "2":
                print("게임을 종료합니다")
              
            default:
                print("입력이 잘못되었습니다")
                chooseGame()
            }
        }
    }
    func checkRepeat(userInput: [Int]) -> [Int] {
        var nonRepNums: [Int] = [Int]()
      
        for idx in userInput {
            if nonRepNums.contains(idx) {
                startGame()
              
            } else {
            nonRepNums.append(idx)
            }
        }
        return nonRepNums
    }
}

// MARK: - Extension
extension NumberBaseball {
    
    func createRandom() -> [Int] {
        var randomNum: [Int] = []
        
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
NBGame.chooseGame()
