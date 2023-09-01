//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var randomComputerNumbers = generateRandomNumbers()
var userNumbers = [Int]()

func generateRandomNumbers() -> [Int] {
    var numbers = [Int]()
    
    while numbers.count < 3 {
        let randomNumber = Int.random(in:1...9)
        
        if numbers.contains(randomNumber) == false {
            numbers.append(randomNumber)
        }
    }
    
    return numbers
}

func calculateBallCount(userNumbers: [Int]) -> Int {
    var ballCount = 0
    
    for index in 0...2 {
        if userNumbers.contains(randomComputerNumbers[index]), userNumbers[index] != randomComputerNumbers[index] {
            ballCount += 1
        }
    }
    
    return ballCount
}

func calculateStrikeCount(userNumbers: [Int]) -> Int {
    var strikeCount = 0
    
    for index in 0...2 {
        if userNumbers[index] == randomComputerNumbers[index] {
            strikeCount += 1
        }
    }
    
    return strikeCount
}

func playGame() {
    var remainsChance = 9
    
    while remainsChance > 0 {
        
        print("\(calculateStrikeCount(userNumbers: userNumbers)) 스트라이크, \(calculateBallCount(userNumbers: userNumbers)) 볼")
        
        guard calculateStrikeCount(userNumbers: userNumbers) != 3 else {
            print("사용자 승리!")
            
            randomComputerNumbers = generateRandomNumbers()
            startMenu()
            
            return
        }
        
        remainsChance -= 1
        
        print("남은 기회 : \(remainsChance) ")
        
        guard remainsChance != 0 else {
            print("컴퓨터 승리...!")
            
            randomComputerNumbers = generateRandomNumbers()
            startMenu()
            
            return
        }
        
        inputGameNumbers()
    }
}

func startMenu() {
    print("""
          1. 게임시작
          2. 게임종료
          원하는 기능을 선택해주세요 :
          """, terminator: " ")
    
    guard let userInputMenu = readLine() else { return }
    
    switch userInputMenu {
    case "1":
        inputGameNumbers()
        playGame()
    case "2":
        return
    default:
        print("입력이 잘못되었습니다")
        startMenu()
    }
}

func inputGameNumbers() {
    var isRunning = true
    
    while isRunning {
        print("""
              숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
              중복 숫자는 허용하지 않습니다.
              입력 :
              """, terminator: " ")
        
        guard let userInputNumbers = readLine() else { continue }
        
        validateInput(userInput: userInputNumbers)
        
        guard userNumbers.count != 3 else {
            isRunning = false
            continue
        }
    }
}

func validateInput(userInput: String) {
    userNumbers = userInput.split(separator: " ").compactMap({ Int($0) }).filter {$0 < 10}
    
    guard userInput.isEmpty == false,
          userInput.split(separator: " ").compactMap({ Int($0) }).count == 3,
          Set(userNumbers).count > 2 else {
        userNumbers = []
        print("입력이 잘못되었습니다.")
        return
    }
}

startMenu()
