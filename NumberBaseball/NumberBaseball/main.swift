//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerRandomNumbers:[Int] = [0, 0, 0]
var tryCount: Int = 9

func menuChoice() {
    var userNum: String?
    while userNum != "2" {
        print("1. 게임시작")
        print("2. 게임종료")
        print("원하는 기능을 선택해주세요 :", terminator: " ")
        userNum = readLine()
        if let userNum2 = userNum {
            checkUserChoice(userNum: userNum2)
        }
    }
}

func checkUserChoice(userNum: String) {
    if userNum == "1" {
        startGame()
    } else if userNum == "2" {
        return
    } else {
        print("입력이 잘못 되었습니다.")
    }
}

func startGame() {
    var userStrikeCount: Int = 0
    var userBallCount: Int = 0
    computerRandomNumbers = makeThreeRandomNumbers()
    tryCount = 9
    while tryCount > 0 && userStrikeCount < 3 {
        let userFinalNumber = secondMenuChoice()
        userStrikeCount = 0
        userBallCount = 0
        (userStrikeCount, userBallCount) = checkBall(notStrikeNumbers: checkStrike(userStrikeCount: userStrikeCount, userNumbers: userFinalNumber), userBallCount: userBallCount)
        tryCount -= 1
        printResult(userStrikeCount: userStrikeCount, userBallCount: userBallCount)
    }
}

func secondMenuChoice() -> [Int] {
    var flag:Bool = true
    var returnNumber: [Int] = []
    while flag == true {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
        print("중복 숫자는 허용하지 않습니다.")
        print("입력 ", terminator: "")
        let input1 = checkUserInput()
        if checkUserNumberFormat(userInput: input1).isEmpty {
        } else {
            returnNumber = checkUserNumberFormat(userInput: input1)
            flag = false
        }
    }
    return returnNumber
}

func printResult(userStrikeCount: Int, userBallCount: Int) {
    print("\(userStrikeCount) 스트라이크, \(userBallCount) 볼")
    print("남은 기회 : \(tryCount)")
    if userStrikeCount == 3 {
        print("사용자 승리...!")
    }
    if tryCount == 0 {
        print("컴퓨터 승리...!")
    }
}

func makeThreeRandomNumbers() -> [Int] {
    var randomNumbers: Set<Int> = []
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomNumbers)
}

func checkStrike(userStrikeCount: Int, userNumbers: [Int]) -> ([Int], Int) {
    var notStrikeNumbers: [Int] = []
    var strikeCount = userStrikeCount
    for (userIndex, userNumber) in userNumbers.enumerated() {
        if let (notStrikeNumber, strikeCount2) = countStrike(userNumber: userNumber, userIndex: userIndex, userStrikeCount: strikeCount) {
            strikeCount = strikeCount2
            notStrikeNumbers = makeNotStrikeNumbers(notStrikeNumber: notStrikeNumber)
        }
    }
    return (notStrikeNumbers, strikeCount)
}

func countStrike(userNumber: Int, userIndex: Int, userStrikeCount: Int) -> (Int?, Int)? {
    var strikeCount = userStrikeCount
    for (computerIndex, computerNumber) in computerRandomNumbers.enumerated() {
        if computerNumber == userNumber && computerIndex == userIndex {
            strikeCount += 1
            return (nil, strikeCount)
        }
    }
    return (userNumber, strikeCount)
}

func makeNotStrikeNumbers(notStrikeNumber: Int?) -> [Int] {
    var notStrikeNumbers: [Int] = []
    if let notStrikeNum = notStrikeNumber {
        notStrikeNumbers.append(notStrikeNum)
    }
    return notStrikeNumbers
}

func checkBall(notStrikeNumbers: ([Int], Int), userBallCount: Int) -> (Int, Int) {
    var ballCount = userBallCount
    let strikeCount = notStrikeNumbers.1
    for checkingNumber in notStrikeNumbers.0 {
        ballCount = countBall(userNumber: checkingNumber, userBallCount: ballCount)
    }
    return (strikeCount, ballCount)
}

func countBall(userNumber: Int, userBallCount: Int) -> Int {
    var ballCount = userBallCount
    for computerNumber in computerRandomNumbers {
        if userNumber == computerNumber {
            ballCount += 1
        }
    }
    return ballCount
}

func checkUserInput() -> [String] {
    var userThreeNumbers: [String] = []
    guard let userNumbers = readLine() else {
        return []
    }
    for number in userNumbers {
        userThreeNumbers.append(String(number))
    }
    
    return userThreeNumbers
}

func checkUserNumberFormat(userInput: [String]) -> [Int] {
    if !isStringFormat(userInput: userInput),
       !isThreeDigits(userInput: userInput) {
        return []
    }
    if Set(userInput).count != 4 {
        return []
    }
    return makeIntArry(userInput: userInput)
}

func isStringFormat(userInput: [String]) -> Bool {
    if userInput.isEmpty {
        return false
    }
    if userInput.count != 5 {
        return false
    }
    if userInput[1] != " " || userInput[3] != " " {
        return false
    }
    return true
}

func isThreeDigits(userInput: [String]) -> Bool {
    let S: String = userInput.filter{ $0 != " " }.reduce("") { $0 + String($1) }
    if S.count != 3 , S.contains("0") {
        return false
    }
    guard let _ = Int(S) else {
        return false
    }
    return true
}

func makeIntArry(userInput: [String]) -> [Int] {
    var result2: [Int] = []
    for n in userInput {
        if n == " " {
            return []
        }
        if let num = Int(String(n)) {
            result2.append(num)
        } else {
            return []
        }
    }
    return result2
}

menuChoice()
