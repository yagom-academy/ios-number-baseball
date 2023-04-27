//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func selectMenu() -> String {
    let menu: [String] = ["1", "2"]
    print("""
        1. 게임 시작
        2. 게임 종료
        원하는 기능을 선택해주세요 :
        """, terminator: " ")
    
    guard let selectedMenu = readLine(), menu.contains(selectedMenu) else {
        print("입력이 잘못 되었습니다.")
        return selectMenu()
    }
    return selectedMenu
}

func createRandomNumbers() -> [Int] {
    var randomNumbers: [Int] = []
    
    while randomNumbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !randomNumbers.contains(randomNumber) {
            randomNumbers.append(randomNumber)
        }
    }
    return randomNumbers
}

func checkBallCount(to randomNumbers: [Int], from userNumbers: [Int]) -> Int {
    var ballCount = 0
    
    for index in 0...2 {
        if randomNumbers.contains(userNumbers[index]) {
            ballCount += 1
        }
    }
    return ballCount
}

func checkStrikeCount(to randomNumbers: [Int], from userNumbers: [Int]) -> Int {
    var strikeCount = 0
    
    for (a, b) in zip(randomNumbers, userNumbers) {
        if a == b {
            strikeCount += 1
        }
    }
    return strikeCount
}

func getNumbers() -> [Int] {
    var inputNumbers: [Int] = []
    
    print("숫자 세개를 띄어쓰기를 구분하여 입력하세요.")
    print("중복숫자는 허용하지 않습니다.")
    print("입력 :", terminator: " ")
    
    while true {
        if let input = readLine()?.split(separator: " "),
           input.count == 3,
           input.allSatisfy({str in str.count == 1 && str >= "1" && str <= "9"})
        {
            inputNumbers = input.map({Int($0)!})
           // playBall(of: inputNumbers)
        } else {
            print("입력이 잘못되었습니다.")
        }
    }
    return inputNumbers
}

func playBall(of userNumbers: [Int]) {
    strikeCount = checkStrikeCount(to: randomNumbers, from: userNumbers)
    ballCount = checkBallCount(to: randomNumbers, from: userNumbers)
    attemptCount -= 1

    print("""
        \(strikeCount) 스트라이크, \(ballCount) 볼
        남은 기회 : \(attemptCount)
        """)

    if strikeCount == 3 {
        print("사용자 승리!")
    } else {
        print("컴퓨터 승리...!")
    }
}

let randomNumbers = createRandomNumbers()
var attemptCount = 9
var ballCount = 0
var strikeCount = 0

func executeGame(of selectedMenu: String) {
    if selectedMenu == "1" {
        while attemptCount > 0 && strikeCount < 3 {
            playBall(of: getNumbers())
        }
    } else if selectedMenu == "2" {
        return
    }
}

executeGame(of: selectMenu())
