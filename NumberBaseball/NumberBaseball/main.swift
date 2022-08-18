//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func createThreeRandomNumbers() -> [Int] {
    var result: Set<Int> = Set<Int>()
    
    while result.count < 3 {
        result.insert(Int.random(in: 1...9))
    }
    
    return Array(result)
}

func determineStrikesBallsInTwoNumbers(_ computerNumbers: [Int], _ userNumbers: [Int]) -> (strike: Int, ball: Int) {
    var ball: Int = 0
    var strike: Int = 0
    
    for userNumber in userNumbers {
        if computerNumbers.contains(userNumber) {
            ball += 1
        }
    }
    
    for index in 0...2 {
        if userNumbers[index] == computerNumbers[index] {
            strike += 1
        }
    }
    
    ball -= strike
    return (strike: strike, ball: ball)
}

func isWin(strike: Int, trialNumber: Int) -> Bool {
    if strike == 3 {
        print("사용자 승리")
        return true
    } else if trialNumber == 0 {
        print("컴퓨터 승리")
        return true
    } else {
        print("남은 기회 : \(trialNumber)")
        return false
    }
}

func readMenuNumber() -> Int {
    print("1. 게임시작\n2. 게임종료\n원하는 기능을 선택해주세요 : ", terminator: "")
    if let selectedMenu = Int(readLine() ?? "") {
        return selectedMenu
    } else {
        return 0
    }
}

func readUserNumber() -> [Int] {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.\n입력 : ", terminator: "")
    if let choicedNumber = readLine() {
        return choicedNumber.components(separatedBy: " ").compactMap { Int($0) }
    } else {
        return [0]
    }
}

func isCorrectMenuNumber(_ menuNumber: Int) -> Bool {
    if menuNumber == 1, menuNumber == 2 {
        return true
    } else {
        print("입력이 잘못되었습니다.")
        return false
    }
}

func isCorrectUserNumber(_ inputedNumber: [Int]) -> Bool {
    if Set(inputedNumber).filter({ $0 >= 1 && $0 <= 9 }).count == 3 {
        return true
    } else {
        print("입력이 잘못되었습니다.")
        return false
    }
}

func playGame() {
    var trialNumber: Int = 9
    let computerNumbers = createThreeRandomNumbers()
    
    while trialNumber > 0 {
        trialNumber -= 1
        let userNumbers: [Int] = createThreeRandomNumbers()
        print("임의의 수 : \(userNumbers.map { String($0) }.joined(separator: " "))")
        let result = determineStrikesBallsInTwoNumbers(computerNumbers, userNumbers)
        print("\(result.strike) 스트라이크, \(result.ball) 볼")
        
        if isWin(strike: result.strike, trialNumber: trialNumber) {
            break
        }
    }
}

func executeBaseballGame() {
    while true {
        let menuNumber: Int = readMenuNumber()
        guard isCorrectMenuNumber(menuNumber) else {
            continue
        }
        
        if menuNumber == 1 {
            playGame()
        } else if menuNumber == 2 {
            break
        }
    }
}
