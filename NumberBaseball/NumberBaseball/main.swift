//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Edited by Soll & Seunggi
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

var count: Int = 9

func makeThreeRandomNo() -> [String] {
    var tempComNumbers:Set<String> = []
    
    while tempComNumbers.count < 3 {
        tempComNumbers.insert(String(Int.random(in: 1...9)))
    }
    let comNumbers = Array(tempComNumbers)
    return comNumbers
}

func compareComUser(_ com: [String], _ user: [String]) -> String {
    var strike = 0, ball = 0
    
    if com == user {
        count = 0
        return "사용자 승리!"
    }
    
    for (indexCom, valueCom) in com.enumerated(){
        for (indexUser, valueUser) in user.enumerated(){
            if indexCom == indexUser && valueCom == valueUser {
                strike += 1
            }else if valueCom == valueUser {
                ball += 1
            }
        }
    }
    
    count -= 1
    return "\(strike) 스트라이크, \(ball) 볼"
}

func userMenu() {
    print("1. 게임시작\n2. 게임종료")
    print("원하는 기능을 선택해주세요 : ",terminator: "")
    
    let input: String? = readLine()
    
    if let input: String = input, input == "1" {
        startGame()
    } else if let input: String = input, input == "2" {
        print("게임 종료")
    } else {
        print("입력이 잘못되었습니다")
        userMenu()
    }
    
}

func inputThreeRandomNo() {
    print("입력 : ",terminator: "")
    
    let input: String? = readLine()
    var userNumbers = [String]()
    
    if let input: String = input {
        userNumbers = input.components(separatedBy: " ")
    }
    
    // 중복값을 걸러내는 기능
    for i in 0..<userNumbers.count-1 {
        if userNumbers[i] == userNumbers[i+1] {
            print("입력이 잘못되었습니다")
            inputThreeRandomNo()
        }
    }
    
    // 숫자의 범위(1...9)를 걸러내는 기능
    
    
    
    // 숫자가 아닌 값을 입력한 경우

    
    
    // 문자의 유효성을 검증하는 기능
    switch userNumbers {
    case userNumbers where userNumbers.count == 3:
        startGame()
    default:
        print("입력이 잘못되었습니다")
        inputThreeRandomNo()
    }
}

inputThreeRandomNo()


func startGame() {
    let comArray: [String] = makeThreeRandomNo()
    while count != 0 {
        let userArray: [String] = makeThreeRandomNo()
        
        print("임의의 수: \(userArray.joined(separator: " "))")
        if count == 1 {
            print("컴퓨터 승리...!")
        }
        print(compareComUser(comArray, userArray))
        print("남은 기회: \(count)")
    }
}


//startGame()

