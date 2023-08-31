//
//  NumberBaseball - main.swift
//  Created by jyubong, morgan.
//  Copyright © yagom academy. All rights reserved.
// 

func makeRandomNumbers() -> [Int] {
    var numbers: Set<Int> = []
    
    while numbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        
        numbers.insert(randomNumber)
    }
    return Array(numbers)
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

func showRandomNumber(userNumbers: [Int]) {
    print("임의의 수 : ", terminator: "")
    for number in userNumbers {
        print("\(number) ", terminator: "")
    }
}

func showResult(strike: Int, ball: Int, remainingCount: inout Int) {
    print("\n\(strike) 스트라이크, \(ball) 볼")
    
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

func playNumberBaseBall() {
    var remainingCount: Int = 9
    let computerNumbers = makeRandomNumbers()
    
    while remainingCount > 0 {
        let userNumbers = makeRandomNumbers()
        let strike = countStrike(computerNumbers: computerNumbers, userNumbers: userNumbers)
        let ball = countBall(computerNumbers: computerNumbers, userNumbers: userNumbers)
        
        showRandomNumber(userNumbers: userNumbers)
        showResult(strike: strike, ball: ball, remainingCount: &remainingCount)
    }
}

playNumberBaseBall()
