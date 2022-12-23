//
//  choiceMenuFUnction.swift
//  NumberBaseball
//
//  Created by 천승현 on 2022/12/23.
//

import Foundation

func checkUserInput() -> Result<[String], BaseBallGameError> {
    printGameRule()
    let input: String? = readLine()
    guard let inputNumbers = input else {
        return .failure(BaseBallGameError.invalidInput)
    }
    
    let separatedArray = inputNumbers.split(separator: " ").map{ String($0) }
    
    guard isAllNumber(inputArray: separatedArray),
          isThreeCount(array: separatedArray),
          hasDuplicateNumber(numbers: separatedArray),
          isNumberFromOneToNine(numbers: separatedArray) else {
        return .failure(BaseBallGameError.invalidInput)
    }
    return .success(separatedArray)
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

func arrangeGame() {
    while leftCount != 0, !isUserWin {
        pressNumberOne()
    }
    printWinner()
}

func pressNumberOne() {
    let validThreeNumbersResult = checkUserInput()
    switch validThreeNumbersResult {
    case .success(let numbers):
        checkGameResult(userNumbers: numbers)
    case .failure(_):
        print("입력이 잘못되었습니다")
    }
}

func pressNumberTwo() {
    isGameEnd = true
}

func printMenu() {
    print("""
          1. 게임시작
          2. 게임종료
          원하는 기능을 선택해주세요 :
          """, terminator:" ")
}

func printGameRule() {
    print("""
         숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
         중복 숫자는 허용하지 않습니다.
         입력 :
         """, terminator: " ")
}

func printWinner() {
    if isUserWin {
        print("사용자 승리!")
    } else if leftCount == 0 {
        print("컴퓨터 승리...!")
    }
}
