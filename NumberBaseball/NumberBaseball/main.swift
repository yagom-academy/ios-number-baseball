//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func createRandomNumbers() -> [Int] {
    var createdNumbers = [Int]()
    
    while createdNumbers.count < 3 {
        let createdRandomNumber = Int.random(in: 1...9)
        
        if createdNumbers.contains(createdRandomNumber) {
            continue
        } else {
            createdNumbers.append(createdRandomNumber)
        }
    }
    
    return createdNumbers
}

func inputUserNumbers() -> [Int] {
    var inputComponents = [String]()
    var userNumbers = [Int]()
    
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    
    if let userInputs = readLine() {
        let inputType = "^[1-9]{1}\\s[1-9]{1}\\s[1-9]{1}$"
        
        let isCorrectInput = userInputs.range(of: inputType, options:  .regularExpression) != nil
        
        if isCorrectInput == true {
            inputComponents = userInputs.components(separatedBy: " ")
        }
        
        if isCorrectInput == false || Set(inputComponents).count != 3 {
            print("입력이 잘못되었습니다")
            return userNumbers
        }
    }
    
    for component in inputComponents {
        if let number = Int(component) {
            userNumbers.append(number)
        }
    }
    
    return userNumbers
}

func countBallAndStrike(from computerRandomNumbers: [Int], comparing userNumbers: [Int]) -> [String: Int] {
    var result = [String: Int]()
    result["strike"] = 0
    result["ball"] = 0

    for i in 0...2 {
        if computerRandomNumbers[i] == userNumbers[i] {
            result["strike"]? += 1
        } else if userNumbers.contains(computerRandomNumbers[i]) {
            result["ball"]? += 1
        }
    }

    return result
}

func startGame() {
    var remainingCount = 9
    let computerRandomNumbers = createRandomNumbers()
    
    while remainingCount > 0 {
        var userNumbers = [Int]()
        remainingCount -= 1
        
        repeat {
            userNumbers = inputUserNumbers()
        } while userNumbers.count != 3
        
        let currentScore = countBallAndStrike(from: computerRandomNumbers, comparing: userNumbers)
        if let strikes = currentScore["strike"], let balls = currentScore["ball"] {
            print("\(strikes) 스트라이크, \(balls) 볼")
        }
        
        if currentScore["strike"] == 3 {
            print("사용자 승리...!")
            showMenu()
            break
        }
        
        if remainingCount == 0 {
            print("컴퓨터 승리...!")
            showMenu()
        } else {
            print("남은 기회 : \(remainingCount)")
        }
    }
}

func showMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    
    let menuSelect = readLine()
    
    if menuSelect == String(1) {
        startGame()
    } else if menuSelect == String(2) {
        
    } else {
        print("입력이 잘못되었습니다")
        showMenu()
    }
}

showMenu()
