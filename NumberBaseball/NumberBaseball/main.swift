//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

typealias score = (strike: Int, ball: Int)

enum Menu: String {
    case gameStart = "1", gameEnd = "2"
}

func createThreeRandomNumbers() -> [Int] {
    var returnNumbers: [Int] = []
    
    while returnNumbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if isDuplicated(compareNumbers: returnNumbers, newNumber: randomNumber) == false {
            returnNumbers.append(randomNumber)
        }
    }
    return returnNumbers
}

func isDuplicated(compareNumbers: Array<Int>, newNumber: Int) -> Bool {
    if compareNumbers.contains(newNumber) {
        return true
    }
    return false
}

func getScore(answerNumbers: Array<Int>, guessNumbers: Array<Int>) -> score {
    var strike = 0
    var ball = 0
    var gameScore: score
    
    for guessIndex in 0..<guessNumbers.count {
        if answerNumbers[guessIndex] == guessNumbers[guessIndex] {
            strike += 1
        } else if isDuplicated(compareNumbers: answerNumbers, newNumber: guessNumbers[guessIndex]) {
            ball += 1
        }
    }
    gameScore = (strike, ball)
    return gameScore
}

func playGame() {
    let answerNumbers = createThreeRandomNumbers()
    var trialCount = 9
    
    while trialCount != 0 {
        let guessNumbers = createThreeRandomNumbers()
        let score = getScore(answerNumbers: answerNumbers, guessNumbers: guessNumbers)
        
        print("""
         \(score.strike) 스트라이크, \(score.ball) 볼
         임의의 수 : \(guessNumbers[0]) \(guessNumbers[1]) \(guessNumbers[2])
         """)
        trialCount -= 1
        if score.strike == 3 {
            print("사용자의 승리...!")
            break
        } else if trialCount == 0 {
            print("컴퓨터의 승리...!")
        }
        print("남은 기회 : \(trialCount)")
    }
}

func chooseMenu() -> String {
    print("1. 게임시작 \n2. 게임종료 \n원하는 기능을 선택해주세요.")
    let enteredNumber = readLine()
    if let userMenu = enteredNumber {
        if userMenu == Menu.gameStart.rawValue || userMenu == Menu.gameEnd.rawValue {
            return userMenu
        }
    }
    print("입력이 잘못되었습니다.")
    return chooseMenu()
}

playGame()









