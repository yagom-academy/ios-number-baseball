//
//  NumberBaseball - main.swift
//  Created by Kiseok, Hisop.
//  Copyright © yagom academy. All rights reserved.
//

func printMenu() {
    print("""
        1. 게임 시작
        2. 게임 종료
        원하는 기능을 선택해주세요 :
        """, terminator: " ")
}

func printGameMenu() {
    print("""
        숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
        중복 숫자는 허용하지 않습니다.
        입력 :
        """, terminator: " ")
}

func runProgram() {
    while true {
        printMenu()
        switch readLine() {
        case "1":
            playNumberBaseBallGame()
        case "2":
            return
        default:
            print("입력이 잘못되었습니다")
        }
    }
}

func inputValidate(userInput: String?) -> [Int]? {
    guard let userInput else {
        return nil
    }
    let userNumbers = userInput.split(separator: " ").compactMap { Int($0) }
    
    guard Set(userNumbers).count == 3 && userNumbers.filter({ 1...9 ~= $0 }).count == 3 else {
        return nil
    }
    
    return userNumbers
}

func gameResult(userNumbers: [Int], computerRandomNumbers: [Int]) -> Bool {
    let (strike, ball) = checkStrikeAndBall(userNumbers: userNumbers, randomNumbers: computerRandomNumbers)

    print("\(strike) 스트라이크, \(ball) 볼")
    guard strike != 3 else {
        return false
    }
    
    return true
}

func playNumberBaseBallGame() {
    let computerRandomNumbers: [Int] = generateRandomNumber()
    var chance: Int = 9
    
    while chance != 0 {
        printGameMenu()
        guard let userNumbers = inputValidate(userInput: readLine()) else {
            print("입력이 잘못되었습니다")
            continue
        }
        guard gameResult(userNumbers: userNumbers, computerRandomNumbers: computerRandomNumbers) else {
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

