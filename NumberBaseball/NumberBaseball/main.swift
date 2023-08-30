//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum UserInputError: LocalizedError {
    case userInputError
    
    var errorDescription: String? {
        switch self {
        case.userInputError:
            return "입력이 잘못되었습니다"
        }
    }
}

func runProgram() throws {
    var run: Bool = true
    while run == true {
        do {
            try printMenu(statement: &run)
        } catch {
            print(error.localizedDescription)
        }
    }
}

func printMenu(statement: inout Bool) throws {
    print("1. 게임 시작")
    print("2. 게임 종료")
    print("원하는 기능을 선택해주세요", terminator: " : ")
    
    guard let userInput = readLine() else {
        throw UserInputError.userInputError
    }
    
    switch userInput {
    case "1":
        playNumberBaseBallGame()
    case "2":
        statement = false
    default:
        throw UserInputError.userInputError
    }
}

func playNumberBaseBallGame() {
    let computerRandomNumbers: [Int] = generateRandomNumber()
    var userRandomNumbers: [Int] = []
    var chance: Int = 9

    while chance != 0 {
        userRandomNumbers = generateRandomNumber()
        print("임의의 수 : \(userRandomNumbers.map { String($0) }.joined(separator: " "))")
        let (strike, ball) = checkStrikeAndBall(userNumbers: userRandomNumbers, randomNumbers: computerRandomNumbers)

        print("\(strike) 스트라이크, \(ball) 볼")
        if strike == 3 {
            print("사용자 승리!")

            return
        }
        chance -= 1
        if chance > 0 {
            print("남은 기회 : \(chance)")
        }
    }
    print("컴퓨터 승리...!")
}

func generateRandomNumber() -> [Int] {
    var numbers: Set<Int> = []

    while numbers.count < 3 {
        numbers.insert(Int.random(in: 1...9))
    }

    return numbers.map { Int($0) }
}

func checkStrikeAndBall(userNumbers: [Int], randomNumbers: [Int]) -> (Int, Int) {
    var strike: Int = 0
    var ball: Int = 0

    for (index, number) in userNumbers.enumerated() {
        if number == randomNumbers[index] {
            strike += 1
        } else if randomNumbers.contains(number) {
            ball += 1
        }
    }

    return (strike, ball)
}

try runProgram()
//playNumberBaseBallGame()
