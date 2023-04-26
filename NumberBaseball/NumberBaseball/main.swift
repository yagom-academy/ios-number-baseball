//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomNumbers: [Int] = []
var tryCount: Int = 9
var resultCheck: Bool = true

start()



func inputData() -> String {
    guard let inputData = readLine() else { return ""}
    
    return inputData
}

func selectMenu(input: String) {
    print("1. 게임시작")
    print("2. 게임종료")
    switch input {
    case "1":
        print("게임시작 선택")
    case "2":
        print("게임종료 선택")
    default:
        print("입력이 잘못되었습니다")
    }
}

func start() {
    randomNumbers = getRandomNumbers()
    
    while resultCheck {
        
        if tryCount == 0 {
            print("컴퓨터의 승리...!")
            break
        }
        
        compareToRandomNumbers(randomNumbers)
    }
}

func getRandomNumbers() -> [Int] {
    var randomNumbers: [Int] = []
    
    while randomNumbers.count != 3 {
        
        let randomNumber = Int.random(in: 1...9)
        
        if !randomNumbers.contains(randomNumber) {
            randomNumbers.append(randomNumber)
        }
    }
    
    return randomNumbers
}

func compareToRandomNumbers(_ randomNumbers: [Int]) {
    let myBaseballNumbers: [Int] = getRandomNumbers()
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    if myBaseballNumbers == randomNumbers {
        print("사용자의 승리...!")
        resultCheck = false
        return
    }
    
    var randomNumber: String = ""

    for ( index, number ) in myBaseballNumbers.enumerated() {
        randomNumber.append("\(number)")
        if randomNumbers[index] == number {
            strikeCount += 1
        } else if randomNumbers.contains(number) {
            ballCount += 1
        }
    }
    
    print("임의의 수: \(randomNumber)")
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    
    tryCount -= 1
    print("남은 기회 : \(tryCount)")
}
