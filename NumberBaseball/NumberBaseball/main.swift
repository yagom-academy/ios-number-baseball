//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var computerNumbers: [Int] = makeThreeNumbers()
var userNumbers: [Int] = []
var leftCount: Int = 9
var isUserWin: Bool = false
var isGameEnd: Bool = false

func checkGameResult(userNumbers: [String]) {
    let userRandomNumbers = userNumbers.compactMap{ Int($0) }
    var strikeCount: Int = 0
    var ballCount: Int = 0
    (strikeCount, ballCount) = compareNumbers(userRandomNumbers, with: computerNumbers)
    leftCount -= 1
    print("\n\(strikeCount) 스트라이크, \(ballCount) 볼")
    if leftCount != 0 {
        print("남은 기회 : \(leftCount)")
    }
    if strikeCount == 3 {
        isUserWin = true
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

func checkUserInput() throws {
    while leftCount != 0, !isUserWin {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
        print("중복 숫자는 허용하지 않습니다.")
        print("입력 : ", terminator: "")
        let input: String? = readLine()
        guard let inputNumbers = input else {
            throw BaseBallGameError.invalidInput
        }
        
        let separatedArray = inputNumbers.split(separator: " ").map{ String($0) }
        
        guard isAllNumber(inputArray: separatedArray),
              isThreeCount(array: separatedArray),
              hasDuplicateNumber(numbers: separatedArray),
              isNumberFromOneToNine(numbers: separatedArray) else {
            throw BaseBallGameError.invalidInput
        }
        
        checkGameResult(userNumbers: separatedArray)
        if isUserWin {
            print("사용자 승리!")
        } else if leftCount == 0 {
            print("컴퓨터 승리...!")
        }
    }
}

func choiceGameMenu() -> Result<Int, BaseBallGameError> {
    let input: String? = readLine()
    guard let menu = input else {
        return .failure(BaseBallGameError.invalidFunction)
    }
    let trimmedMenu = menu.trimmingCharacters(in: .whitespaces)
    guard let gameMenu = Int(trimmedMenu), (1...2) ~= gameMenu else {
        return .failure(BaseBallGameError.invalidFunction)
    }
    return .success(gameMenu)
}

func playBaseBallGame() {
    while !isGameEnd {
        initializeGame()
        printMenu()
        let gameMenuResult = choiceGameMenu()
        switch gameMenuResult {
        case .success(let menu):
            menu == 1 ? pressNumberOne() : pressNumberTwo()
        case .failure(let failure):
            print("입력이 잘못되었습니다")
        }
    } 
}

func pressNumberOne() {
    while leftCount != 0, !isUserWin {
        do {
            try checkUserInput()
        } catch BaseBallGameError.invalidInput {
            print("입력이 잘못되었습니다")
        } catch {
            print(error)
        }
    }
}

func pressNumberTwo() {
    isGameEnd = true
}

playBaseBallGame()


