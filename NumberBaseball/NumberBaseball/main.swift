//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func generateRandomNumbers() -> [Int] {
    return Array((1...9).shuffled()[0..<3])
}

func calculateRoundResult(computerNumbers: [Int], playerNumbers: [Int]) -> (strikeCount: Int, ballCount: Int) {
    let computerNumbersSet = Set(computerNumbers)
    let playerNumbersSet = Set(playerNumbers)
    
    var strikeCount = 0
    var ballCount = 0
    
    for index in 0..<3 {
        if computerNumbers[index] == playerNumbers[index] {
            strikeCount += 1
        }
    }
    
    ballCount = computerNumbersSet.intersection(playerNumbersSet).count - strikeCount
    
    return (strikeCount: strikeCount, ballCount: ballCount)
}

func runGame() {
    let computerNumbers = generateRandomNumbers()
    var remainedInnings = 9
    
    while remainedInnings > 0 {
        let playerNumbers = readPlayerNumbers()
        
        print("임의의 수 : \(playerNumbers[0]) \(playerNumbers[1]) \(playerNumbers[2])")
        
        let roundResult = calculateRoundResult(computerNumbers: computerNumbers, playerNumbers: playerNumbers)
        let strikeCount = roundResult.strikeCount
        let ballCount = roundResult.ballCount
        
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        
        if strikeCount == 3 {
            print("사용자 승리!")
            return
        }
        
        remainedInnings -= 1
        print("남은 기회 : \(remainedInnings)")
    }
    
    print("컴퓨터 승리...!")
}

func selectMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    
    if let userInput = readLine(), userInput == "1" || userInput == "2" {
        if userInput == "1" {
            runGame()
        } else {
            return
        }
    } else {
        print("입력이 잘못되었습니다.")
    }
}

func readPlayerNumbers() -> [Int] {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    
    guard let input = readLine() else {
        print("입력이 잘못되었습니다.")
        return readPlayerNumbers()
    }
    
    guard let regex = try? NSRegularExpression(pattern: "^[1-9] [1-9] [1-9]$") else {
        print("유효하지 않은 패턴입니다.")
        return readPlayerNumbers()
    }
    
    let matchResults = regex.matches(in: input, range: NSRange(0..<input.count))
    
    if matchResults.isEmpty {
        print("입력이 잘못되었습니다.")
        return readPlayerNumbers()
    }
    
    let playerNumbers = input.split(separator: " ").compactMap { Int($0) }
    
    if Set(playerNumbers).count == 3 {
        return playerNumbers
    } else {
        print("입력이 잘못되었습니다.")
        return readPlayerNumbers()
    }
}

selectMenu()
