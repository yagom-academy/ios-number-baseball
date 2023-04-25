//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumberList: [Int] = [8, 2, 4]

func generateRandomNumberList() -> [Int] {
    var randomIntegerList: Set<Int> = []
    
    while randomIntegerList.count != 3 {
        randomIntegerList.insert(Int.random(in: 1...9))
    }
    
    return Array(randomIntegerList)
}

func checkStrikeAndBall(_ randomNumberList: [Int]) -> (strike: Int, ball: Int) {
    var strikeCount = 0
    var ballCount = 0

    for index in 0..<3 {
        strikeCount += computerNumberList[index] == randomNumberList[index] ? 1 : 0
        ballCount += computerNumberList.contains(randomNumberList[index]) ? 1 : 0
    }
    ballCount -= strikeCount
    
    return (strikeCount, ballCount)
}

func startNumberBaseball() {
    var inning = 9
    
    while inning != 0 {
        let randomNumberList = generateRandomNumberList()
        let strikeAndBallCount = checkStrikeAndBall(randomNumberList)
        inning -= 1
        
        print("""
              임의의 수 : \(randomNumberList[0]) \(randomNumberList[1]) \(randomNumberList[2])
              \(strikeAndBallCount.strike) 스트라이크, \(strikeAndBallCount.ball) 볼
              """)
        
        if strikeAndBallCount.strike == 3 {
            print("사용자 승리!")
            break
        }
        
        if inning == 0 {
            print("컴퓨터 승리...!")
            break
        }
        print("남은 기회 : \(inning)")
    }
}

startNumberBaseball()

