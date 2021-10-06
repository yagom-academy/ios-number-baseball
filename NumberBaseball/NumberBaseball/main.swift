//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

//MARK: - Step 1
/// 1. 변수 설정
/// 2. 난수 3개 생성하는 함수 구현
///   - 중복된 숫자가 없어야한다
///   - 1~9 사이의 숫자여야 한다

func generateRandomNumbers() -> Set<Int> {
    var randomNumbers: Set<Int> = []
    
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1..<10))
    }
    
    return randomNumbers
}


func calculateStrikeBall(computer: Set<Int>, player: Set<Int>) -> Bool {
    var ballCount = computer.intersection(player).count
    var strikeCount = 0
    let computer = Array(computer)
    let player = Array(player)
    
    for i in 0..<3 {
        if computer[i] == player[i] {
            strikeCount += 1
            ballCount -= 1
        }
    }
    
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    if strikeCount == 3 {
        return true
    }
    return false
}

func _print(numbers: Set<Int>) -> String {
    let numbers = Array(numbers)
    
    return "임의의 수 : \(numbers[0]) \(numbers[1]) \(numbers[2])"
}

func startGame() {
    var chance = 9
    let computerNumbers = generateRandomNumbers()
//    let computerWins = "컴퓨터 승리...!"
    var playerWins = false
    
    print("컴퓨터의 수:",_print(numbers: computerNumbers))
    while chance > 0 {
        let playerNumbers = generateRandomNumbers()
        
        print(_print(numbers: playerNumbers))
        if calculateStrikeBall(computer: computerNumbers, player: playerNumbers){
            playerWins = true
            break
        } else {
            chance -= 1
            print("남은 기회: \(chance)")
        }
    }
    
    if playerWins {
        print("사용자 승리...!")
    } else {
      print("컴퓨터 승리...!")
    }
}
startGame()
