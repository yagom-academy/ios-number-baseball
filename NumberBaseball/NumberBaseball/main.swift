//
//  NumberBaseball - main.swift
//  Created by Chuuny & Doogie.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func makeRandomNumber() -> [String] {
    var randomNumber: [String] = []
    var numberList = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    numberList.shuffle()
    for i in 1...3 {
        randomNumber.append(String(numberList[i - 1]))
    }
    
    return randomNumber
}

func checkNumber(_ userNumbers: [String]) -> (Int, Int) {
    var strike = 0
    var ball = 0
    
    for i in 0..<userNumbers.count {
        if randomNumbers.contains(userNumbers[i]) {
            ball += 1
        }
    }
    
    for i in 0..<userNumbers.count {
        if userNumbers[i] == randomNumbers[i] {
            strike += 1
            ball -= 1
        }
    }
    
    return (strike, ball)
}

let randomNumbers = makeRandomNumber()
var chance = 9

func playGame() {
    while chance > 0 {
        let userNumber = makeRandomNumber()
        print("임의의 수 : \(userNumber[0]) \(userNumber[1]) \(userNumber[2])")
        print("\(checkNumber(userNumber).0) 스트라이크, \(checkNumber(userNumber).1) 볼")
        chance -= 1
        print("남은 기회 \(chance)")
        
        if userNumber == randomNumbers {
            print("사용자 승리...!")
            return
        }
    }
    
    print("컴퓨터 승리...!")
}

playGame()
