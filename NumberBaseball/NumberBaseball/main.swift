//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

//MARK: - Step 1
//실험용 브랜치 파일

/// 1. 변수 설정
/// 2. 난수 3개 생성하는 함수 구현
///   - 중복된 숫자가 없어야한다
///   - 1~9 사이의 숫자여야 한다
/// 3. 게임 시작 함수 구현

private func generateRandomNumbers() -> Set<Int> {
    var randomNumbers: Set<Int> = []

    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1..<10))
    }

    return randomNumbers
}

private func calculateStrikeBall(from computerNumbers: Set<Int>, and playerNumbers: Set<Int>) -> (Int, Int) {
    var ballCount = computerNumbers.intersection(playerNumbers).count
    var strikeCount = 0
    let computerNumbers = Array(computerNumbers)
    let playerNumbers = Array(playerNumbers)
    
    for i in 0..<3 {
        if computerNumbers[i] == playerNumbers[i] {
            strikeCount += 1
            ballCount -= 1
        }
    }
    
    return (strikeCount, ballCount)
}

private func checkWin(by strikeCount: Int) -> Bool {
    return strikeCount == 3
}

private func createPlayerNumbersString(with numbers: Set<Int>) -> String {
    let numbers = Array(numbers)
    var playerNumbersString = "임의의 수 :"

    for number in numbers {
        playerNumbersString += " \(number)"
    }

    return playerNumbersString
}

private func startNumberBaseballGame() {
    var chance = 9
    let computerNumbers = generateRandomNumbers()
    var playerHasWon = false

    while chance > 0 {
        let playerNumbers = generateRandomNumbers()
        print(createPlayerNumbersString(with: playerNumbers))
        let (strikeCount, ballCount) = calculateStrikeBall(from: computerNumbers, and: playerNumbers)
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")

        if checkWin(by: strikeCount) {
            playerHasWon = true
            break
        } else {
            chance -= 1
            print("남은 기회 : \(chance)")
        }
    }
    
    if playerHasWon {
        print("사용자 승리...!")
    }else {
        print("컴퓨터 승리...!")
    }
}

startNumberBaseballGame()


