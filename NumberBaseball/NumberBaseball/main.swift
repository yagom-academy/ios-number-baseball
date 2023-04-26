//
//  NumberBaseball - main.swift
//  Created by myungsun, yyss99.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func makeUniqueRandomNumbers() -> [Int] {
    var randomNumbers = Set<Int>()
    
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    
    return Array(randomNumbers)
}

func getBallAndStrikeResult(of userNumbers: [Int]) -> (Int, Int) {
    let sameNumbers = computerNumbers.filter{ userNumbers.contains($0) }
    var ballCount = 0
    var strikeCount = 0
    
    for number in sameNumbers {
        if computerNumbers.firstIndex(of: number) == userNumbers.firstIndex(of: number) {
            strikeCount += 1
        }
    }
    
    ballCount = sameNumbers.count - strikeCount
    
    return (ballCount, strikeCount)
}

func startGame() {
    while tryCounts > 0 {
        let userNumbers = makeUniqueRandomNumbers()
        let (ballCount, strikeCount) = getBallAndStrikeResult(of: userNumbers)
        
        print("임의의 수 : \(userNumbers.map { String($0)}.joined(separator: " "))")
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        
        tryCounts -= 1
        
        if tryCounts > 0 {
            print("남은 기회 : \(tryCounts)")
        }
        
        if strikeCount == 3 {
            print("사용자 승리!")
            break
        }
        
        if tryCounts == 0 {
            print("컴퓨터 승리...!")
        }
        print()
    }
}

func showMenu() {
    while true {
        print("1. 게임시작 \n2. 게임종료 \n원하는 기능을 선택해주세요 : ", terminator: "")
        let menuChoice = readLine() ?? ""
        let startOption = "1"
        let endOption = "2"
        
        if menuChoice == startOption {
            print("start Game")
        } else if menuChoice == endOption {
            print("end Game")
            break
        } else {
            print("입력이 잘못되었습니다.")
        }
    }
}

let computerNumbers = makeUniqueRandomNumbers()
var tryCounts = 9

showMenu()
