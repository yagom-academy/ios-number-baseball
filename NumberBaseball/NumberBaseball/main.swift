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

private func calculateStrikeBall(from computerNumbers: Set<Int>, and playerNumbers: Set<Int>) -> [Int] {
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
    
    return [strikeCount, ballCount]
}

private func checkWin(by strikeCount: Int) -> Bool {
    return strikeCount == 3
}

private func createStringForConsole(with numbers: Set<Int>) -> String {
    let numbers = Array(numbers)
    var string = "임의의 수 :"
    
    for number in numbers {
        string += " \(number)"
    }
    
    return string
}

private func startNumberBaseballGame() {
    var chance = 9
    let computerNumbers = generateRandomNumbers()
    
    while chance > 0 {
        let playerNumbers = generateRandomNumbers()
        print(createStringForConsole(with: playerNumbers))
        let strikeBall = calculateStrikeBall(from: computerNumbers, and: playerNumbers)
        print("\(strikeBall[0]) 스트라이크, \(strikeBall[1]) 볼")
        
        if checkWin(by: strikeBall[0]){
            print("사용자 승리...!")
            return
        } else {
            chance -= 1
            print("남은 기회 : \(chance)")
        }
    }
    print("컴퓨터 승리...!")
}
startNumberBaseballGame()
