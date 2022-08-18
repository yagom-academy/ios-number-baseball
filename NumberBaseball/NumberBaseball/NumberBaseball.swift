//
//  NumberBaseball.swift
//  NumberBaseball
//
//  Created by Gundy, mene on 2022/08/16.
//

import Foundation

var baseballRandomNumbers: [Int] = makeThreeRandomNumbers()
var remainCount: Int = 9

func makeThreeRandomNumbers() -> [Int] {
    let randomNumbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffled()
    var baseballGameNumbers: [Int] = []
    for index in 1...3 {
        baseballGameNumbers.append(randomNumbers[index])
    }
    return baseballGameNumbers
}

func compare(with numbers: [Int]) -> (Int, Int) {
    var strike: Int = 0
    var ball: Int = 0
    for index in 0...2 {
        if baseballRandomNumbers[index] == numbers[index] {
            strike += 1
        } else if baseballRandomNumbers.contains(numbers[index]) {
            ball += 1
        }
    }
    remainCount -= 1
    return (strike, ball)
}

func checkResult(strike: Int, ball: Int) {
    print("\(strike) 스트라이크, \(ball) 볼")
    if strike == 3 {
        print("사용자 승리!")
    } else if remainCount == 0 {
        print("남은 기회: \(remainCount)")
        print("컴퓨터 승리...!")
    } else {
        print("남은 기회: \(remainCount)")
    }
}

func startGame() {
    remainCount = 9
    while true {
        let myNumbers: [Int] = inputNumbers()
        let gameScore: (strike: Int, ball: Int) = compare(with: myNumbers)
        checkResult(strike: gameScore.strike, ball: gameScore.ball)
        if gameScore.strike == 3 || remainCount == 0 {
            break
        }
    }
    selectMenu()
}

func selectMenu() {
    print("""
          1. 게임시작
          2. 게임종료
          원하는 기능을 선택해주세요 :
          """, terminator: " ")
    guard let selectedMenu = readLine() else {
        print("입력이 잘못되었습니다")
        selectMenu()
        return
    }
    switch selectedMenu {
    case "1":
        startGame()
    case "2":
        return
    default:
        print("입력이 잘못되었습니다")
        selectMenu()
        return
    }
}

func inputNumbers() -> [Int] {
    var myNumbers: [Int] = []
    print("""
          숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
          중복 숫자는 허용하지 않습니다.
          입력 :
          """, terminator: " ")
    if let userInputNumbers = readLine()?.components(separatedBy: " ") {
        guard userInputNumbers.count == 3 else {
            print("입력이 잘못되었습니다")
            return inputNumbers()
        }
        guard let firstNumber = Int(userInputNumbers[0]), let secondNumber = Int(userInputNumbers[1]), let thirdNumber = Int(userInputNumbers[2]) else {
            print("입력이 잘못되었습니다")
            return inputNumbers()
        }
        if checkDuplication(firstNumber, secondNumber, thirdNumber) == false || checkNumberRange(firstNumber, secondNumber, thirdNumber) == false {
            return inputNumbers()
        }
        myNumbers += [firstNumber, secondNumber, thirdNumber]
    }
    return myNumbers
}

func checkDuplication(_ firstNumber: Int, _ secondNumber: Int, _ thirdNumber: Int) -> Bool {
    if firstNumber == secondNumber || firstNumber == thirdNumber || secondNumber == thirdNumber {
        print("중복된 숫자를 입력하였습니다")
        return false
    }
    return true
}

func checkNumberRange(_ firstNumber: Int, _ secondNumber: Int, _ thirdNumber: Int) -> Bool {
    if firstNumber < 1 || secondNumber < 1 || thirdNumber < 1 {
        print("입력이 잘못되었습니다")
        return false
    } else if firstNumber > 9 || secondNumber > 9 || thirdNumber > 9 {
        print("입력이 잘못되었습니다")
        return false
    }
    return true
}

