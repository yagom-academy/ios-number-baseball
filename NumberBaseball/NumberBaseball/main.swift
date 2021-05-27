//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Edited by Soll & Seunggi
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

var count: Int = 9

func makeThreeRandomNo() -> [Int] {
    var tempArray = [Int]()
    
    while tempArray.count < 3 {
        let tempNo: Int = Int.random(in: 1...9)
        if !tempArray.contains(tempNo){
            tempArray.append(tempNo)
        }
    }
    return tempArray
}



func compareComUser(_ com: [Int], _ user: [Int]) -> String {
    var strike = 0, ball = 0
    
    if com == user {
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
    let comArray = makeThreeRandomNo()
    let userArray = makeThreeRandomNo()
    
    print("임의의 수: ", terminator: "")
    for num in userArray {
        print(num, terminator: " ")
    }
    print("")
    print(compareComUser(comArray, userArray))
    print("남은 기회: \(count)")
}

startGame()

