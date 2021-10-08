//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum GamePlayer {
    case user
    case computer
}
enum GameMessage: String {
    case userWin = "사용자 승리!"
    case computerWin = "컴퓨터 승리...!"
    case generatedUserNumber = "임의의 수 : "
    case leftTrial = "남은 기회 : "
    case strikeCount = " 스트라이크, "
    case ballCount = " 볼"
}
enum NumberBaseballError: Error {
    case invalidInput
}

var computerNumbers: [Int] = []
var tryCount = 9

func generateRandomNumbers() -> [Int] {
    var randomNumbers: Set<Int> = []
    let numberLength = 3
    let randomNumberRange = 1...9
    
    while randomNumbers.count < numberLength {
        let number = Int.random(in: randomNumberRange)
        randomNumbers.insert(number)
    }
    
    return Array(randomNumbers)
}

func judgeStrikeAndBall(with userNumbers: [Int]) -> (strike: Int, ball: Int) {
    var ballCount = 0
    var strikeCount = 0
    
    for index in 0..<userNumbers.count {
        ballCount += computerNumbers.contains(userNumbers[index]) ? 1 : 0
    }
    for index in 0..<userNumbers.count {
        strikeCount += computerNumbers[index] == userNumbers[index] ? 1 : 0
    }
    
    ballCount -= strikeCount
    
    return (strikeCount, ballCount)
}

func runGame() {
    computerNumbers = generateRandomNumbers()
    var judgeResult: (strike: Int, ball: Int) = (0, 0)
    let strikesForUserWin = 3

    while tryCount != 0 && judgeResult.strike != strikesForUserWin {
        guard let userNumbers = try? recieveUserNumber() else {
            print("입력이 잘못되었습니다.")
            continue
        }
        judgeResult = compareStrikeAndBall(userNumbers: userNumbers)
        showTryCount()
    }
    
    if judgeResult.strike == strikesForUserWin {
        showGameResult(winner: GamePlayer.user)
    } else {
        showGameResult(winner: GamePlayer.computer)
    }
}

func compareStrikeAndBall(userNumbers: [Int]) -> (Int, Int){
    var strikeCount = 0
    var ballCount = 0
    
    (strikeCount, ballCount) = judgeStrikeAndBall(with: userNumbers)
    print(strikeCount, GameMessage.strikeCount.rawValue, ballCount, GameMessage.ballCount.rawValue)
    
    return (strikeCount, ballCount)
}

func showTryCount() {
    tryCount -= 1
    print(GameMessage.leftTrial.rawValue, tryCount)
}

func showGameResult(winner: GamePlayer) {
    if winner == GamePlayer.user {
        print(GameMessage.userWin.rawValue)
    } else {
        print(GameMessage.computerWin.rawValue)
    }
}

func showUserMenu() {
    print("1. 게임 시작 \n2. 게임 종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
}

while true {
    showUserMenu()

    guard let inputMenu = readLine() else {
        print("입력이 잘못되었습니다")
        continue
    }
    if inputMenu == "1" {
        runGame()
    } else if inputMenu == "2" {
        break
    } else {
        print("입력이 잘못되었습니다")
    }
}

func recieveUserNumber() throws -> [Int] {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")

    let userNumbers = try validateUserNumbers(inputNumbers: readLine())

    return try userNumbers.split(separator: " ").compactMap({ (userNumber: String.SubSequence) -> Int in
        if let number = Int(userNumber) {
            return number
        }
        throw NumberBaseballError.invalidInput
    })
}

func validateUserNumbers(inputNumbers: String?) throws -> String {
    guard let userNumbers = inputNumbers else {
        throw NumberBaseballError.invalidInput
    }
    let numbers: [String] = userNumbers.components(separatedBy: " ")
    guard numbers.count == 3 else {
        
        throw NumberBaseballError.invalidInput
    }
    guard numbers.filter({$0 == "0"}).count == 0 else {
        throw NumberBaseballError.invalidInput
    }
    for number in numbers {
        try validateEachNumber(number: number)
    }
    
    return userNumbers
}

func validateEachNumber(number: String) throws {
    guard number.count == 1 else {
        throw NumberBaseballError.invalidInput
    }
    guard let _ = Int(number) else {
        throw NumberBaseballError.invalidInput
    }
}
