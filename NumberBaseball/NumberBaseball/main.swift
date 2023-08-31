//
//  NumberBaseball - main.swift
//  Created by jyubong, morgan.
//  Copyright © yagom academy. All rights reserved.
//

func selectMenu() {
    var isPlaying: Bool = true
    
    while isPlaying {
        print("""
        1. 게임 시작
        2. 게임 종료
        원하는 기능을 선택해주세요 :
        """, terminator: " ")

        guard let selectNumber = readLine() else {
            print("입력이 잘못되었습니다.")
            continue
        }
        
        switch selectNumber {
        case "1":
            playNumberBaseBall()
        case "2":
            isPlaying = false
        default:
            print("입력이 잘못되었습니다.")
            continue
        }
    }
}

func playNumberBaseBall() {
    var remainingCount: Int = 9
    let computerNumbers = makeRandomNumbers()
    
    while remainingCount > 0 {
        let userNumbers = selectUserNumbers()
        let strike = countStrike(computerNumbers: computerNumbers, userNumbers: userNumbers)
        let ball = countBall(computerNumbers: computerNumbers, userNumbers: userNumbers)
        
        showResult(strike: strike, ball: ball, remainingCount: &remainingCount)
    }
}

func makeRandomNumbers() -> [Int] {
    var numbers: Set<Int> = []
    
    while numbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        
        numbers.insert(randomNumber)
    }
    return Array(numbers)
}

func selectUserNumbers() -> [Int] {
    var isIncorrect: Bool = true
    
    while isIncorrect {
        print("""
        숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
        중복 숫자는 허용하지 않습니다.
        입력 :
        """, terminator: " ")
        
        guard let userInput = readLine() else {
            print("입력이 잘못되었습니다.")
            continue
        }
        
        let userNumbers: [Int] = userInput.split(separator: " ").map{Int($0) ?? 10}
        
        if validate(userNumbers: userNumbers) {
            isIncorrect = false
        } else {
            continue
        }
        return userNumbers
    }
}

func validate(userNumbers: [Int]) -> Bool {
    if userNumbers.count != 3 {
        print("입력이 잘못되었습니다.")
        return false
    }
    
    let numbersSetList = Array(Set(userNumbers))
    
    if numbersSetList.count != 3 {
        print("입력이 잘못되었습니다.")
        return false
    }
    
    for number in numbersSetList{
        if number > 9 || number < 1 {
            print("입력이 잘못되었습니다.")
            return false
        }
    }
    return true
}

func countStrike(computerNumbers: [Int], userNumbers: [Int]) -> Int {
    var strike = 0
    
    for index in 0..<userNumbers.count {
        if computerNumbers[index] == userNumbers[index] {
            strike += 1
        }
    }
    return strike
}

func countBall(computerNumbers: [Int], userNumbers: [Int]) -> Int {
    var ball = 0
    
    for index in 0..<userNumbers.count {
        let userNumber = userNumbers[index]
        
        if computerNumbers[index] != userNumber && computerNumbers.contains(userNumber) {
            ball += 1
        }
    }
    return ball
}

func showResult(strike: Int, ball: Int, remainingCount: inout Int) {
    print("\(strike) 스트라이크, \(ball) 볼")
    
    if strike == 3 {
        print("유저의 승리...!")
        remainingCount = 0
        return
    } else {
        remainingCount -= 1
    }
    
    if remainingCount == 0 {
        print("컴퓨터의 승리...!")
        return
    } else {
        print("남은 기회 : \(remainingCount)")
    }
}

selectMenu()
