//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum BaseBallGameError : Error {
    case invalidFunction
    case invalidInput
}

var computerNumbers: [Int] = makeThreeNumbers()
var userNumbers: [Int] = []
var leftCount: Int = 9
var isUserWin: Bool = false
var isGameEnd: Bool = false

func makeThreeNumbers() -> [Int] {
    var numbers: Set<Int> = []
    while numbers.count < 3 {
        numbers.insert(Int.random(in: 1...9))
    }
    return Array(numbers)
}

func initializeGame() {
    leftCount = 9
    isUserWin = false
    computerNumbers = makeThreeNumbers()
}

func playBaseBallGame() {
    while !isGameEnd {
        initializeGame()
        printMenu()
        let gameMenuResult = choiceGameMenu()
        switch gameMenuResult {
        case .success(let menu):
            menu == 1 ? arrangeGame() : pressNumberTwo()
        case .failure(_):
            print("입력이 잘못되었습니다")
        }
    }
}

playBaseBallGame()


