//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// MARK: --- Step 1
func makeRandomNumbers() -> Array<Int> {
    var numbers = Array<Int>()

    while numbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
    
        if !numbers.contains(randomNumber) {
            numbers.append(randomNumber)
        }
    }

    return numbers
}

func compareArrays( _ computerNumbers: Array<Int>, _ userNumbers: Array<Int>) -> (Int, Int) {
    var strike: Int = 0
    var ball: Int = 0

    for index in 0..<computerNumbers.count {
        if computerNumbers[index] == userNumbers[index] {
            strike += 1
        } else if computerNumbers.contains(userNumbers[index]) {
            ball += 1
        }
    }
    
    return (strike, ball)
}

func startGame() {
    let computerNumbers = makeRandomNumbers()
    var tryCount: Int = 9

    while tryCount > 0 {
        let userNumbers = userInputNumbers()
        let (strike, ball) = compareArrays(computerNumbers, userNumbers)
        print("\(strike) 스트라이크, \(ball) 볼")

        tryCount -= 1
        print("남은 기회 : \(tryCount)")

        if strike > 2 {
            print("사용자 승리!")
            break
        } else if tryCount == 0 {
           print("컴퓨터 승리...!")
        }
    }
}

// MARK: --- Step 2
func selectMenu() {
    while true {
        print("1. 게임시작")
        print("2. 게임종료")
        print("원하는 기능을 선택해주세요", terminator: " : ")
        guard let inputString = readLine() else {
            print("입력이 잘못되었습니다")
            continue
        }
        if let convertNumber = Int(inputString), convertNumber == 1 || convertNumber == 2 {
            if convertNumber == 1 {
                startGame()
            } else {
                break
            }
        } else {
            print("입력이 잘못되었습니다")
            continue
        }
    }
}

func userInputNumbers() -> Array<Int> {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력", terminator: " : ")

    guard let inputString = readLine() else {
            print("입력이 잘못되었습니다")
            return userInputNumbers()
    }
    let separate = inputString.components(separatedBy: " ").filter({ $0 != "" })
    var checkArray = Array<Int>()

    if separate.count != 3 {
        print("입력이 잘못되었습니다")
        return userInputNumbers()
    }
    for stringNumber in separate {
        if let convertNumber = Int(stringNumber), stringNumber.count < 2 {
            if !checkArray.contains(convertNumber) {
                checkArray.append(convertNumber)
            }
        } else {
            print("입력이 잘못되었습니다")
            return userInputNumbers()
        }
    }
    if checkArray.count == 3 {
        return checkArray
    } else {
        print("입력이 잘못되었습니다")
        return userInputNumbers()
    }
}

// MARK: --- Main
selectMenu()
