//
//  functions.swift
//  NumberBaseball
//
//  Created by Minseong Kang on 2022/04/13.
//

import Foundation

func makingRandomNumbers() -> [Int] {
    let candidateNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    var randomNumbers = candidateNumbers.shuffled()
    randomNumbers.removeSubrange(randomNumbers.startIndex...randomNumbers.count - totalAnswerNumbers - 1)
    return randomNumbers
}

func printTryNumbers(whichIs numbers: [Int]) {
    print("임의의 수 : ", terminator: "")
    
    for number in numbers {
        print(number, terminator: " ")
    }
    print()
}

func countingStrikeAndBall(in tryNumbers: [Int], from answerNumbers: [Int]) -> (strike: Int, ball: Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0

    for index in 0...2{
        if answerNumbers[index] == tryNumbers[index]{
            strikeCount += 1
        } else if answerNumbers.contains(tryNumbers[index]){
            ballCount += 1
        }
    }
    return (strikeCount, ballCount)
}

func playGame() {
    let answerNumbers = makingRandomNumbers()
    var opportunityCount = 9
    
    while opportunityCount != 0 {
        opportunityCount -= 1
        
        let tryNumbers = makingRandomNumbers()
        let strikeCount = countingStrikeAndBall(in: tryNumbers, from: answerNumbers).strike
        let ballCount = countingStrikeAndBall(in: tryNumbers, from: answerNumbers).ball
        
        printTryNumbers(whichIs: tryNumbers)
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        print("남은 기회: \(opportunityCount)")
        print()
        
        if strikeCount == 3 {
            print("플레이어 승리...!")
            return
        }
    }
    print("컴퓨터 승리...!")
}
