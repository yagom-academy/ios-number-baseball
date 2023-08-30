//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


func printMenu() {
    print("1. 게임 시작")
    print("2. 게임 종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
}

func runProgram() {
    while true {
        printMenu()
        guard let userInput = readLine() else {
            continue
        }
        switch userInput {
        case "1":
            playNumberBaseBallGame()
        case "2":
            break
        default:
            print("입력이 잘못되었습니다.")
        }
    }
}

func printGameMenu() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
}

func prepareInput(userInput: String) -> [Int] {
    return userInput.split(separator: " ").map { Int($0)! }
}

func inputValidator(userInput: String) -> [Int] {
    print(prepareInput(userInput: userInput))
    return []
}

func playNumberBaseBallGame() {
    let computerRandomNumbers: [Int] = generateRandomNumber()
    var userNumbers: [Int] = []
    var chance: Int = 9

    while chance != 0 {
        printGameMenu()
        guard let userInput = readLine() else {
            continue
        }
        userNumbers = inputValidator(userInput: userInput)
        print("임의의 수 : \(userNumbers.map { String($0) }.joined(separator: " "))")
        let (strike, ball) = checkStrikeAndBall(userNumbers: userNumbers, randomNumbers: computerRandomNumbers)

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

runProgram()

