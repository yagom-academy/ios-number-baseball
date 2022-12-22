//
//  baseballGame.swift
//  NumberBaseball
//
//  Created by 레옹아범 and Rowan.
//

import Foundation

var answerBall: Array<Int> = []

func createRandomNumber() -> Array<Int> {
    var numbers: Array<Int> = []
    
    while numbers.count < 3 {
        let number = Int.random(in: 1...9)
        
        if numbers.contains(number) == false {
            numbers.append(number)
        }
    }
    
    return numbers
}

func compareBall(userBall: Array<Int>, answerBall: Array<Int>) -> (Int, Int) {
    var ball = 0
    var strike = 0
    
    for index in 0..<userBall.count {
        if userBall[index] == answerBall[index] {
            strike += 1
        } else if userBall[index] != answerBall[index], answerBall.contains(userBall[index]) {
            ball += 1
        }
    }
    
    return (ball, strike)
}

func isCorrectMenu(_ inputValue: String?) -> Bool {
    guard let value = inputValue else {
        return true
    }
    
    switch value {
    case "1", "2":
        return false
    default:
        return true
    }
}

func printMenu() {
    print("""
    1. 게임시작
    2. 게임종료
    원하는 기능을 선택해주세요 :
    """, terminator: "")
}

func displayMenu() {
    var isFirst = true
    var inputValue: String?
    var inputState = true
    
    while inputState {
        if isFirst == false {
            print("입력이 잘못되었습니다")
        }
        isFirst = false
        printMenu()
        inputValue = readLine()
        inputState = isCorrectMenu(inputValue)
    }
    
    if inputValue == "1" {
        startGame()
        inputState = true
    }
}

func isCorrectUserInput() -> (Bool, [Int]) {
    guard let value = readLine() else {
        return (true, [])
    }
    let valueList = value.components(separatedBy: " ").map{ String($0) }
    
    if Set(valueList).count != 3 {
        return (true, [])
    }
    
    guard let firstBall = Int(valueList[0]), let secondBall = Int(valueList[1]), let thirdBall = Int(valueList[2]) else {
        return (true, [])
    }
    
    return (false, [firstBall, secondBall, thirdBall])
}

func printInputCondition() {
    print("""
    숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
    중복 숫자는 허용하지 않습니다.
    입력 :
    """, terminator: "")
}

func readInput() -> [Int] {
    printInputCondition()
    
    var (inputState, numberList) = isCorrectUserInput()
    
    while inputState {
        print("입력이 잘못되었습니다")
        printInputCondition()
        
        (inputState, numberList) = isCorrectUserInput()
    }
    
    return numberList
}

func startGame() {
    answerBall = createRandomNumber()
    var chance = 9
    
    while chance > 0 {
        let userBall = readInput()
        let (ball, strike) = compareBall(userBall: userBall, answerBall: answerBall)
        
        chance -= 1
        print("\(strike) 스트라이크, \(ball) 볼")
        
        if let winner = decideWinner(strike: strike, chance: chance) {
            print("\(winner) 승리...!")
            break
        }
        
        print("남은 기회 : \(chance)")
    }
    displayMenu()
}

func decideWinner(strike: Int, chance: Int) -> String? {
        
    if strike == 3 {
        return "사용자"
    } else if chance == 0 {
        return "컴퓨터"
    }
    
    return nil
}

