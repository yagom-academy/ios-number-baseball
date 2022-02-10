//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerRandomNumbers:[Int] = [0, 0, 0]
var tryCount: Int = 9

func startGame() {
    var userStrikeCount: Int = 0
    var userBallCount: Int = 0
    computerRandomNumbers = makeThreeRandomNumbers()
    tryCount = 9
    while tryCount > 0 && userStrikeCount < 3 {
        userStrikeCount = 0
        userBallCount = 0
        let userFinalNumber = secondMenuChoice()
        (userStrikeCount, userBallCount) = checkBall(notStrikeNumbers: findNotStrike(userStrikeCount: userStrikeCount, userNumbers: userFinalNumber), userBallCount: userBallCount)
        tryCount -= 1
        if userStrikeCount == 3 {
            print("사용자 승리...!")
        }
        if tryCount == 0 {
            print("컴퓨터 승리...!")
        }
        print("\(userStrikeCount) 스트라이크, \(userBallCount) 볼")
        print("남은 기회 : \(tryCount)")
    }
}

func makeThreeRandomNumbers() -> [Int] {
    var randomNumbers: Set<Int> = []
    while(randomNumbers.count < 3) {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomNumbers)
}

func findNotStrike(userStrikeCount: Int, userNumbers: [Int]) -> ([Int], Int) {
    var notStrikeNumbers: [Int] = []
    var strikeCount = userStrikeCount
    for (userIndex, userNumber) in userNumbers.enumerated() {
        if let (notStrikeNumber, strikeCount2) = countStrike(userNumber: userNumber, userIndex: userIndex, userStrikeCount: strikeCount) {
            strikeCount = strikeCount2
            if let notStrikeNum = notStrikeNumber {
                notStrikeNumbers.append(notStrikeNum)
            }
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

func menuChoice() {
    var userNum: String?
    while userNum != "2" {
        print("1. 게임시작")
        print("2. 게임종료")
        print("원하는 기능을 선택해주세요 :", terminator: " ")
        userNum = readLine()
        if let userNum2 = userNum {
            if userNum2 == "1" {
                startGame()
            } else if userNum2 == "2" {
                return
            } else {
                print("입력이 잘못 되었습니다.")
            }
        }
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
    if userInput.isEmpty {
        return []
    }
    if userInput.count != 5 {
        return []
    }
    if userInput[1] != " " || userInput[3] != " " {
        return []
    }
    let S: String = userInput.filter{ $0 != " " }.reduce("") { $0 + String($1) }
    if S.count != 3 {
        return []
    }
    guard let _ = Int(S) else {
        return []
    }
    if Set(userInput).count != 4 {
        return []
    }
    var result: [String] = []
    for a in S {
        result.append(String(a))
    }
    var result2: [Int] = []
    for n in result {
        if let num = Int((n)) {
            if num == 0 {
                return []
            }
            result2.append(num)
        }
    }
    return result2
}

menuChoice()
