//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func makeRandomNumber(to: Int, from: Int, count: Int) -> [Int]? {
    var nonOverlappingNumber: [Int] = []
    var range: Set<Int> = Set<Int>(to...from)
    while nonOverlappingNumber.count < count {
        guard let randomNumber: Int = range.randomElement() else { return nil }
        nonOverlappingNumber.append(randomNumber)
        range.remove(randomNumber)
    }
    return nonOverlappingNumber
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
    print("임의의 수 : " + solutionNumber.map({ (value : Int) -> String in return String(value) }).joined(separator: " "))

    if playerStrikeScore == 3 {
        print("사용자 승리!")

    } else if gameCount == 0 {
        print("컴퓨터 승리...!")
    }
    print("\(playerStrikeScore) 스트라이크,\(playerBallScore) 볼")
    print("남은 기회 : \(gameCount)")
}

func startGame() {
    var playerScore: (strikeScore: Int, ballScore: Int)
    guard let computerNumbers: [Int] = makeRandomNumber(to: 1, from: 9, count: 3) else { return }
    var gameCount = 9
    repeat {
        gameCount -= 1
        guard let playerNumbers: [Int] = makeRandomNumber(to: 1, from: 9, count: 3) else { return }
        playerScore = getScore(problemNumber: playerNumbers, solutionNumber: computerNumbers)
        printGameResult(solutionNumber: playerNumbers, playerStrikeScore: playerScore.strikeScore, playerBallScore: playerScore.ballScore, gameCount: gameCount)
    } while gameCount > Int.zero && playerScore.strikeScore != 3
}

startGame()
