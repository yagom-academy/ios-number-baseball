//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var remainChance = 9
var computerChoice = makeRandomNumber()

func makeRandomNumber() -> [Int] {
    var randomNum: Set<Int> = []
    
    while randomNum.count < 3 {
        randomNum.insert(Int.random(in: 1...9))
    }
    return Array(randomNum)
}

func compareRandomNumber(randomNumber: [Int]) -> [Int] {
    var strike = 0
    var ball = 0
    
    for (index, number) in randomNumber.enumerated() {
        if index == computerChoice.firstIndex(of: number) {
            strike += 1
        } else if computerChoice.contains(number) {
            ball += 1
        }
    }
    return [ball, strike]
}

func verifyingUserNumber(number: String?) -> [Int]? {
    var stringArray: [String] = []
    var intArray: [Int] = []
    
    guard let number else { return nil }
    let result = number.components(separatedBy: " ")
    
    if result.count == 3 {
        for num in result {
            stringArray.append(num)
        }
    } else {
        print("입력이 잘못되었습니다.")
        return nil
    }
    
    for num in stringArray {
        if let changInt = Int(num) {
            intArray.append(changInt)
        } else {
            print("입력이 잘못되었습니다.")
            return nil
        }
    }
    
    let changeSet = Set(intArray)
    
    if intArray.count == changeSet.count {
        return intArray
    } else {
        print("입력이 잘못되었습니다.")
        return nil
    }
}

func printMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
}

func playingGame() {
    while remainChance >= 0 {
        var result: [Int] = []
        remainChance -= 1
        
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
        print("중복 숫자는 혀용하지 않습니다.")
        print("입력 :", terminator: " ")
        
        let userNumber = verifyingUserNumber(number: readLine())
        
        if let userNumber {
            result = compareRandomNumber(randomNumber: userNumber)
            print("\(result[1]) 스트라이크, \(result[0]) 볼")
        } else {
            continue
        }
        
        if remainChance != 0 {
            print("남은 기회 : \(remainChance)")
        } else {
            print("컴퓨터 승리")
            printMenu()
            computerChoice = makeRandomNumber()
            break
        }
        if result[1] == 3 {
            print("사용자 승리")
            printMenu()
            computerChoice = makeRandomNumber()
            break
        }
    }
}

func selectMenu() {
    while true {
        print("원하는 기능을 선택해 주세요 :", terminator: " ")
        let input = readLine()
        
        guard let input else { return }
        if input == "1" {
            playingGame()
        } else if input == "2" {
            break
        } else {
            print("입력이 잘못되었습니다")
            printMenu()
            continue
        }
    }
}

func startGame() {
    printMenu()
    selectMenu()
}

startGame()
