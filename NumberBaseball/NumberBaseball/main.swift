//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func generateNumbers() -> [Int] {
    var numbers: Set<Int> = []
    while numbers.count < 3 {
        numbers.insert(Int.random(in: 1...9))
    }
    return Array(numbers)
}

func compare(between computerNumbers: [Int], and userNumbers: [Int]) -> [Int] {
    var strikeCounter: Int = 0
    var ballCounter: Int = 0
    computerNumbers.enumerated().forEach{ (index, computerNumber) in
        if userNumbers[index] == computerNumber {
            strikeCounter += 1
        } else if userNumbers.contains(computerNumber) {
            ballCounter += 1
        }
    }
    let compareResult: [Int] = [strikeCounter, ballCounter]
    return compareResult
}

func playGame() {
    while true {
        print("1. 게임시작", "2. 게임종료", "원하는 기능을 선택해주세요 : ", separator: "\n", terminator: "")
        guard let inputedMenuValue = readLine(), let num = Int(inputedMenuValue), 1...2 ~= num else { print("입력이 잘못되었습니다."); continue }
        if num == 1 {
            break
        }else {
            return
        }
    }
    
    let computerNumbers: [Int] = generateNumbers()
    var gameCounter: Int = 9
    while gameCounter > 0 {
        guard let userNumbers = getUserNumbers() else {
            print("입력이 잘못되었습니다")
            continue
        }
        let gameResult = compare(between: computerNumbers, and: userNumbers)
        gameCounter -= 1
        print("\(gameResult[0]) 스트라이크, \(gameResult[1]) 볼")
        if gameResult[0] == 3 {
            print("유저 승리...!")
            break
        } else if gameCounter == 0 {
            print("컴퓨터 승리...!")
            break
        }
        print("남은 기회 : \(gameCounter)")
    }
}

func removeDuplicate(_ array: [Int]) -> [Int] {
    var removedArray = [Int]()
    for item in array {
        if removedArray.contains(item) == false {
            removedArray.append(item)
        }
    }
    return removedArray
}

func getUserNumbers() -> [Int]? {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.", "중복 숫자는 허용하지 않습니다.", "입력 : ", separator: "\n" , terminator: "")
    guard let recivedValue = readLine() else { return nil }
    let separatedNumbers = recivedValue.components(separatedBy: " ").compactMap{ Int($0) }
    guard separatedNumbers.count == 3 else { return nil }
    let oneDigitNumbers = removeDuplicate(separatedNumbers).filter{ $0 < 10 }
    guard oneDigitNumbers.count == 3 else { return nil }
    return oneDigitNumbers
}

playGame()
