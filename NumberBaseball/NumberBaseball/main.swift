//
//  NumberBaseball - main.swift
//  Created by Etailmoon, Mary.
//  Copyright © yagom academy. All rights reserved.
//

func createThreeNumbers() -> [Int] {
    return Array((1...9).shuffled()[0...2])
}

func computeGameResult(computer winningNumbers: [Int], user guessNumbers: [Int]) -> (ball: Int, strike: Int) {
    var ball = 0
    var strike = 0
    
    for (index, element) in guessNumbers.enumerated() {
        if element == winningNumbers[index] {
            strike += 1
        } else if winningNumbers.contains(element) {
            ball += 1
        }
    }
    
    return (ball, strike)
}

func isWin(strike: Int) -> Bool {
    if strike == 3 {
        print("사용자 승리!")
        return true
    } else {
        return false
    }
}

func isLose(remainingAttempts: Int) -> Bool {
    if remainingAttempts == 1 {
        print("컴퓨터 승리...!")
        return true
    } else {
        return false
    }
}

func startGame() {
    let winningNumbers = createThreeNumbers()
    var remainingAttempts = 9
    
    while remainingAttempts > 0 {
        let guessNumbers = createThreeNumbers()
        let gameResult = computeGameResult(computer: winningNumbers, user: guessNumbers)
        
        print("임의의 수 : \(guessNumbers.map { String($0) }.joined(separator: " "))")
        print("\(gameResult.strike) 스트라이크, \(gameResult.ball) 볼")
        
        if isWin(strike: gameResult.strike) { break }
        if isLose(remainingAttempts: remainingAttempts) { break }

        remainingAttempts -= 1
        print("남은 기회 : \(remainingAttempts)")
    }
}

startGame()
