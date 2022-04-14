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

func getUserInput() -> [Int] {
    return [1,2,3]
}

func validateUserInput(userInput Input: [Int]) -> Bool{
    /*
     숫자를 잘못 입력하거나 범위를 벗어난 경우,
     갯수가 잘못된 경우,
     숫자가 아닌 값을 입력한 경우 등 잘못 입력에 대해 알려줍니다.
     이 경우 게임을 진행할 수 있는 횟수를 차감하지 않습니다.
     */
    //validation Code
    return true
}

func validateMenuInput(selectedMenuNumber menu: Int) -> Bool{
    var tmpResult:[Int] = []
    return true
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
        if validateUserInput(userInput: userInput){
            
        }
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
