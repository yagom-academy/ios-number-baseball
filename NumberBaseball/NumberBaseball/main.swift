//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

let answer = fetchRandomNumbers()
var remainCount = 9

func fetchRandomNumbers() -> [Int] {
    var numberSet = Set<Int>()
    while numberSet.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        numberSet.insert(randomNumber)
    }
    
    let randomNumbers = Array(numberSet)
    return randomNumbers
}

func startNumberBaseball() {
    var menu = ""
    while menu != "2" {
        menu = inputMenu()
        
        switch menu {
        case "1":
            startGame()
        case "2":
            print("\n프로그램 종료")
        default:
            print("입력이 잘못되었습니다.")
        }
    }
}

startNumberBaseball()
