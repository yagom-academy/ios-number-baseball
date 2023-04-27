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

func start() {
    
    while true {
        let selectMenu = selectMenu()
        
        if selectMenu == "2" {
            break
        }
        
        tryCount = 9
        resultCheck = true
    }
}

func inputData() -> String {
    guard let inputData = readLine() else { return ""}
    
    return inputData
}

func selectMenu() -> String {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    let input: String = inputData()
    
    switch input {
    case "1":
        randomNumbers = getRandomNumbers()
        
        while true {
            if tryCount == 0 {
                print("컴퓨터의 승리...!")
                break
            } else if !resultCheck {
                break
            }
            
            let inputNumbers = checkInputData()
            
            if inputNumbers != [] {
                compareToRandomNumbers(randomNumbers, inputNumbers)
            }
        }
        break
    case "2":
        break
    default:
        print("입력이 잘못되었습니다")
        break
    }
    return input
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

func compareToRandomNumbers(_ randomNumbers: [Int], _ myBaseballNumbers: [Int]) {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    if myBaseballNumbers == randomNumbers {
        print("사용자의 승리...!")
        resultCheck = false
        return
    }
        
    for ( index, number ) in myBaseballNumbers.enumerated() {
        if randomNumbers[index] == number {
            strikeCount += 1
        } else if randomNumbers.contains(number) {
            ballCount += 1
        }
    }
    
    tryCount -= 1

    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    print("남은 기회 : \(tryCount)")
}

func checkInputData() -> [Int] {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요")
    print("중복숫자는 허용하지 않습니다")
    print("입력 : ", terminator: "")
    
    let inputData = inputData()
    let splitInputData = inputData.components(separatedBy: " ")
    var inputNumbers: [Int] = []
    
    for index in 0...splitInputData.count - 1 {
        guard let number = Int(splitInputData[index]) else {
            print("입력이 잘못되었습니다")
            return []
        }
        
        if (1...9).contains(number) {
            inputNumbers.append(number)
        }
    }
    
    let setInputNumbers = Set(inputNumbers)
    
    if setInputNumbers.count != 3 {
        print("입력이 잘못되었습니다")
        return []
    }
    
    return inputNumbers
}
