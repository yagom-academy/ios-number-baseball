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
var numberSize: Int = 3

func generateRandomNumbers() -> [Int] {
    var randomNumbers: [Int] = []
    var numberPool: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffled()
    for _ in 1...3 {
        randomNumbers.append(numberPool.removeFirst())
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

func playNumberBaseball(numberOfChance: Int) {
        print("1. 게임시작")
        print("2. 게임종료")
        print("원하는 기능을 선택해주세요", terminator: " : ")
        let input: String? = readLine()
        if let menu = input {
            switch menu {
            case "1":
                startGame(numberOfChance: numberOfChance)
                playNumberBaseball(numberOfChance: numberOfChance)
            case "2":
                return
            default:
                print("입력이 잘못되었습니다")
                playNumberBaseball(numberOfChance: numberOfChance)
            }
        } else {
            print("nil을 입력 하지마세요! 😡")
        }
}

func getUserNumbers() -> [Int] {
    var userNumbers: [Int] = []
    
    while true {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.")
        print("입력", terminator: " : ")
        let userInput = readLine()
        if let numbers = userInput {
            userNumbers = numbers.split(separator: " ").compactMap({ Int($0) })
        }
        if isValid(userNumbers: userNumbers) == true {
            break
        } else {
            print("입력이 잘못되었습니다")
        }
    }
    
    return userNumbers
}

func isValid(userNumbers: [Int]) -> Bool {
    let numberPool: [Int] = [1,2,3,4,5,6,7,8,9]
    if userNumbers.filter({ numberPool.contains($0) }).count != numberSize {
        return false
    }
    if Set(userNumbers).count != numberSize {
        return false
    }
    return true
}


playNumberBaseball(numberOfChance: 9)
