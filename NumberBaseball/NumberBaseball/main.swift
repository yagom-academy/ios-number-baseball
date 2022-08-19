//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var chance = 9
let computerNumbers = generateNumber()

func showInterface() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해 주세요 : ", terminator: "")
    guard let input = readLine() else { return }
    if input.count == 1 && input == "1" {
        print("선택 : \(input)")
        startGame()
    } else if input.count == 1 && input == "2" {
        return
    } else {
        print("입력이 잘못되었습니다.")
        showInterface()
    }
}

func startGame() {
    var run = true
    while run {
        chance -= 1
        let userNumbers = getUserNumbers()
        let (strike, ball) = compareWithComputerNumbers(from: userNumbers)
        print("\(strike) 스트라이크, \(ball) 볼")
        print("남은 기회 : \(chance)")
        if strike == 3 {
            print("사용자 승리...!")
            run = false
        } else if chance == 0 {
            print("컴퓨터 승리...!")
            run = false
        }
    }
}


showInterface()
