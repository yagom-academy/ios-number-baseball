//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var extractedComputerNumbers: Array<Int> = Array<Int>()
var remainingChance = 9

func makeComputerRandomNumbers() {
    var initialComputerInput: Set<Int> = Set<Int>()
    while initialComputerInput.count < 3 {
        let randomNumber: Int = Int.random(in: 1...9)
        initialComputerInput.insert(randomNumber)
    }
    extractedComputerNumbers = Array(initialComputerInput)
}

func getRandomNumbersForUser() -> Array<Int> {
    var initialUserInput: Set<Int> = Set<Int>()
    while initialUserInput.count < 3 {
        let number: Int = Int.random(in: 1...9)
        initialUserInput.insert(number)
    }
    return Array(initialUserInput)
}

func isStrikeBall(extractedForUser: Array<Int>) -> Bool {
    var isThreeStrike = false
    var strikeCount = 0
    var ballCount = 0
    for index in 0...2 {
        if extractedComputerNumbers[index] == extractedForUser[index] {
            strikeCount += 1
        } else if extractedForUser.contains(extractedComputerNumbers[index]) {
            ballCount += 1
        }
    }
    isThreeStrike = checkThreeStrikes(strikeCount: strikeCount, ballCount: ballCount)
    return isThreeStrike
    
}

func checkThreeStrikes(strikeCount: Int, ballCount: Int) -> Bool {
    var checkThreeStrike = false
    if strikeCount == 3 {
        print("\(strikeCount) 스트라이크, \(ballCount) 볼 - 사용자 승리!")
        checkThreeStrike = true
    } else {
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    }
    return checkThreeStrike
}

func printingRandomNumbers(myArray: Array<Int>) {
    print("임의의 수 : \(myArray[0]) \(myArray[1]) \(myArray[2])")
}

func subtractingRemainingChance(remaining: inout Int){
    remaining -= 1
}

func countingRemainingChance(remaining: inout Int){
    print("남은 기회 : \(remaining)")
    if remaining == 0 {
        print("컴퓨터 승리...!")
    }
}

func startGame() {
    makeComputerRandomNumbers()
    while remainingChance != 0 {
        let extractedForUser = getRandomNumbersForUser()
        printingRandomNumbers(myArray: extractedForUser)
        
        if isStrikeBall(extractedForUser: extractedForUser) {
            break
        }

        subtractingRemainingChance(remaining: &remainingChance)
        countingRemainingChance(remaining: &remainingChance)
    }
}


func checkUserInput (number: [String]) -> Bool {
    var isAllPass: Bool = true
    var isRange: Bool = true
    var isNil: Bool = true
    var hasEnoughCount: Bool = true
    var isAllInRange: Bool = true
    for letter in number {
        isRange = checkUserInputRange(letter: letter)
        if isRange == false {
            isAllInRange = false
        }
        
        if Int(letter) == nil {
            isNil = false
        }
    }
    var userInput: Set<String> = Set<String>()
    userInput = Set(number)
    
    if userInput.count != 3 {
        hasEnoughCount = false
    }
    
    if isRange && isNil && hasEnoughCount && isAllInRange {
        isAllPass = true
    } else {
        isAllPass = false
    }
    return isAllPass
}

func checkUserInputRange(letter: String) -> Bool {
    var isInRange: Bool = true
    if let inputNumber = Int(letter) {
       
        if inputNumber < 1 || inputNumber > 9 {
            isInRange = false
        }
    }
    return isInRange
}

func menu() -> Int {
    print("1. 게임시작")
    print("2. 게임종료")
    var selectNumber: Int = 0
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    if let choiceMenu = readLine() {
        if choiceMenu == "1" {
            selectNumber = 1
        } else if choiceMenu == "2" {
            selectNumber = 2
        } else {
            selectNumber = 3
        }
    }
    return selectNumber
}

func startMenu() {
    var selectNumber: Int
    repeat {
        selectNumber = menu()
        if selectNumber == 1 {
            startGame()
            remainingChance = 9
        } else if selectNumber == 3 {
            print("입력이 잘못되었습니다")
        }
    } while selectNumber != 2
}

startMenu()
