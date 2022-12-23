//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let inputGuideLine = """
                   숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
                   중복 숫자는 허용하지 않습니다.
                   입력 :
                   """
let menuMessage = """
                  1. 게임시작
                  2. 게임종료
                  원하는 기능을 선택해주세요 :
                  """
let menu = ["게임시작": "1", "게임종료": "2"]
let wrongInputMessage = "입력이 잘못되었습니다"

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
    
    print(inputGuideLine, terminator: " ")
    
    if let userInputs = readLine() {
        let inputForm = "^[1-9]{1}\\s[1-9]{1}\\s[1-9]{1}$"
        let isCorrectInput: Bool = userInputs.range(of: inputForm, options: .regularExpression) != nil
        
        if isCorrectInput == true {
            inputComponents = userInputs.components(separatedBy: " ")
        }
        
        if isCorrectInput == false || Set(inputComponents).count != 3 {
            print(wrongInputMessage)
            return inputUserNumbers()
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

    for index in 0...2 {
        if computerRandomNumbers[index] == userNumbers[index] {
            result["strike"]? += 1
        } else if userNumbers.contains(computerRandomNumbers[index]) {
            result["ball"]? += 1
        }
    }

    return result
}

func startGame() {
    var remainingCount = 9
    let computerRandomNumbers = createRandomNumbers()
    
    while remainingCount > 0 {
        let userNumbers = inputUserNumbers()
        remainingCount -= 1
                
        let currentScore = countBallAndStrike(from: computerRandomNumbers, comparing: userNumbers)
        if let strikes = currentScore["strike"], let balls = currentScore["ball"] {
            print("\(strikes) 스트라이크, \(balls) 볼")
        }
        
        if currentScore["strike"] == 3 {
            print("사용자 승리...!")
            selectMenu()
            break
        } else if remainingCount == 0 {
            print("컴퓨터 승리...!")
            selectMenu()
        } else {
            print("남은 기회 : \(remainingCount)")
        }
    }
}

func selectMenu() {
    print(menuMessage, terminator: " ")
    
    let selectedMenu = readLine()
    
    if selectedMenu == menu["게임시작"] {
        startGame()
    } else if selectedMenu == menu["게임종료"] {
        
    } else {
        print(wrongInputMessage)
        selectMenu()
    }
}

selectMenu()
