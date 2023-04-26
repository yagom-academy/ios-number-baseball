//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

func offerBaseballGameMenu() {
    var inMenu = true
    
    while inMenu {
        print("""
        1. 게임시작
        2. 게임종료
        원하는 기능을 선택해주세요 :
        """, terminator: " ")
        
        guard let userOrder = readLine(), (userOrder == "1" || userOrder == "2") else {
            print("입력이 잘못되었습니다")
            continue
        }
        
        if userOrder == "1" {
            startBaseballGame()
        } else {
            inMenu = false
        }
    }
}

func retrieveUserNumbers() -> Array<Int> {
    let isInput = true
    
    while isInput {
        print("""
        숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
        중복 숫자는 허용하지 않습니다.
        입력 :
        """, terminator: " ")
        
        guard let userNumbers = readLine()?.split(separator: " ").compactMap({ Int($0) }), userNumbers.count == 3, Set(userNumbers).count == 3 else {
            print("입력이 잘못되었습니다")
            continue
        }
    
        return userNumbers
    }
}

func checkBallStrikeCount(from answerNumbers: Array<Int>, with matchNumbersOfUser: Array<Int>) -> (strike: Int, ball: Int) {
    var ballCount = 0
    var strikeCount = 0

    for index in 0...2 {
        if answerNumbers.contains(matchNumbersOfUser[index]) {
            ballCount += 1
        }

        if answerNumbers[index] == matchNumbersOfUser[index] {
            ballCount -= 1
            strikeCount += 1
        }
    }

    return (strikeCount, ballCount)
}

func generateRandomNumber() -> Array<Int> {
    var randomNumbers = Set<Int>()

    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }

    return Array(randomNumbers)
}

func startBaseballGame() {
    let answerNumbers = generateRandomNumber()
    var chance = 9
    var isRemainingChance = true

    while isRemainingChance {
        chance -= 1

        let userNumbers = retrieveUserNumbers()
        let matchCount = checkBallStrikeCount(from: answerNumbers, with: userNumbers)

        print("\(matchCount.strike) 스트라이크, \(matchCount.ball) 볼")

        if matchCount.strike == 3 {
            print("사용자 승리!")
            isRemainingChance = false
        } else if chance == 0 {
            print("컴퓨터 승리...!")
            isRemainingChance = false
        } else {
            print("남은 기회 : \(chance)")
        }
    }
}

offerBaseballGameMenu()
