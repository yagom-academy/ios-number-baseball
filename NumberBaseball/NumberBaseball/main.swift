//
//  NumberBaseball - main.swift
//  Created by Lingo, RED. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var targetStrikeCount: Int = 3
var targetRange: ClosedRange<Int> = 1...9

func generateRandomNumbers(range: ClosedRange<Int> = targetRange, quantity: Int = targetStrikeCount) -> [Int] {
    guard range.count >= quantity else {
        return []
    }
    var numbers: Set<Int> = []

    while numbers.count < quantity {
        numbers.insert(Int.random(in: range))
    }
    return Array(numbers)
}

func checkGameScore(_ playerNumbers: [Int], _ computerNumbers: [Int]) -> (Int, Int) {
    var strikeCount: Int = Int.zero
    var ballCount: Int = Int.zero

    for (playerNumber, computerNumber) in zip(playerNumbers, computerNumbers) {
        let (strike, ball) = increaseGameScore(playerNumber, computerNumber, computerNumbers)
        strikeCount += strike
        ballCount += ball
    }
    return (strikeCount, ballCount)
}

func increaseGameScore(_ playerNumber: Int, _ computerNumber: Int, _ computerNumbers: [Int]) -> (Int, Int) {
    var strikeCount = Int.zero
    var ballCount: Int = Int.zero
    
    if playerNumber == computerNumber {
        strikeCount += 1
    } else if computerNumbers.contains(playerNumber) {
        ballCount += 1
    }
    return (strikeCount, ballCount)
}

func convertArrayToString(of values: [Int]) -> String {
    return values.map { (value: Int) -> String in
        return String(value)
    }.joined(separator: " ")
}

func checkDuplicated(_ inputNumber: [Int]) -> Bool {
    return inputNumber.count == Set(inputNumber).count
}

func checkRanged(_ inputNumber: [Int]) -> Bool {
    var isRanged: [Bool] = []
    for number in inputNumber {
        isRanged.append(targetRange.contains(number))
    }

    return isRanged.allSatisfy { (value: Bool) -> Bool in
        return value == true
    }
}

func validatePlayerNumbers(_ inputString: String) -> Bool {
    let inputNumber = convertInputToIntArray(inputString)
    return checkDuplicated(inputNumber) && checkRanged(inputNumber)
}

func convertInputToIntArray(_ inputString: String) -> [Int] {
    let playerNumbers = inputString.components(separatedBy: " ")
    return playerNumbers.compactMap { (number: String) -> Int? in
        return Int(number)
    }
}

func generatePlayerNumbers() -> [Int] {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    guard let inputString = readLine() else { return [] }
    
    if validatePlayerNumbers(inputString) {
        return convertInputToIntArray(inputString)
    } else {
        print("입력이 잘못되었습니다")
        return []
    }
}

func allocatePlayerNumbers(_ playerNumbers: inout [Int]) {
   while playerNumbers == [] {
        playerNumbers = generatePlayerNumbers()
    }
}

func playNumberBaseBallGame() {
    var playerNumbers: [Int] = []
    var computerNumbers: [Int] = []
    var matchCount: Int = 9
    var strikeCount: Int = Int.zero
    var ballCount: Int = Int.zero
    
    computerNumbers = generateRandomNumbers()
    
    while matchCount > Int.zero {
        
        playerNumbers = []
        
        allocatePlayerNumbers(&playerNumbers)
        
        (strikeCount, ballCount) = checkGameScore(playerNumbers, computerNumbers)
        
        matchCount -= 1
        
        displayScoreBoard(&matchCount, strikeCount, ballCount)
    }
}

func displayScoreBoard(_ matchCount: inout Int, _ strikeCount: Int, _ ballCount: Int) {
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    
    if strikeCount == targetStrikeCount {
        matchCount = Int.zero
        print("사용자 승리!")
    } else if matchCount == Int.zero {
        print("남은 기회 : \(matchCount)")
        print("컴퓨터 승리...!")
    } else {
        print("남은 기회 : \(matchCount)")
    }
}

func main() {
    var gameStatus: Bool = true
    
    while gameStatus {
        print("1. 게임시작")
        print("2. 게임종료")
        print("원하는 기능을 선택해주세요 : ", terminator: "")
        
        takePlayerIntention(&gameStatus)
    }
}

func takePlayerIntention(_ gameStatus: inout Bool) {
    guard let choice = readLine() else { return }
    
    switch choice {
    case "1":
        playNumberBaseBallGame()
    case "2":
        gameStatus = false
    default:
        print("입력이 잘못되었습니다")
    }
}

main()

