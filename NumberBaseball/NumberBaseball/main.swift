//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let numberCount: Int = 3
let numberRange: ClosedRange<Int> = 1...9

func selectGameMenu() {
    while true {
        print("1. 게임시작\n2. 게임종료")
        print("원하는 기능을 선택해 주세요 : ", terminator: "")
        let inputMenuNumber = readLine()
        switch inputMenuNumber {
        case "1":
            startGame()
        case "2":
            return
        default:
            print("입력이 잘못되었습니다.")
            continue
        }
    }
}

func startGame() {
    var playerScore: (strikeScore: Int, ballScore: Int)
    guard let computerNumbers: [Int] = makeRandomNumber() else { return }
    var gameCount: Int = 9
    repeat {
        gameCount -= 1
        let playerNumbers: [Int] = outputPlayNumber()
        playerScore = getScore(problemNumber: playerNumbers, solutionNumber: computerNumbers)
        printGameResult(solutionNumber: playerNumbers, playerStrikeScore: playerScore.strikeScore, playerBallScore: playerScore.ballScore, gameCount: gameCount)
    } while gameCount > Int.zero && playerScore.strikeScore != 3
}

func makeRandomNumber() -> [Int]? {
    var nonOverlappingNumber: [Int] = []
    var range: Set<Int> = Set<Int>(numberRange)
    while nonOverlappingNumber.count < numberCount {
        guard let randomNumber: Int = range.randomElement() else { return nil }
        nonOverlappingNumber.append(randomNumber)
        range.remove(randomNumber)
    }
    return nonOverlappingNumber
}

func outputPlayNumber() -> [Int]  {
    guard let playNumbers: [Int] = checkPlayNumber(
        playerNumbers: inputPlayNumber()
    ) else {
        return outputPlayNumber()
    }
    return playNumbers
}

func checkPlayNumber(playerNumbers: [String]) -> [Int]? {
    let range: Set<Int> = Set<Int>(numberRange)
    let verifyNumbers: [Int] = playerNumbers.compactMap{ Int($0) }
    guard playerNumbers.count != numberCount || range.intersection(verifyNumbers).count != numberCount else { return verifyNumbers }
    printInputError()
    return nil
}

func inputPlayNumber() -> [String] {
    printInputInfomation()
    guard let inputPlayNumbers: [String] = readLine()?.components(separatedBy: " ") else {
        printInputError()
        return inputPlayNumber()
    }
    return inputPlayNumbers
}

func printInputInfomation() {
    print("숫자 3개를 띄어쓰고 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
}

func printInputError() {
    print("입력이 잘못되었습니다.")
}

func getScore(problemNumber: [Int], solutionNumber: [Int]) -> (strikeScore: Int, ballScore: Int) {
    var score: (strikeScore: Int, ballScore: Int) = (strikeScore: 0, ballScore: 0)
    
    for i in 0..<problemNumber.count {
        score.strikeScore += checkScore(problemNumber: problemNumber, solutionNumber: solutionNumber, index: i).strike
        score.ballScore += checkScore(problemNumber: problemNumber, solutionNumber: solutionNumber, index: i).ball
    }
    return score
}

func checkScore(problemNumber: [Int], solutionNumber: [Int], index: Int) -> (strike: Int, ball: Int) {
    if problemNumber[index] == solutionNumber[index] {
        return (strike: 1, ball: 0)
    } else if problemNumber.contains(solutionNumber[index]) {
        return (strike: 0, ball: 1)
    } else {
        return (strike: 0, ball: 0)
    }
}

func printGameResult(solutionNumber: [Int], playerStrikeScore: Int, playerBallScore: Int, gameCount: Int) {
    print("\(playerStrikeScore) 스트라이크, \(playerBallScore) 볼")
    if playerStrikeScore != 3 {
        print("남은 기회 : \(gameCount)")
    }
    
    if playerStrikeScore == 3 {
        print("사용자 승리!")
    } else if gameCount == 0 {
        print("컴퓨터 승리...!")
    }
}

selectGameMenu()
