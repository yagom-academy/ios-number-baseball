//
//  functions.swift
//  NumberBaseball
//
//  Created by Minseong Kang on 2022/04/13.
//

import Foundation

func getUserInput() -> [String] {
    print("입력 : ", terminator: "")
    guard let playerInput = readLine() else { return [""] }
    return playerInput.map { String($0) }
}

func printInvalidInputMessage() {
    print("입력이 잘못되었습니다.")
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 사용하지 않습니다.")
}

func printMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
}

func getUserChoiceOnMenu() -> String {
    guard let userChoice = readLine() else { return "" }
    return userChoice
}

func startGame(opportunityCount: Int) {
    printMenu()
    
    switch getUserChoiceOnMenu() {
    case "1":
        playGame(opportunityCount: opportunityCount - 1)
        startGame(opportunityCount: opportunityCount)
    case "2":
        return
    default:
        print("입력이 잘못되었습니다.")
        startGame(opportunityCount: opportunityCount)
    }
    return
}

func convertToIntArray(from stringArray: [String]) -> [Int] {
    var intArray: [Int] = []
    
    for element in stringArray {
        guard let number = Int(element) else { continue }
        intArray.append(number)
    }
    return intArray
}

func playGame(opportunityCount: Int) {
    let userInput: [String] = getUserInput()
    
    guard isValidInput(userInput) == true else {
        printInvalidInputMessage()
        playGame(opportunityCount: opportunityCount)
        return
    }
    
    let tryNumbers = convertToIntArray(from: userInput)
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

func checkWinnerSeeing(strikeCount: Int, leftRound: Int) {
    if strikeCount == totalAnswerNumbers {
        isFinished = true
        winner = "사용자"
    } else if leftRound == 0 {
        isFinished = true
        winner = "컴퓨터"
    }
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
