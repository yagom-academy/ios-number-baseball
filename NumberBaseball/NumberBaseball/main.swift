//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Edited by Soll & Seunggi
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

var remainCount: Int = 9
let inputNumbersCount: Int = 3

func makeThreeRandomNumber() -> [String] {
    var tempRandomNumbers = [String]()
    
    while tempRandomNumbers.count < inputNumbersCount {
        let tempNumber: String = String(Int.random(in: 1...9))
        if !tempRandomNumbers.contains(tempNumber) {
            tempRandomNumbers.append(tempNumber)
        }
    }
    return tempRandomNumbers
}

func judgeStrikeBall(com: [String], user: [String]) -> String {
    var strike = 0, ball = 0
    
    if com == user {
        remainCount = 0
        return "사용자 승리!"
    }
    
    for (indexCom, valueCom) in com.enumerated() {
        for (indexUser, valueUser) in user.enumerated() {
            if indexCom == indexUser && valueCom == valueUser {
                strike += 1
            } else if valueCom == valueUser {
                ball += 1
            }
        }
    }
    remainCount -= 1
    return "\(strike) 스트라이크, \(ball) 볼"
}

func startMenu() {
    print("1. 게임시작\n2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    
    let input: String? = readLine()
    
    if let input: String = input, input == "1" {
        startGame()
    } else if let input: String = input, input == "2" {
        print("게임 종료")
    } else {
        print("입력이 잘못되었습니다")
        startMenu()
    }
}

func inputUserArray() -> [String] {
    print("입력 : ", terminator: "")
    
    let input: String? = readLine()
    var userNumbers = [String]()
    
    if let input: String = input {
        userNumbers = input.components(separatedBy: " ")
    }
    return userNumbers
}

func isUserNumberTrueFalse(_ userNumbers: [String]) -> Bool {
    for i in 0..<userNumbers.count-1 {
        if userNumbers[i] == userNumbers[i+1] {
            print("입력이 잘못되었습니다")
            return false
        }
    }
    
    for i in userNumbers {
        if !(i >= "1" && i <= "9" && i.count < 2 && i.count != 0) {
            print("입력이 잘못되었습니다")
            return false
        }
    }

    switch userNumbers {
    case userNumbers where userNumbers.count == 3:
        return true
    default:
        print("입력이 잘못되었습니다")
        return false
    }
}

func startGame() {
    let comArray: [String] = makeThreeRandomNumber()
    
    while remainCount != 0 {
        let userArray = inputUserArray()
        if isUserNumberTrueFalse(userArray) {
            let threeRandomNumbers = userArray.joined(separator: " ")
            print("임의의 수: \(threeRandomNumbers)")
            print(judgeStrikeBall(com: comArray, user: userArray))
        }
        if remainCount == 1 {
            print("컴퓨터 승리...!")
        }
        print("남은 기회: \(remainCount)")
    }
}

startMenu()
