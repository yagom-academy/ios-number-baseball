//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func drawRandomNumbers() -> [Int] {
    var uniqueRandomNumbers: Set<Int> = []
    var randomNumbers: [Int] = []
    var randomNumber: Int = 0
    
    while randomNumbers.count < 3 {
        randomNumber = Int.random(in: 1...9)
        
        if uniqueRandomNumbers.insert(randomNumber).inserted {
            randomNumbers.append(randomNumber)
        }
    }
    
    return randomNumbers
}

func checkMatchingCount(with computerRandomNumbers: [Int], _ userRandomNumbers: [Int]) -> Int {
    return Set(computerRandomNumbers).intersection(userRandomNumbers).count
}

func checkStrikeCount(with computerRandomNumbers: [Int], _ userRandomNumbers: [Int]) -> Int {
    return (0..<computerRandomNumbers.count).filter { computerRandomNumbers[$0] == userRandomNumbers[$0] }.count
}

func checkBallCount(matching matchCount: Int, strike strikeCount: Int) -> Int {
    return matchCount - strikeCount
}

func printMessages(with userRandomNumbers: [Int], _ strikeCount: Int, _ ballCount: Int, _ remainCount: Int) -> Bool {
    print("임의의 수 : \(userRandomNumbers.map { String($0) }.joined(separator: " "))")
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    
    if strikeCount != 3 && remainCount == 0 {
        print("컴퓨터 승리...!")
        return false
    } else if strikeCount == 3 {
        print("사용자 승리!!!!")
        return false
    } else {
        print("남은 기회 : \(remainCount)")
    }
    
    return true
}

func playBaseballGame() {
    let computerRandomNumbers: [Int] = drawRandomNumbers()
    var remainCount: Int = 9
    
    while remainCount > 0 {
        let userRandomNumbers = drawRandomNumbers()
        let matchCount = checkMatchingCount(with: computerRandomNumbers, userRandomNumbers)
        let strikeCount = checkStrikeCount(with: computerRandomNumbers, userRandomNumbers)
        let ballCount = checkBallCount(matching: matchCount, strike: strikeCount)
        remainCount -= 1

        guard printMessages(with: userRandomNumbers, strikeCount, ballCount, remainCount) else { return }
    }
}

func inputUserMenu() {
    var isRun: Bool = true
    
    while isRun {
        print("1. 게임시작 \n2. 게임종료")
        print("원하는 기능을 선택해주세요 :", terminator: " ")
        
        guard let userMenu = readLine() else { return }
        
        if userMenu == "1" {
            playBaseballGame()
        } else if userMenu == "2" {
            print("게임종료")
            isRun = false
        } else {
            print("입력이 잘못되었습니다")
        }
    }
}

//MARK: 실행
inputUserMenu()
