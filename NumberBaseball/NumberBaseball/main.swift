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
func generateRandomNumbers(range: ClosedRange<Int> = 1...9, numbersCount: Int = 3) -> Array<Int> {
    var randomNumbers: Set<Int> = []
    while randomNumbers.count < numbersCount {
        randomNumbers.insert(Int.random(in: range))
    }
    return Array(randomNumbers)
}

func calculateStrikeBallWith(_ userNumbers: Array<Int>, and computerNumbers: Array<Int>) -> (strikeResult: Int, ballResult: Int) {
    let strikePoint = 1
    var (strikeCount, ballCount) = (Int.zero, Int.zero)
    for index in userNumbers.indices {
        strikeCount += userNumbers[index] == computerNumbers[index] ? strikePoint : .zero
    }
    ballCount = (Set(computerNumbers).intersection(userNumbers).count - strikeCount)
    strikeCounting += strikeCount
    return (strikeCount, ballCount)
}

func printPlayingGameMessage(userNumbers: Array<Int> ,ballCount: Int ,strikeCount: Int) {
    let (strikeDescription, ballDescription) =  ("스트라이크," ,"볼")
    let (randomNumbersDescription, remainingChanceDescription) = ("임의의 수 : " ,"남은 기회 :")
    let squareBrakets: CharacterSet = ["[","]"]
    
    print("\(randomNumbersDescription) \(userNumbers.description.replacingOccurrences(of: ",", with: "").trimmingCharacters(in: squareBrakets))")
    print("\(strikeCount) \(strikeDescription) \(ballCount) \(ballDescription) ")
    print("\(remainingChanceDescription) \(remainingChangeCount)")
}

func judgeGameResult() {
    let (userWin, computerWin) = ("사용자의 승리...!", "컴퓨터의 승리...!")
    print(remainingChangeCount == .zero ? computerWin : userWin)
}

func playGame() {
    let chancePoint = 1
    
    while remainingChangeCount > .zero {
        let userNumbers = generateRandomNumbers()
        let (strikeResult, ballResult) = calculateStrikeBallWith(userNumbers, and: computerNumbers)
        remainingChangeCount -= chancePoint
        printPlayingGameMessage(userNumbers: userNumbers, ballCount: ballResult, strikeCount: strikeResult)
        if strikeCounting == endGameCount { break }
    }
    judgeGameResult()
}
playGame()
