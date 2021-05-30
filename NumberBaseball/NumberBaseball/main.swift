//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func makeUniqueNumber(from targetArray: [Int]) -> Int {
    let number = Int.random(in: 1...9)
    if !targetArray.contains(number) {
        return number
    }
    return makeUniqueNumber(from: targetArray)
}

func makeRandomNumbers() -> [Int] {
    var randomArray = [Int]()
    while randomArray.count < 3 {
        let number = makeUniqueNumber(from: randomArray)
        randomArray.append(number)
    }
    return randomArray
}

func isAnswer(_ guessNumbers: [Int], _ answerNumbers: [Int]) -> Bool {
    if guessNumbers == answerNumbers {
        return true
    }
    return false
}

func countStrikeAndBall(_ guessNumbers: [Int], _ answerNumbers: [Int]) -> (Int, Int) {
    var index = 0
    var strike = 0
    var ball = 0
    while index < 3 {
        if guessNumbers[index] == answerNumbers[index] {
            strike += 1
        } else if guessNumbers.contains(answerNumbers[index]) {
            ball += 1
        }
        index += 1
    }
    return (strike, ball)
}

func printGuessNumbers(_ guessNumbers: [Int]) {
    var printString = ""
    for index in guessNumbers.startIndex..<guessNumbers.endIndex {
        printString += String(guessNumbers[index]) + " "
    }
    printString.removeLast()
    print("임의의 수 : \(printString)")
}

func printMessageIfLastRound(index: Int, tryRound: Int) {
    if index == tryRound {
        print("컴퓨터 승리...!")
    }
}

func printStrikeAndBall(_ strike: Int, _ ball: Int, leftRound: Int) {
    print("\(strike) 스트라이크, \(ball) 볼")
    print("남은 기회 : \(leftRound)")
}

func printUserWinMessage() {
    print("3 스트라이크, 0 볼")
    print("사용자 승리!")
}

func gameStart(_ tryRound: Int, _ answerNumbers: [Int]) {
    var index = 1
    var guessNumbers = makeRandomNumbers()
    while index <= tryRound && isAnswer(guessNumbers, answerNumbers) {
        let (strike, ball) = countStrikeAndBall(guessNumbers, answerNumbers)
        printGuessNumbers(guessNumbers)
        printMessageIfLastRound(index: index, tryRound: tryRound)
        printStrikeAndBall(strike, ball, leftRound: tryRound - index)
        guessNumbers = makeRandomNumbers()
        index += 1
    }
    if index <= tryRound && isAnswer(guessNumbers, answerNumbers) {
        printUserWinMessage()
    }
}

func main() {
    let tryRound = 9
    let answerNumbers = makeRandomNumbers()
    gameStart(tryRound, answerNumbers)
}

main()


