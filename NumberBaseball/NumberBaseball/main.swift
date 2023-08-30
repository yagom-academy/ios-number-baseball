//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let randomComputerNumbers = generateRandomNumbers()
var remainsChance = 9
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
    
    while remainsChance > 0 {
        userNumbers = generateRandomNumbers()
        print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
        print("\(calculateStrikeCount(userNumbers: userNumbers)) 스트라이크, \(calculateBallCount(userNumbers: userNumbers)) 볼")
        
        if calculateStrikeCount(userNumbers: userNumbers) == 3 {
            print("사용자 승리!")
            break
        } else {
            remainsChance -= 1
        }
        
        if remainsChance == 0 {
            print("컴퓨터 승리...!")
            break
        }

        print("남은 기회 : \(remainsChance) ")
    }
}

func conductMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    
    if let userInputMenu = readLine(){
        switch userInputMenu{
        case "1":
            inputGameNumbers()
        case "2":
            return
        default:
            print("입력이 잘못되었습니다")
            conductMenu()
        }
    }
}

func inputGameNumbers() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    
    if let userInputNumbers = readLine(){
        userNumbers = userInputNumbers.split(separator:" ").compactMap { Int($0) }
        }
    }


conductMenu()




