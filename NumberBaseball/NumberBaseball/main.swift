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


startGame()

