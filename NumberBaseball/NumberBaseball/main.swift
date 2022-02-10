//
//  NumberBaseball - main.swift
//  Created by Roy and 쿼카 .
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let computerNumbers = generateRandomNumbers()
var remainingChangeCount: Int = 9
var strikeCounting = 0
let endGameCount = 3

// 사용자정의를 못만드니 전역변수로 처리하는데, one이라는 숫자대신 변수로
func generateRandomNumbers(range: ClosedRange<Int> = 1...9, three: Int = 3) -> Set<Int> {
    var randomNumbers: Set<Int> = []
    while randomNumbers.count < three {
        randomNumbers.insert(Int.random(in: range))
    }
    return randomNumbers
}

func compareNumbers(user: Set<Int>, computer: Set<Int>) -> (strikeResult: Int, ballResult: Int) {
    let strikePoint = 1
    var (strikeCount, ballCount) = (Int.zero, Int.zero)
    for index in Array(user).indices {
        strikeCount += Array(user)[index] == Array(computer)[index] ? strikePoint : .zero
    }
    ballCount = (computer.intersection(user).count - strikeCount)
    strikeCounting += strikeCount
    return (strikeCount, ballCount)
}

func printPlayingGameMessage(userNumbers: Set<Int> ,ballCount: Int ,strikeCount: Int) {
    let (strike, ball) =  ("스트라이크," ,"볼")
    let (randomNumbers, remainingChance) = ("임의의 수 : " ,"남은 기회 :")
    let squareBraketRight: CharacterSet = ["[","]"]
    
    print("\(randomNumbers) \(userNumbers.description.replacingOccurrences(of: ",", with: "").trimmingCharacters(in: squareBraketRight))")
    print("\(strikeCount) \(strike) \(ballCount) \(ball) ")
    print("\(remainingChance) \(remainingChangeCount)")
}

func judgeGameResult() {
    let (userWin, computerWin) = ("사용자의 승리...!", "컴퓨터의 승리...!")
    print(remainingChangeCount == .zero ? computerWin : userWin)
}

func playGame() {
    let change = 1
    
    while remainingChangeCount > .zero {
        let userNumbers = generateRandomNumbers()
        let (strikeCount, ballCount) = compareNumbers(user: userNumbers, computer: computerNumbers)
        remainingChangeCount -= change
        printPlayingGameMessage(userNumbers: userNumbers, ballCount: ballCount, strikeCount: strikeCount)
        if strikeCounting == endGameCount { break }
    }
    judgeGameResult()
}
playGame()
