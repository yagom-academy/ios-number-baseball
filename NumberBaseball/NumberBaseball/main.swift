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

func printInputMessage() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
}

func makeUserRandomNumbers() -> Array<Int> {
    printInputMessage()
    var postUserInput : Array<String> = []
    
    if let userInput = readLine()?.components(separatedBy: " ") {
        postUserInput = userInput
    }
    if checkUserInput(userInputNumbers: postUserInput) == false {
        print("입력이 잘못되었습니다")
        return makeUserRandomNumbers()
    }
    return postUserInput.compactMap{ Int($0) }
}

func isStrikeBall(extractedUserNumbers: Array<Int>) -> Bool {
    var isThreeStrike = false
    var strikeCount = 0
    var ballCount = 0
    for number in 0...2 {
        addStrikeBallCount(extractedUserNumbers: extractedUserNumbers, strikeCount: &strikeCount, ballCount: &ballCount, counter: number)
    }
    isThreeStrike = checkThreeStrikes(strikeCount: strikeCount, ballCount: ballCount)
    return isThreeStrike
}

func addStrikeBallCount(extractedUserNumbers: Array<Int>, strikeCount: inout Int, ballCount: inout Int, counter: Int) {
    if extractedComputerNumbers[counter] == extractedUserNumbers[counter] {
        strikeCount += 1
    } else if extractedUserNumbers.contains(extractedComputerNumbers[counter]) {
        ballCount += 1
    }
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

func printUserNumbers(selectedNumbers: Array<Int>) {
    print("임의의 수 : \(selectedNumbers[0]) \(selectedNumbers[1]) \(selectedNumbers[2])")
}

func subtractRemaining(chance: inout Int){
    chance -= 1
}

func countRemainingChance(chance: inout Int){
    print("남은 기회 : \(chance)")
    if chance == 0 {
        print("컴퓨터 승리...!")
    }
}

func startGame() {
    makeComputerRandomNumbers()
    while remainingChance != 0 {
        let extractedUserNumbers = makeUserRandomNumbers()
        printUserNumbers(selectedNumbers: extractedUserNumbers)
        
        if isStrikeBall(extractedUserNumbers: extractedUserNumbers) {
            break
        }

        subtractRemaining(chance: &remainingChance)
        countRemainingChance(chance: &remainingChance)
    }
}

func checkRange(range: Bool) -> Bool {
    var isVerifiedRange: Bool = true
    if range == false {
        isVerifiedRange = false
    }
    return isVerifiedRange
}

func checkUserInput (userInputNumbers: [String]) -> Bool {
    var userInput: Set<String> = Set<String>()
    userInput = Set(userInputNumbers)
    var isQualifiedPass: Bool = true
    var isRange: Bool = true
    var isNil: Bool = true
    var hasEnoughCount: Bool = true
    var isAllInRange: Bool = true
    
    for letter in userInputNumbers {
        isRange = checkUserInputRange(letterToBeChecked: letter)
        if isRange == false {
            isAllInRange = false
        }
        
        if Int(letter) == nil {
            isNil = false
        }
    }
    hasEnoughCount = checkEnoughCount(userCount: userInput.count)
    isQualifiedPass = checkFourConditions(isRange: isRange, isNil: isNil, hasEnoughCount: hasEnoughCount, isAllInRange: isAllInRange)
    return isQualifiedPass
}

func checkEnoughCount(userCount: Int) -> Bool {
    var isEnoughCount = true
    if userCount != 3 {
        isEnoughCount = false
    }
    return isEnoughCount
}

func checkFourConditions(isRange: Bool, isNil: Bool, hasEnoughCount: Bool, isAllInRange: Bool) -> Bool {
    var isQualifiedCondition = false
    if isRange && isNil && hasEnoughCount && isAllInRange {
        isQualifiedCondition = true
    }
    return isQualifiedCondition
}

func checkUserInputRange(letterToBeChecked: String) -> Bool {
    var isInRange: Bool = true
    if let inputNumber = Int(letterToBeChecked) {
        isInRange = checkInputNumber(inputNumber: inputNumber)
    }
    return isInRange
}

func checkInputNumber(inputNumber: Int) -> Bool {
    var isInRange: Bool = true
    if inputNumber < 1 || inputNumber > 9 {
        isInRange = false
    }
    return isInRange
}

func printMenuMessage() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
}

func menu() -> Int {
    printMenuMessage()
    var selectNumber: Int = 0
    if let choiceMenu = readLine() {
        selectNumber = retrieveSelectNumber(choiceMenu: choiceMenu)
    }
    return selectNumber
}

func retrieveSelectNumber(choiceMenu: String) -> Int {
    var userChoice: Int
    if choiceMenu == "1" {
        userChoice = 1
    } else if choiceMenu == "2" {
        userChoice = 2
    } else {
        userChoice = 3
    }
    return userChoice
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
