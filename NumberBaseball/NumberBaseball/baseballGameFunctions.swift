//
//  functions.swift
//  NumberBaseball
//
//  Created by Minseong Kang on 2022/04/13.
//

import Foundation

func playGame(opportunityCount: Int) {
    let tryNumbers = selectRandomNumbers(howMany: 3)
    let roundScore = countStrikeAndBall(in: tryNumbers, from: answerNumbers)
    
    printRoundResult(comparingWith: tryNumbers, score: roundScore, leftOpportunity: opportunityCount)
    
    if roundScore.strike == totalAnswerNumbers {
        print("플레이어 승리...!")
        return
    }
    
    if opportunityCount == 0 {
        print("컴퓨터 승리...!")
        return
    }
    
    playGame(opportunityCount: opportunityCount - 1)
}


func selectRandomNumbers(howMany maximum: Int) -> [Int] {
    var randomNumbers: [Int] = []
    var candidateNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    candidateNumbers.shuffle()
    
    while randomNumbers.count < maximum {
        randomNumbers.append(candidateNumbers.removeFirst())
    }
    
    return randomNumbers
}


func countStrikeAndBall(in tryNumbers: [Int], from answerNumbers: [Int]) -> (strike: Int, ball: Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0

    for index in 0..<answerNumbers.endIndex {
        guard answerNumbers[index] != tryNumbers[index] else {
            strikeCount += 1
            continue
        }
        guard answerNumbers.contains(tryNumbers[index]) else { continue }
            ballCount += 1
    }
    return (strikeCount, ballCount)
}


func printRoundResult(comparingWith numbers: [Int], score: (strike: Int, ball: Int), leftOpportunity: Int) {
    print("임의의 수 : ", terminator: "")
    for number in numbers {
        print(number, terminator: " ")
    }

    print("\n\(score.strike) 스트라이크, \(score.ball) 볼")
    print("남은 기회: \(leftOpportunity)")
}
