//
//  NumberBaseball - main.swift
//  Created by Lingo, RED. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var targetStrikeCount: Int = 3
var targetRange: ClosedRange<Int> = 1...9

func generateRandomNumbers(range: ClosedRange<Int> = targetRange, quantity: Int = targetStrikeCount) -> [Int] {
    var numbers: Set<Int> = []

    while numbers.count < quantity {
        numbers.insert(Int.random(in: range))
    }
    return Array(numbers)
}

func checkStrikeCount(_ playerNumbers: [Int], _ computerNumbers: [Int]) -> Int {
    var strikeCount: Int = 0
    
    for (playerNumber, computerNumber) in zip(playerNumbers, computerNumbers) {
        increase(in: &strikeCount) { () -> Bool in
            return playerNumber == computerNumber
        }
    }
    return strikeCount
}

func checkBallCount(_ playerNumbers: [Int], _ computerNumbers: [Int]) -> Int {
    var ballCount: Int = 0
    
    for (index, number) in playerNumbers.enumerated() {
        increase(in: &ballCount) { () -> Bool in
            return number != computerNumbers[index] && computerNumbers.contains(number)
        }
    }
    return ballCount
}

func increase(in count: inout Int, condition: () -> Bool) {
    if condition() {
        count += 1
    }
}

func convertArrayToString(of values: [Int]) -> String {
    return values.map { (value: Int) -> String in
        return String(value)
    }.joined(separator: " ")
}

func validatePlayerNumbers(_ inputNumber: String) -> Bool {
    var isNumber: Bool = false
    var isEqualWithTargetStrikeCount: Bool = false
    var isNotDuplicated: Bool = false
    var isRanged: Bool = false
    let playerNumbers = inputNumber.components(separatedBy: " ")
    var setPlayerNumbers: Set<String> = []
    setPlayerNumbers = Set(playerNumbers)
    
    if playerNumbers.count == targetStrikeCount {
        isEqualWithTargetStrikeCount = true
    }
    
    for numbers in playerNumbers {
        isNumber = numbers.allSatisfy { value in
            value.isNumber
        }
    }
    
    if playerNumbers.count == setPlayerNumbers.count {
        isNotDuplicated = true
    }
    
    let intPlayerNumbers = setPlayerNumbers.compactMap { (number: String) -> Int? in
        return Int(number)
    }
    
    for number in intPlayerNumbers {
        if targetRange.contains(number) {
            isRanged = true
        }
    }
    return isNumber && isEqualWithTargetStrikeCount && isNotDuplicated && isRanged
}

func convertInputToIntArray(_ inputNumber: String) -> [Int] {
    let playerNumbers = inputNumber.components(separatedBy: " ")
    return playerNumbers.compactMap { (stringNumber: String) -> Int? in
        return Int(stringNumber)
    }
}

func createPlayerInput() -> [Int] {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    guard let inputNumber = readLine() else { return [] }
    
    if validatePlayerNumbers(inputNumber) {
        return convertInputToIntArray(inputNumber)
    } else {
        print("입력이 잘못되었습니다")
        return []
    }
}

func playNumberBaseBallGame() {
    var playerNumbers: [Int] = []
    var computerNumbers: [Int] = []
    var matchCount: Int = 9
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    computerNumbers = generateRandomNumbers()
    
    while matchCount > 0 {
        
        playerNumbers = []
        while playerNumbers == [] {
            playerNumbers = createPlayerInput()
        }
        
        strikeCount = checkStrikeCount(playerNumbers, computerNumbers)
        ballCount = checkBallCount(playerNumbers, computerNumbers)
        
        matchCount -= 1
        
        displayScoreBoard(&matchCount, strikeCount, ballCount)
    }
}

func displayScoreBoard(_ matchCount: inout Int, _ strikeCount: Int, _ ballCount: Int) {
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    
    if strikeCount == targetStrikeCount {
        matchCount = 0
        print("사용자 승리!")
    } else if matchCount == 0 {
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
