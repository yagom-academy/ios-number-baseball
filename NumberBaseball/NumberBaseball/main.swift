//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func makeRandomNumbers() -> [Int] {
    var randomNumbers: Set<Int> = []
    while randomNumbers.count < 3 {
        let randomNumber: Int = Int.random(in: 1...9)
        randomNumbers.insert(randomNumber)
    }
    return Array(randomNumbers)
}

var computerNumbers: [Int] = makeRandomNumbers()

func compareComputerNumbers(with userNumbers: [Int]) -> (strikeCount: Int, ballCount: Int) {
    var ballCount: Int = .zero
    var strikeCount: Int = .zero

    for index in 0...2 where computerNumbers[index] == userNumbers[index] {
        strikeCount += 1
    }

    for userNumber in userNumbers where computerNumbers.contains(userNumber) {
       ballCount += 1
    }

    ballCount -= strikeCount

    return (strikeCount, ballCount)
}

func startGame() {
    var chancesLeft: Int = 9
    var isUserWin: Bool = false
    while chancesLeft > 0, isUserWin == false {
        let userNumbers: [Int] = getInputFromUserAndCheck()
        print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
        let result: (strikeCount: Int, ballCount: Int) = compareComputerNumbers(with: userNumbers)
        print("\(result.strikeCount) 스트라이크, \(result.ballCount) 볼")
        chancesLeft -= 1
        print("남은 기회 : \(chancesLeft)")
        isUserWin = result.strikeCount == 3
    }
    if isUserWin {
        print("사용자 승리!")
    } else {
        print("컴퓨터 승리...!")
    }
}

func getInputFromUserAndCheck() -> [Int] {
    topLoop: while true {
        print("""
        숫자 세개를 띄어쓰기로 구분하여 입력해주세요.
        중복 숫자는 허용하지 않습니다.
        입력 :
        """, terminator: " ")
        guard let input = readLine() else {
            continue
        }
        let inputs = input.split(separator: " ")
        let inputSet = Set(inputs)
        
        guard inputs.count == 3, inputSet.count == 3 else {
            print("입력이 잘못되었습니다")
            continue
        }
        var realNumbers: [Int] = []
        
        for number in inputs {
            guard let realNumber = Int(number) else {
                print("입력이 잘못되었습니다")
                continue topLoop
            }
            realNumbers.append(realNumber)
        }
        
        for realNumber in realNumbers {
            if realNumber < 1 || realNumber > 9 {
                print("입력이 잘못되었습니다")
                continue topLoop
            }
        }
        
        return realNumbers
    }
}

func menuHandler() {
    while true {
        print("""
    1. 게임시작
    2. 게임종료
    원하는 기능을 선택해주세요 :
    """, terminator: " ")
        guard let menuNumber = readLine() else {
            print("입력이 잘못되었습니다")
            return
        }
        switch menuNumber {
        case "1":
            startGame()
        case "2":
            return
        default:
            print("입력이 잘못되었습니다")
            continue
        }
    }
}

menuHandler()
