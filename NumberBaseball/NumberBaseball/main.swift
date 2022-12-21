//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var chance = 9

func createRandomNumbers() -> [Int] {
    var randomNumbers = Set<Int>()
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomNumbers)
}

func checkStrike(_ computerNumbers: [Int], _ userNumbers: [Int]) -> (Int, Int) {
    var strike = 0
    var ball = 0
    for index in 0..<3 {
        if computerNumbers[index] == userNumbers[index] {
            strike += 1
        } else {
            ball += 1
        }
    }
    return (strike, ball)
}

func startGame() {
    
    while chance > 0 {
        let comNums = createRandomNumbers()
        let userNums = createRandomNumbers()
        
        let (strike, ball) = checkStrike(comNums, userNums)
        chance -= 1
        
        print("임의의 수 : \(comNums.map{ String($0) }.joined(separator: " "))")
        print("\(strike) 스트라이크, \(ball) 볼")
        print("남은 기회 : \(chance)")
        
        
        if strike == 3 {
            print("사용자 승리...!")
            break
        } else if chance == 0 {
            print("컴퓨터 승리...!")
        }
    }
}

func selectMenu() -> Bool {
    print("""
          1. 게임시작
          2. 게임종료
          """)
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    
    guard let selectedMenu = readLine() else {
        print("입력이 잘못되었습니다")
        return selectMenu()
    }
    switch Int(selectedMenu) {
    case 1:
        return true
    case 2:
        return false
    default:
        print("입력이 잘못되었습니다")
        return selectMenu()
    }
}

while selectMenu() {
    startGame()
}
