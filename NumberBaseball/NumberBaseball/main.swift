//  NumberBaseball - main.swift
//  Created by qoocrab, bmo.
//  Copyright © yagom academy. All rights reserved.

import Foundation

func generateNumbers() -> [Int] {
    var numbers: [Int] = []
    
    while numbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !numbers.contains(randomNumber) {
            numbers.append(randomNumber)
        }
    }
    
    return numbers
}

func evaluateStrikeBall(computer computerNumbers: [Int], player playerNumbers: [Int]) -> (Int, Int) {
    var ball = 0
    var strike = 0
    
    for index in 0...2 {
        if playerNumbers[index] == computerNumbers[index] {
            strike += 1
        } else if computerNumbers.contains(playerNumbers[index]) {
            ball += 1
        }
    }
    
    return (strike, ball)
}

func playNumberBaseballGame() {
    let computerNumbers = generateNumbers()
    var playerNumbers: [Int] = []
    var remainingChance = 9
    
    while remainingChance > 0 {
        var strike = 0
        var ball = 0
        
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.\n입력 : ", terminator: "")
        let input = readLine() ?? ""
        
        playerNumbers = input
            .split(separator: " ")
            .compactMap { Int($0 ) }
            .filter { $0 > 0 && $0 < 10 }
        
        if playerNumbers.count != 3 {
            print("입력이 잘못되었습니다.")
            continue
        }
        
        remainingChance -= 1
        
        (strike, ball) = evaluateStrikeBall(computer: computerNumbers, player: playerNumbers)
        
        print("\(strike) 스트라이크, \(ball) 볼")
        
        if strike == 3 {
            print("사용자 승리!")
            break
        } else if remainingChance > 0 {
            print("남은 기회 : \(remainingChance)")
        } else {
            print("컴퓨터 승리...!")
        }
    }
}

func selectMenu() {
    while true {
        print("1. 게임 시작")
        print("2. 게임 종료")
        print("원하는 기능을 선택해주세요 : ", terminator: "")
        
        let input = readLine() ?? ""
        
        switch input {
        case "1":
            playNumberBaseballGame()
        case "2":
            return
        default:
            print("입력이 잘못되었습니다.")
        }
    }
}

selectMenu()
