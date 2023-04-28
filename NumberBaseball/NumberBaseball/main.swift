//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

func selectBaseballGameMenu() {
    var hasGameStarted = true
    
    while hasGameStarted {
        print("""
        1. 게임시작
        2. 게임종료
        원하는 기능을 선택해주세요 :
        """, terminator: " ")
        
        guard let userOrder = readLine() else { return }
        
        switch userOrder {
        case "1":
            startBaseballGame()
        case "2":
            hasGameStarted = false
        default:
            print("입력이 잘못되었습니다")
            continue
        }
    }
}

func startBaseballGame() {
    let answerNumbers = generateRandomNumber()
    var chance = 9

    while chance > 0 {
        chance -= 1

        let userNumbers = inputUserNumbers()
        let matchCount = checkBallStrikeCount(from: answerNumbers, with: userNumbers)

        print("\(matchCount.strike) 스트라이크, \(matchCount.ball) 볼")

        if matchCount.strike == 3 {
            print("사용자 승리!")
            break
        } else if chance == 0 {
            print("컴퓨터 승리...!")
            break
        } else {
            print("남은 기회 : \(chance)")
        }
    }
}

func generateRandomNumber() -> [Int] {
    var randomNumbers = Set<Int>()

    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomNumbers)
}

func inputUserNumbers() -> [Int] {
    var userNumbers = [Int]()
    
    while userNumbers.count != 3 {
        print("""
        숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
        중복 숫자는 허용하지 않습니다.
        입력 :
        """, terminator: " ")
        
        guard let inputNumbers = readLine()?.split(separator: " ").compactMap({ Int($0) }), Set(inputNumbers).count == 3 else {
            print("입력이 잘못되었습니다")
            continue
        }
        userNumbers = inputNumbers
    }
    return userNumbers
}

func checkBallStrikeCount(from answerNumbers: [Int], with matchNumbersOfUser: [Int]) -> (strike: Int, ball: Int) {
    var ballCount = 0
    var strikeCount = 0

    for index in 0...2 {
        if answerNumbers[index] == matchNumbersOfUser[index] {
            strikeCount += 1
        } else if answerNumbers.contains(matchNumbersOfUser[index]) {
            ballCount += 1
        }
    }
    return (strikeCount, ballCount)
}

selectBaseballGameMenu()
