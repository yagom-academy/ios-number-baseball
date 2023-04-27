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
    var input: String = inputData()
    
    switch input {
    case "1":
        while true {
            checkInputData()

            if tryCount == 0 {
                break
            }
            break
        }
        
    case "2":
        print("게임종료 선택")
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

func checkInputData() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요")
    print("중복숫자는 허용하지 않습니다")
    print("입력 : ", terminator: "")
    let inputData = inputData()
    let splitInputData = inputData.split(separator: " ")
    if splitInputData.count != 3 {
        print("입력이 잘못되었습니다")
    }
}
