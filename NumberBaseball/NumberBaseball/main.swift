//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var numbersByComputer: [Int] = []
var numbersByUser: [Int] = []
var strikeCount: Int = 0
var ballCount: Int = 0
var lengthOfNumbers: Int = 3
let numberPool: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9]


func generateRandomNumbers() -> [Int] {
    var randomNumbers: [Int] = []
    var randomNumberPool: [Int] = numberPool.shuffled()
    
    for _ in 0..<lengthOfNumbers {
        randomNumbers.append(randomNumberPool.removeFirst())
    }

    return randomNumbers
}

func updateStrikeAndBallCount() {
    strikeCount = 0
    ballCount = 0
    
    for index in 0...2 {
        if numbersByUser[index] == numbersByComputer[index] {
            strikeCount += 1
        } else if numbersByComputer.contains(numbersByUser[index]) {
            ballCount += 1
        }
    }
}

func startGame(numberOfChance: Int) {
    numbersByComputer = generateRandomNumbers()
    var numberOfChance = numberOfChance
    
    while(numberOfChance > 0) {
        numbersByUser = getUserNumbers()
        
        updateStrikeAndBallCount()
        numberOfChance -= 1
        
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        
        if strikeCount == 3 {
            print("사용자 승리!")
            break
        }
        print("남은 기회 : \(numberOfChance)")
        
        if numberOfChance == 0 {
            print("컴퓨터 승리...!")
        }
    }
}

func printMenus() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요", terminator: " : ")
}

func printInputGuideline() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.")
    print("입력", terminator: " : ")
}

func playNumberBaseball(numberOfChance: Int) {
    printMenus()
    guard let userInput: String = readLine() else {
        print("nil을 입력 하지마세요! 😡")
        return }
    switch userInput {
    case "1":
        startGame(numberOfChance: numberOfChance)
        playNumberBaseball(numberOfChance: numberOfChance)
    case "2":
        return
    default:
        print("입력이 잘못되었습니다")
        playNumberBaseball(numberOfChance: numberOfChance)
    }
}

func getUserNumbers() -> [Int] {
    var userNumbers: [Int] = []
    
    while userNumbers == [] {
        printInputGuideline()
        guard let userInput = readLine() else {
            print("nil을 입력 하지마세요! 😡")
            exit(0)
        }
        if isValid(userInput: userInput) {
            userNumbers = generateValidNumbers(userInput: userInput)
        } else {
            print("입력이 잘못되었습니다")
        }
    }
    
    return userNumbers
}

func isValid(userInput: String) -> Bool {
    let strNumberPool: [String] = numberPool.map({ String($0) })
    let userInputToArray = userInput.components(separatedBy: " ")
    
    if userInputToArray.filter({ strNumberPool.contains($0) }).count != userInputToArray.count {
        return false
    }
    
    if Set(userInputToArray).count != lengthOfNumbers {
        return false
    }
    return true
}

func generateValidNumbers(userInput: String) -> [Int] {
    return userInput.components(separatedBy: " ").compactMap({ Int($0) })
}

playNumberBaseball(numberOfChance: 9)

