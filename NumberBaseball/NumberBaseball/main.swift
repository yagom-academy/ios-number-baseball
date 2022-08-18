//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var comNumArray: Array<Int> = []
var tempNumArray: Array<Int> = []
var tryCount: Int = 9
var strikeCount: Int = 0
var ballCount: Int = 0

func createRandomNumbers() -> [Int] {
    var numbersSet: Set<Int> = []
    
    while numbersSet.count < 3 {
        numbersSet.insert(Int.random(in: 1...9))
    }
    return Array(numbersSet)
}

func checkBallStrike() {
    for (index,number) in tempNumArray.enumerated() {
        guard comNumArray.contains(number) else { continue }
        if comNumArray[index] == number {
            strikeCount += 1
        } else {
            ballCount += 1
        }
    }
}

func startGame() {
    comNumArray = createRandomNumbers()
    while tryCount > 0 {
        strikeCount = 0
        ballCount = 0
        tempNumArray = createRandomNumbers()
        
        print("임의의 수 : \(tempNumArray)")
        
        checkBallStrike()
        
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        
        if strikeCount == 3 {
            print("사용자 승리...!")
            break
        }
        tryCount -= 1
        
        print("남은 기회 : \(tryCount) \n")
    }

    if strikeCount != 3 {
        print("컴퓨터 승리...!")
    }
}

startGame()


