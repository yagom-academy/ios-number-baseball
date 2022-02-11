//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


func selectGameMenu() {
    while true {
        print("1. 게임시작\n2. 게임종료")
        print("원하는 기능을 선택해 주세요 : ", terminator: "")
        guard let inputMenuNumber = readLine() else { return }
        switch inputMenuNumber {
        case "1": startGame()
        case "2": return
        default: print("입력이 잘못되었습니다."); continue
        }
    }
}

func makeRandomNumber(from: Int, to: Int, count: Int) -> [Int]? {
    var nonOverlappingNumber: [Int] = []
    var range: Set<Int> = Set<Int>(from...to)
    while nonOverlappingNumber.count < count {
        guard let randomNumber: Int = range.randomElement() else { return nil }
        nonOverlappingNumber.append(randomNumber)
        range.remove(randomNumber)
    }
    return nonOverlappingNumber
}

func inputPlayerNumber() {
    print("숫자 3개를 띄어쓰고 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    guard let inputPlayerNumbers = readLine()?.components(separatedBy: " ") else { return }
    veryfyNumber(playerNumbers: inputPlayerNumbers)
    
}

func veryfyNumber(playerNumbers: [String]) {
    guard playerNumbers.count == 3 else { return }
    let veryfyNumbers: [Int] = playerNumbers.compactMap{Int($0)}
    
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
    print("\(playerStrikeScore) 스트라이크, \(playerBallScore) 볼")
    print("남은 기회 : \(gameCount)")
}


func startGame() {
    var playerScore: (strikeScore: Int, ballScore: Int)
    guard let computerNumbers = makeRandomNumber(from: 1, to: 9, count: 3) else { return }
    var gameCount: Int = 9
    repeat {
        gameCount -= 1
        guard let playerNumbers = makeRandomNumber(from: 1, to: 9, count: 3) else { return }
        playerScore = getScore(problemNumber: playerNumbers, solutionNumber: computerNumbers)
        printGameResult(solutionNumber: playerNumbers, playerStrikeScore: playerScore.strikeScore, playerBallScore: playerScore.ballScore, gameCount: gameCount)
    } while gameCount > Int.zero && playerScore.strikeScore != 3
}


