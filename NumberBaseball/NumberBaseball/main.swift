//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func makeUniqueNumber(from targetArray: [Int]) -> Int{
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
        print("3 스트라이크, 0 볼")
        print("사용자 승리!")
        return true
    }
    return false
}

func getStrikeAndBall(_ guessNumbers: [Int], _ answerNumbers: [Int]) -> (Int, Int) {
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
    for i in 0...2 {
        printString += String(guessNumbers[i]) + " "
    }
    printString.removeLast()
    print("임의의 수 : \(printString)")
}

func printMessageIfLastRound(_ i: Int, _ tryRound: Int) {
    if i == tryRound {
        print("컴퓨터 승리...!")
    }
}

func printStrikeAndBall(_ strike: Int, _ ball: Int, leftRound: Int) {
    print("\(strike) 스트라이크, \(ball) 볼")
    print("남은 기회 : \(leftRound)")
}

func gameStart(_ tryRound: Int, _ answerNumbers: [Int] ) {
    for i in 1...tryRound {
        let guessNumbers = makeRandomNumbers()
        if isAnswer(guessNumbers, answerNumbers) {
            break
        }
        let (strike, ball) = getStrikeAndBall(guessNumbers, answerNumbers)
        printGuessNumbers(guessNumbers)
        printMessageIfLastRound(i, tryRound)
        printStrikeAndBall(strike, ball, leftRound: tryRound - i)
    }
}

func main() {
    let tryRound = 9
    let answerNumbers = makeRandomNumbers()
    gameStart(tryRound, answerNumbers)
}

main()
