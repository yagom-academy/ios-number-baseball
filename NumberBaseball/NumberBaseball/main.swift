//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var computerNumbers = makeThreeNumbers()
var userNumbers: [Int] = []
var leftCount: Int = 9
var isUserWin: Bool = false

func playBaseBallGame() {
    while leftCount > 0 {
        var strikeCount: Int = 0
        var ballCount: Int = 0
        userNumbers = makeThreeNumbers()
        (strikeCount, ballCount) = compareNumbers(userNumbers, with: computerNumbers)
        leftCount -= 1
        print("\n\(strikeCount) 스트라이크, \(ballCount) 볼")
        if leftCount != 0 {
            print("남은 기회 : \(leftCount)")
        }
        if strikeCount == 3 {
            isUserWin = true
            break
        }
    }
    if isUserWin {
        print("사용자 승리")
    } else {
        print("컴퓨터 승리...!")
    }
}

func makeThreeNumbers() -> [Int] {
    var numbers: Set<Int> = []
    while numbers.count < 3 {
        numbers.insert(Int.random(in: 1...9))
    }
    return Array(numbers)
}

func compareNumbers(_ userNumbers: [Int], with computerNumbers: [Int]) -> (Int, Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    print("임의의 수 : ", terminator: "")
    userNumbers.forEach{print("\($0)", terminator: " ")}
    
    (0..<computerNumbers.count).forEach{ index in
        guard computerNumbers[index] != userNumbers[index] else {
            strikeCount += 1
            return
        }
        guard !computerNumbers.contains(userNumbers[index]) else {
            ballCount += 1
            return
        }
    }
    return (strikeCount, ballCount)
}
enum BaseBallGameError : Error {
    case invalidFunction
    case invalidInput
}

func gameStart() throws {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    
    let inputMenu: String? = readLine()
    guard let menu = inputMenu, let menu = Int(menu), (1...2) ~= menu else {
        throw BaseBallGameError.invalidFunction
    }
    if menu == 1 {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
        print("중복 숫자는 허용하지 않습니다.")
        print("입력 : ", terminator: "")
        let input: String? = readLine()
        guard let inputNumbers = input else {
            throw BaseBallGameError.invalidInput
        }
        let inputNumbersArray = inputNumbers.split(separator: " ").compactMap{ Int($0) }
        
        guard inputNumbersArray.count == 3  else {
            throw BaseBallGameError.invalidInput
        }
        
        guard inputNumbersArray[0] != inputNumbersArray[1],
              inputNumbersArray[0] != inputNumbersArray[2],
              inputNumbersArray[1] != inputNumbersArray[2] else {
            throw BaseBallGameError.invalidInput
        }
    }
}
do {
    try gameStart()
} catch BaseBallGameError.invalidFunction {
    print("입력이 잘못되었습니다")
} catch BaseBallGameError.invalidInput {
    print("입력이 잘못되었습니다")
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
}

