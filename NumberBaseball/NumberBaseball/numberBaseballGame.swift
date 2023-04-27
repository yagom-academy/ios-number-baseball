//
//  NumberBaseball - main.swift
//  Created by Etailmoon, Mary.
//  Copyright © yagom academy. All rights reserved.
//


fileprivate func createThreeRandomNumbers() -> [Int] {
    return Array((1...9).shuffled()[0...2])
}

fileprivate func computeGameResult(computer winningNumbers: [Int], user guessNumbers: [Int]) -> (ball: Int, strike: Int) {
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

fileprivate func isWin(strike: Int) -> Bool {
    if strike == 3 {
        print("사용자 승리!")
        return true
    } else {
        return false
    }
}

fileprivate func isLose(remainingAttempts: Int) -> Bool {
    if remainingAttempts == 1 {
        print("컴퓨터 승리...!")
        return true
    } else {
        return false
    }
}

fileprivate func startGame() {
    let winningNumbers = createThreeRandomNumbers()
    var remainingAttempts = 9
    
    while remainingAttempts > 0 {
        let guessNumbers = receiveGuessNumbers()
        let gameResult = computeGameResult(computer: winningNumbers, user: guessNumbers)
        
        print("\(gameResult.strike) 스트라이크, \(gameResult.ball) 볼")
        
        if isWin(strike: gameResult.strike) { break }
        if isLose(remainingAttempts: remainingAttempts) { break }

        remainingAttempts -= 1
        print("남은 기회 : \(remainingAttempts)")
    }
}

func showMenu() {
    while true {
        print("1. 게임시작")
        print("2. 게임종료")
        print("원하는 기능을 선택해주세요 : ", terminator: "")
        let selectingMenu = readLine()
        
        guard let selectingMenu,
              let selectingMenu = Int(selectingMenu),
              [1, 2].contains(selectingMenu)
        else {
            print("입력이 잘못되었습니다.")
            continue
        }
        
        if selectingMenu == 2 { break }
        startGame()
    }
}

fileprivate func receiveGuessNumbers() -> [Int] {
    while true {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
        print("중복 숫자는 허용하지 않습니다.\n입력 : ", terminator: "")
        
        guard let inputValue = readLine(),
              isValidGuessNumbers(inputValue) else {
            print("입력이 잘못되었습니다.")
            continue
        }
        
        return inputValue.split(separator: " ").compactMap { Int($0) }
    }
}

fileprivate func isValidGuessNumbers(_ inputValue: String) -> Bool {
    let separatedInputValue = inputValue.split(separator: " ")
    let guessNumbers = separatedInputValue.compactMap({ Int($0) })
    
    guard separatedInputValue.count == 3,
          guessNumbers.count == 3,
          guessNumbers.filter({ 1...9 ~= $0 }).count == 3,
          Set(guessNumbers).count == 3
    else { return false }
    
    return true
}
