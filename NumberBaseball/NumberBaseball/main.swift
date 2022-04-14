//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

func mainMenu() {
    
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    
    guard let userInput = readLine() else {
        print("\n⚠️ 컨트롤 + D 를 입력하지 마세요. 🤬 ⚠️")
        return
    }
    
    if userInput == "1" {
        startGame()
    } else if userInput == "2" {
        return
    } else {
        print("입력이 잘못되었습니다.")
        mainMenu()
    }

    mainMenu()
}

func startGame() {
    
    var givenChance: Int = 9
    var computerThreeNumbers: [Int]
    var resultOfStrikeAndBall: [Int]
    var strikeScore: Int
    var ballScore: Int
    var isSuccess: Bool = false
    
    computerThreeNumbers = generatedRandomNumbers()
    
    while isSuccess == false && givenChance > 0 {
        
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.")
        print("입력 : ", terminator: "")
        
        guard let userThreeNumbers = readLine()?.split(separator: " ").map({ Int($0) ?? 0 }) else {
            print("\n⚠️ 컨트롤 + D 를 입력하지 마세요. 🤬 ⚠️")
            return
        }
        
        if inputValidCheck(userThreeNumbers) == false {
            print("입력이 잘못되었습니다.")
            continue
        }
        
        resultOfStrikeAndBall = calculateResult(computer: computerThreeNumbers, user: userThreeNumbers)
        strikeScore = resultOfStrikeAndBall[0]
        ballScore = resultOfStrikeAndBall[1]
        
        print("\(strikeScore) 스트라이크, \(ballScore) 볼")
        
        isSuccess = checkStrike(strikeScore)
        givenChance -= 1
        print("남은 기회 : \(givenChance)")
    }
    
    if isSuccess {
        print("사용자 승리...!")
    }
    
    if givenChance == .zero {
        print("컴퓨터 승리...!")
    }
}

func generatedRandomNumbers(range: ClosedRange<Int> = 1...9, count: Int = 3) -> [Int] {
    
    var list: [Int] = []
    
    while list.count != count {
        
        list.append(Int.random(in: range))
        list = Array(Set(list))
    }
    
    return list
}

func calculateResult(computer: [Int], user: [Int]) -> [Int] {
    
    var resultStrikeAndBall: [Int] = [0, 0]
    
    for userIndex in 0...2 {
        
        guard let computerIndex = computer.firstIndex(of: user[userIndex]) else { continue }
        addScore(to: &resultStrikeAndBall, computer: computerIndex, user: userIndex)
    }
    
    return resultStrikeAndBall
}

func checkStrike(_ strike: Int, _ strikeCount: Int = 3) -> Bool {
    
    if strike == strikeCount {
        return true
    } else {
        return false
    }
}

func addScore(to resultStrikeAndBall: inout [Int], computer: Array<Int>.Index, user: Array<Int>.Index) {
    
    if computer == user {
        resultStrikeAndBall[0] += 1
    } else {
        resultStrikeAndBall[1] += 1
    }
}

func inputValidCheck(_ inputNumbers: [Int]) -> Bool {
    
    guard inputNumbers.count == 3 else {
        return false
    }
    
    if inputNumbers.contains(0) {
        return false
    }
    
    return true
}

mainMenu()
