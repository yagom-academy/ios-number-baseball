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

func getUserInput(){
    while true{
        guard let userInputNumber = readLine()?.components(separatedBy: " ") else{
            print("입력이 잘못되었습니다\n숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.")
        }
        
        if !(validateUserInput(userInput: userInputNumber).isEmpty){
            userInput = validateUserInput(userInput: userInputNumber)
            break
        }
    }
}

func validateUserInput(userInput Input: [String]) -> [Int]{
    var validInput: [Int] = []
    
    /*
     숫자를 잘못 입력하거나 범위를 벗어난 경우,
     숫자가 중복된 경우 -> set에 넣고 count == 3
     갯수가 잘못된 경우, 띄어쓰기 안했을 때도 -> count == 3
     숫자가 아닌 값 -> Int 변환이 안되면
     이 경우 게임을 진행할 수 있는 횟수를 차감하지 않습니다.
     */
    //validation Code
    return validInput
}

func printRandomNumber(_ numbers: [Int]){
    for number in numbers {
        print(number, terminator: " ")
    }
}

func printWinner(_ winner: String) {
    isEnd = true
    print("\n\(winner) 승리...!", terminator: " ")
}



func playGame(){
    randomNumberAnswer = createRandomNumbers()
    while !isEnd {
        print("임의의 수 :", terminator: " ")
        
        userInput = getUserInput()
        
        printRandomNumber(userInput)
        
        let strikeCount: Int = checkStrikeCount()
        let ballCount: Int = checkBallCount()
        
        if strikeCount == 3 {
            printWinner("유저")
        }
        
        challenge -= 1
        if challenge == 0 {
            printWinner("컴퓨터")
        }
        
        print("\n\(strikeCount) 스트라이크, \(ballCount) 볼 \n남은 기회 : \(challenge)")
    }
}

func startGame() {
    while true {
        print("1. 게임시작 \n2. 게임 종료 \n원하는 기능을 선택해주세요 : ",terminator: "")
        
        let menuInput = readLine()
        if menuInput == "1" {
            playGame()
        } else if menuInput == "2" {
            break
        } else {
            print("입력이 잘못되었습니다.")
        }
    }
}

startGame()
