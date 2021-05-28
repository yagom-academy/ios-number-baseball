//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Edited by Soll & Seunggi
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

var remainCount: Int = 3
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

func judgeStrikeBall(com: [String], user: [String]) {
    var strike = 0, ball = 0

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
    print("남은 기회: \(remainCount)")
    print("\(strike) 스트라이크, \(ball) 볼")
    
    if com == user {
        remainCount = 0
        print("사용자 승리!")
        startMenu()
    }
    
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
            return false
        }
    }
    
    for i in userNumbers {
        if !(i >= "1" && i <= "9" && i.count < 2 && i.count != 0) {
            return false
        }
    }

    switch userNumbers {
    case userNumbers where userNumbers.count == 3:
        return true
    default:
        return false
    }
}

func startGame() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.")
//    let comArray: [String] = makeThreeRandomNumber()
    let comArray: [String] = ["1", "2", "3"]
    
    while remainCount >= 0 {
        let userArray = inputUserArray()
        if isUserNumberTrueFalse(userArray) {
            judgeStrikeBall(com: comArray, user: userArray)
        } else {
            print("입력이 잘못되었습니다")
            print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.")
        }
        if remainCount == 0 {
            print("컴퓨터 승리...!")
            startMenu()
        }
    }
}

startMenu()
