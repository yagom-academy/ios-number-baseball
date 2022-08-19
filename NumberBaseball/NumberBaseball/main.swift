//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: [Int] = []
var userNumbers: [Int] = []
var tryNumber: Int = 9

func generateThreeRandomNumbers() -> [Int] {
    var numbers: Set<Int> = []
    
    while numbers.count < 3 {
        let num = Int.random(in: 1...9)
        numbers.update(with: num)
    }
    return Array(numbers)
}

func foundBall() -> Int {
    var ballCount: Int = 0
    let pairNumbers = zip(userNumbers, computerNumbers)
    
    for (userNumber, computerNumber) in pairNumbers {
        if computerNumbers.contains(userNumber) && userNumber != computerNumber {
            ballCount += 1
        }
    }
    return ballCount
}

func foundStrike() -> Int {
    var strikeCount : Int = 0
    let pairNumbers = zip(userNumbers, computerNumbers)

    for (userNumber, computerNumber) in pairNumbers {
        if userNumber == computerNumber {
            strikeCount += 1
        }
    }
    return strikeCount
}

func decideUserVictory() {
    if foundStrike() == 3 {
        print("사용자 승리!")
        return
    }
}

func startBaseBallGame() {
    while(tryNumber > 0) {
        tryNumber -= 1
        userNumbers = generateThreeRandomNumbers()
        
        if tryNumber == 8 {
            computerNumbers = generateThreeRandomNumbers()
        }
        
        print(computerNumbers)
        print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
        print(foundStrike() ," 스트라이크,", foundBall(), " 볼")
        
        if tryNumber == 0 {
            decideUserVictory()
            print("컴퓨터 승리...!")
            return
        } else {
            decideUserVictory()
            print("남은 기회 : \(tryNumber)")
            print("\n")
        }
    }
}

//func getUserInput() -> [Int] {
//    var a: [Int] = []
//    var userInput = readLine()?.split(separator: " ")
//    if userInput?.count != 3 {
//        print("숫자 3개를 띄어쓰기로 구분하여 주세요")
//        print("중복 숫자는 허용하지 않습니다.")
//    } else {
//        a = userInput.map{$0}
//    }
//    return a
//}

//startBaseBallGame()

while true {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해 주세요",terminator: "")
    let menuInput = readLine()!
    let menu = menuInput.map{ String($0) }.filter{$0 != " "}.joined()
    if menu == "1" {
        startBaseBallGame()
    } else if menu == "2" {
        break
    } else {
        print("입력이 잘못되었습니다.")
        continue
    }
}


