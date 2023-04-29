//
//  NumberBaseball - main.swift
//  Created by redmango & dasanKim.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var computerRandomNumbers: [Int] = [Int]()

func createRandomNumbers() -> [Int] {
    var uniqueRandomNumbers: Set<Int> = Set<Int>()
    
    while uniqueRandomNumbers.count < 3 {
        uniqueRandomNumbers.insert(Int.random(in: 1...9))
    }
    
    return Array(uniqueRandomNumbers)
}

func compare(_ computerRandomNumbers: [Int], and userNumbers: [Int]
            ) -> (strikeCount: Int, ballCount: Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    for index in 0..<computerRandomNumbers.count {
        if computerRandomNumbers[index] == userNumbers[index] {
            strikeCount += 1
        } else if computerRandomNumbers.contains(userNumbers[index]){
            ballCount += 1
        }
    }
    
    return (strikeCount: strikeCount, ballCount: ballCount)
}

func judgeWinnerBy(_ strikeCount: Int, _ remainingChance: Int) -> String {
    var winner: String = String()
    
    if strikeCount == computerRandomNumbers.count {
        winner = "USER"
    } else if remainingChance == 0 {
        winner = "COMPUTER"
    }
    
    return winner
}

func selectMenu() {
    var isGameContinue: Bool = true
    
    while isGameContinue {
        print("""
        1. 게임시작
        2. 게임종료
        원하는 기능을 선택해주세요
        """, terminator: " : ")
        
        let selectedNumber: String? = readLine()
        
        switch selectedNumber {
        case "1":
            startBaseballGame()
        case "2":
            isGameContinue = false
        default:
            print("입력이 잘못되었습니다.")
        }
    }
}

func checkUserInput() -> [Int] {
    var validUserInputs: [Int] = [Int]()
    var isValid: Bool = false
    
    while !isValid {
        print("""
        숫자 \(computerRandomNumbers.count)개를 띄어쓰기로 구분하여 입력해주세요.
        중복 숫자는 허용하지 않습니다.
        입력
        """, terminator: " : ")
        
        guard let userInput = readLine() else {
            print("입력이 잘못되었습니다.")
            continue
        }
        
        validUserInputs = userInput
            .split(separator: " ")
            .compactMap{ Int($0) }
            .filter{(0 < $0) && ($0 < 10)}
                
        guard validUserInputs.count == Set(validUserInputs).count,
              validUserInputs.count == computerRandomNumbers.count
        else {
            print("입력이 잘못되었습니다.")
            continue
        }
        
        isValid = true
    }
    
    return validUserInputs
}

func startBaseballGame() {
    var userRandomNumbers: [Int] = [Int]()
    var remainingChance: Int = 9
    
    computerRandomNumbers = createRandomNumbers()
    
    while remainingChance > 0 {
        userRandomNumbers = checkUserInput()
        remainingChance -= 1
        
        let gameResult: (strikeCount: Int, ballCount: Int) = compare(computerRandomNumbers,
                                                                     and: userRandomNumbers)
        
        print("\(gameResult.strikeCount) 스트라이크, \(gameResult.ballCount) 볼")
        
        let winner: String = judgeWinnerBy(gameResult.strikeCount, remainingChance)
        
        if winner.isEmpty {
            print("남은 기회: \(remainingChance)")
        } else {
            print("\(winner) WIN!!")
            break
        }
    }
}

selectMenu()
