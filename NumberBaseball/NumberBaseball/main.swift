//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var remainingAttempts: Int = 9
var targetNumbers: [Int] = []
let numbersToGenerate = 3

func generateRandomNumbers() -> [Int] {
    var radomNumbers: Set<Int> = []
    
    while radomNumbers.count < numbersToGenerate {
        let number: Int = Int.random(in: 1...9)
        radomNumbers.insert(number)
    }
    return Array(radomNumbers)
}

func receivePlayerNumbers() -> [Int]? {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    guard let input: String = readLine(), input != "" else { return nil }
    
    if let validInput = isValidInput(input: input) {
        return validInput
    }
    print("입력이 잘못되었습니다")
    return nil
}

func isValidInput(input: String) -> [Int]? {
    let inputArray: [String] = input.components(separatedBy: " ")
    let intArray: [Int] = inputArray.compactMap{ Int($0) }.filter{ 0 < $0 && $0 < 10 }
    
    guard Set(intArray).count == 3 else { return nil }
    return intArray
}

func calculateStrikeAndBall(target: [Int], player: [Int]) -> (Int, Int) {
    var strikeCount = 0
    var ballCount = 0
    
    for index in 0..<numbersToGenerate {
        if target[index] == player[index] {
            strikeCount += 1
        } else if target.contains(player[index]){
            ballCount += 1
        }
    }
    return (strikeCount, ballCount)
}

func playInning(playerNumbers: [Int]) -> Int {
    
    print("\(targetNumbers)")
    print("\(playerNumbers)")
    
    let (strikeCount, ballCount) = calculateStrikeAndBall(target: targetNumbers, player: playerNumbers)
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    return strikeCount
}

func printRemainingAttempts() {
    remainingAttempts -= 1
    print("남은 기회: \(remainingAttempts)")
}

func checkGameResult() {
    if remainingAttempts == 0 {
        print("컴퓨터 승리...!")
    } else {
        print("사용자 승리!")
    }
}

func startGame() {
    targetNumbers = generateRandomNumbers()
    while remainingAttempts > 0 {
        guard let playerNumbers = receivePlayerNumbers() else { continue }
        let strikeCount = playInning(playerNumbers: playerNumbers)
        
        if strikeCount == numbersToGenerate {
            break
        }
        printRemainingAttempts()
    }
    checkGameResult()
}

startGame()




