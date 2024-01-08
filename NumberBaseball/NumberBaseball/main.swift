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

func verifyMenuInput(input: String?) -> Bool {
    if input == "1" || input == "2" {
        return true
    } else {
        return false
    }
}

func selectMenu() {
    let messageToPrint = """
    1. 게임시작
    2. 게임종료
    원하는 기능을 선택해주세요 :
    """
    
    print(messageToPrint, terminator: " ")
    
    let menuInput = readLine()
    
    if verifyMenuInput(input: menuInput) {
        if menuInput == "1" {
            runGame()
            selectMenu()
        } else if menuInput == "2" {
            return
        }
    } else {
        print("입력이 잘못되었습니다.")
        selectMenu()
    }
}

func verifyPlayerNumberInput(input: String?) -> Bool {
    guard let safeInput = input else {
        return false
    }
    
    guard let regex = try? NSRegularExpression(pattern: "^[1-9] [1-9] [1-9]$") else {
        return false
    }
    
    let matches = regex.matches(in: safeInput, range: NSRange(0..<safeInput.count))
    
    if matches.isEmpty {
        return false
    }
    
    return Set(safeInput.split(separator: " ").compactMap { Int($0) }).count == 3 ? true : false
}

func readPlayerNumbers() -> [Int] {
    let messageToPrint = """
    숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
    중복 숫자는 허용하지 않습니다.
    입력 :
    """
    
    print(messageToPrint, terminator: " ")
    
    let playerNumberInput = readLine()
    
    if verifyPlayerNumberInput(input: playerNumberInput) {
        guard let safePlayerNumberInput = playerNumberInput else {
            return readPlayerNumbers()
        }
        
        return safePlayerNumberInput.split(separator: " ").compactMap { Int($0) }
    } else {
        print("입력이 잘못되었습니다.")
        return readPlayerNumbers()
    }
}

selectMenu()
