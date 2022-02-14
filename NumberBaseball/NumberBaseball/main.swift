//
//  NumberBaseball - main.swift
//  Created by Lingo, RED. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let targetStrikeCount: Int = 3
let targetRange: ClosedRange<Int> = 1...9
let totalMatchCount: Int = 9

func main() {
    print("""
    1. 게임시작
    2. 게임종료
    원하는 기능을 선택해주세요 :
    """, terminator: " ")
    
    guard let menuSelection = readLine() else {
        return
    }
    
    switch menuSelection {
    case "1":
        playNumberBaseBallGame()
        main()
    case "2":
        break
    default:
        print("입력이 잘못되었습니다")
        main()
    }
}

func playNumberBaseBallGame() {
    var gameStatus: Bool = true
    var matchCount: Int = totalMatchCount
    var strikeCount: Int = Int.zero
    var ballCount: Int = Int.zero
    
    var playerNumbers: [Int] = []
    let computerNumbers: [Int] = generateRandomNumbers()
    
    while matchCount > Int.zero && gameStatus {
        playerNumbers = []
        allocatePlayerNumbers(&playerNumbers)
        (strikeCount, ballCount) = checkGameScore(playerNumbers, computerNumbers)
        gameStatus = checkGameStatus(strikeCount)

        matchCount -= 1
        displayScore(strikeCount, ballCount)
        displayScoreBoard(&matchCount, gameStatus)
    }
}

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

func allocatePlayerNumbers(_ playerNumbers: inout [Int]) {
   while playerNumbers == [] {
        playerNumbers = generatePlayerNumbers()
    }
}

func generatePlayerNumbers() -> [Int] {
    print("""
    숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
    중복 숫자는 허용하지 않습니다.
    입력 :
    """, terminator: " ")
    
    guard let inputString = readLine() else { return [] }
    
    if validatePlayerNumbers(inputString) {
        return convertInputToIntArray(inputString)
    } else {
        print("입력이 잘못되었습니다")
        return []
    }
}

func validatePlayerNumbers(_ inputString: String) -> Bool {
    let inputNumber = convertInputToIntArray(inputString)
    return checkDuplicated(inputNumber) && checkRanged(inputNumber)
}

func convertInputToIntArray(_ inputString: String) -> [Int] {
    return inputString
        .components(separatedBy: " ")
        .compactMap { (number: String) -> Int? in
            return Int(number)
        }
}

func checkDuplicated(_ inputNumber: [Int]) -> Bool {
    return inputNumber.count == Set(inputNumber).count
}

func checkRanged(_ inputNumber: [Int]) -> Bool {
    return inputNumber
        .filter { (number: Int) -> Bool in
            return targetRange.contains(number)
        }.count == targetStrikeCount
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


func checkGameStatus(_ strikeCount: Int) -> Bool {
    if strikeCount == targetStrikeCount {
        return false
    }
    return true
}

func displayScore(_ strikeCount: Int, _ ballCount: Int) {
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
}

func displayScoreBoard(_ matchCount: inout Int, _ gameStatus: Bool) {
    if gameStatus == false {
        print("사용자 승리!")
    } else if matchCount == Int.zero {
        print("남은 기회 : \(matchCount)")
        print("컴퓨터 승리...!")
    } else {
        print("남은 기회 : \(matchCount)")
    }
}

main()
