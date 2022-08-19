//
//  NumberBaseball - main.swift
//  Created by 애종,LJ.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var computerNumberArray: Array<Int> = []
var randomNumberArray: Array<Int> = []
var tryCount: Int = 9
var strikeCount: Int = 0
var ballCount: Int = 0


startGame()

func startGame() {
    computerNumberArray = createRandomNumbers()
    while tryCount > 0 {
        strikeCount = 0
        ballCount = 0
        randomNumberArray = createRandomNumbers()
        
        printRandomNumberArray()
        checkStrikeAndBall()
        
        print("\n\(strikeCount) 스트라이크, \(ballCount) 볼")
        
        
        tryCount -= 1
        judgeVictory(by: strikeCount)
        printRemainTryCount()
    }
}

func createRandomNumbers() -> [Int] {
    var numbersSet: Set<Int> = []
    
    while numbersSet.count < 3 {
        numbersSet.insert(Int.random(in: 1...9))
    }
    return Array(numbersSet)
}

func judgeVictory(by strikeCount: Int){
    if strikeCount == 3 {
        print("사용자 승리...!")
    } else if tryCount == 0 {
        print("컴퓨터 승리...!")
    }
}

func printRemainTryCount() {
    if strikeCount != 3 && tryCount > 0 { //남은기회 출력조건
        print("남은 기회 : \(tryCount) \n")
    }
}




func checkStrikeAndBall() {
    for (index,number) in randomNumberArray.enumerated() {
        guard computerNumberArray.contains(number) else { continue }
        if computerNumberArray[index] == number {
            strikeCount += 1
        } else {
            ballCount += 1
        }
    }
}

func printRandomNumberArray() {
    for index in 0...2 {
        print("임의의 수 : \(randomNumberArray[index])", terminator: " ")
    }
}



