//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var challenge: Int = 9
var isEnd: Bool = false
var userInput: [Int] = []
var randomNumberAnswer: [Int] = []

func checkStrikeCount() -> Int {
    var strikeCount = 0
    for index in 0...2 where userInput[index] == randomNumberAnswer[index] {
        strikeCount += 1
        userInput[index] = 0
    }
    return strikeCount
}

func checkBallCount() -> Int {
    var ballCount = 0
    for index in 0...2 where randomNumberAnswer.contains(userInput[index]) {
        ballCount += 1
    }
    return ballCount
}

func createRandomNumbers() -> [Int] {
    var result = Set<Int>()
    while result.count < 3 {
        result.insert(Int.random(in: 1...9))
    }
    return Array(result)
}

func checkUserInput() -> Bool {
    guard let userInputNumber = readLine()?.components(separatedBy: " ") else {
        print("입력이 잘못되었습니다\n숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.")
        return true
    }
    if !(validateUserInput(userInput: userInputNumber).isEmpty) {
        userInput = validateUserInput(userInput: userInputNumber)
        return false
    } else {
        return true
    }
}

func getUserInput() {
    var isUserInputValid = true
    while isUserInputValid {
        print("입력 :", terminator: " ")
        isUserInputValid = checkUserInput()
    }
}

func validateUserInput(userInput Input: [String]) -> [Int] {
    var checkOverlapSet = Set<String>()
    var stringCount: Int = 0
    for Input in Input {
        checkOverlapSet.insert(Input)
    }
    let intTypeInput: [Int] = Input.map({
        Int($0) ?? -1
    })
    for intTypeInput in intTypeInput where intTypeInput >= 1 && intTypeInput <= 9 {
        stringCount += 1
    }
    guard checkOverlapSet.count == 3, Input.count == 3, stringCount == 3 else {
        print("입력이 잘못되었습니다\n숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.")
        return []
    }
    return intTypeInput
}

func printWinner(_ winner: String) {
    isEnd = true
    print("\(winner) 승리...!")
}

func checkWinner(strikeCount: Int) {
    if strikeCount == 3 {
        printWinner("유저")
        return
    }
    if challenge == 0 {
        printWinner("컴퓨터")
    }
}

func playGame() {
    randomNumberAnswer = createRandomNumbers()
    while !isEnd {
        getUserInput()
        let strikeCount: Int = checkStrikeCount()
        let ballCount: Int = checkBallCount()
        challenge -= 1
        print("\(strikeCount) 스트라이크, \(ballCount) 볼 \n남은 기회 : \(challenge)")
        checkWinner(strikeCount: strikeCount)
    }
}

func getMenuInput() -> Bool {
    let menuInput = readLine()
    if menuInput == "1" {
        playGame()
        return true
    } else if menuInput == "2" {
        return false
    } else {
        print("입력이 잘못되었습니다.")
        return true
    }
}

func startGame() {
    var canPlay = true
    while canPlay {
        print("1. 게임시작 \n2. 게임 종료 \n원하는 기능을 선택해주세요 : ", terminator: "")
        canPlay = getMenuInput()
    }
}

startGame()
