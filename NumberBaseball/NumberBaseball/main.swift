//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

enum UserInputError: Error {
    case duplicateNumberError
    case outOfRangeNumberError
    case notNumberError
    case userInputError
}

func printMenu() {
    print("1. 게임 시작")
    print("2. 게임 종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
}

func printGameMenu() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
}

func runProgram() {
    var isRunning: Bool = true
    
    while isRunning {
        printMenu()
        guard let userInput = readLine() else {
            continue
        }
        switch userInput {
        case "1":
            playNumberBaseBallGame()
        case "2":
            isRunning = false
        default:
            print("입력이 잘못되었습니다")
        }
    }
}

func prepareUserInput(userInput: String) throws -> [Int] {
    let splitUserInput: [Substring] = userInput.split(separator: " ")
    var userNumbers: [Int] = []
    
    for userNumber in splitUserInput {
        guard let number = Int(userNumber) else {
            throw UserInputError.notNumberError
        }
        userNumbers.append(number)
    }
    return userNumbers
}

func inputValidator(userInput: String) throws -> [Int] {
    var preparedInput: [Int] = []
    
    do {
        try preparedInput = prepareUserInput(userInput: userInput)
    } catch {
        throw UserInputError.notNumberError
    }
    guard preparedInput.count == 3 else {
        throw UserInputError.userInputError
    }
    for value in preparedInput {
        guard preparedInput.filter ({ $0 == value }).count == 1 else {
            throw UserInputError.duplicateNumberError
        }
    }
    guard preparedInput.filter ({ 1 <= $0 && $0 <= 9 }).count == 3 else {
        throw UserInputError.outOfRangeNumberError
    }
    
    return preparedInput
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
        do {
            try userNumbers = inputValidator(userInput: userInput)
        } catch {
            print("입력이 잘못되었습니다")
            continue
        }
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

