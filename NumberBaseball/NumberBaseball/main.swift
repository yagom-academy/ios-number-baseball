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
let lengthOfNumbers: Int = 3
let numberPool: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9]

func generateRandomNumbers() -> [Int] {
    var randomNumbers: [Int] = []
    var randomNumberPool: [Int] = numberPool.shuffled()
    
    for _ in 1...lengthOfNumbers {
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
    
    while numberOfChance > 0 {
        numbersByUser = getUserNumbers()
        updateStrikeAndBallCount()
        numberOfChance -= 1
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        if strikeCount == lengthOfNumbers {
            print("사용자 승리!")
            break
        }
        print("남은 기회 : \(numberOfChance)")
        if numberOfChance == 0 {
            print("컴퓨터 승리...!")
        }
    }
}

func printMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요", terminator: " : ")
}

func printInputGuideline() {
    print("숫자 \(lengthOfNumbers)개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력", terminator: " : ")
}

func showNumberBaseballMenu(numberOfChance: Int) {
    printMenu()
    guard let userInput: String = readLine() else {
        print("nil을 입력 하지마세요! 😡")
        return
    }
    switch userInput {
    case "1":
        startGame(numberOfChance: numberOfChance)
        showNumberBaseballMenu(numberOfChance: numberOfChance)
    case "2":
        return
    default:
        print("입력이 잘못되었습니다")
        showNumberBaseballMenu(numberOfChance: numberOfChance)
    }
}

func getUserNumbers() -> [Int] {
    var userNumbers: [Int] = []
    
    while userNumbers.isEmpty {
        printInputGuideline()
        guard let userInput = readLine() else {
            print("nil을 입력 하지마세요! 😡")
            exit(.zero)
        }
        if let validatedUserInput = validate(userInput) {
            userNumbers = validatedUserInput
        } else {
            print("입력이 잘못되었습니다")
        }
    }
    return userNumbers
}

func validate(_ userInput: String) -> [Int]? {
    let separatedUserInput = userInput.components(separatedBy: " ")
    let numberOnlyUserInput = separatedUserInput.compactMap({ Int($0) })
    
    guard numberOnlyUserInput.count == separatedUserInput.count else {
        return nil
    }
    
    guard Set(numberOnlyUserInput).count == lengthOfNumbers else {
        return nil
    }
    
    guard numberOnlyUserInput.filter({ numberPool.contains($0) }).count == lengthOfNumbers else {
        return nil
    }
    return numberOnlyUserInput
}

showNumberBaseballMenu(numberOfChance: 9)
