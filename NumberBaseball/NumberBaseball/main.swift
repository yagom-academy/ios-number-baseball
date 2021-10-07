//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum NumberGameError: String {
    case readLineMalfunction = "시스템(readLine) 에러가 발생하였습니다."
    case abnormalUserInput = "입력이 잘못되었습니다."
    case typeConversionFailure = "타입 변환에 실패하였습니다."
}

func selectMenu(quitFlag: inout Bool) {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요", terminator: " : ")
    
    guard let selectedMenu = readLine() else {
        print(NumberGameError.readLineMalfunction.rawValue)
        return
    }
    
    switch selectedMenu {
    case "1":
        startGame()
    case "2":
        quitFlag = true
    default:
        print(NumberGameError.abnormalUserInput.rawValue)
    }
}

func runNumberGame() {
    var quitFlag = false
    while quitFlag == false {
        selectMenu(quitFlag: &quitFlag)
    }
}

func startGame() {
    var lifeCount = 9
    let generatedCorrectNumbers = generatedThreeRandomNumbers()
    var threeStrikeFlag = false

    while lifeCount > 0 && threeStrikeFlag != true {
        printInputGuideLine()
        tryThreeStrike(generatedCorrectNumbers: generatedCorrectNumbers, lifeCount: &lifeCount, threeStrikeFlag: &threeStrikeFlag)
    }
    printWinner(threeStrikeFlag: threeStrikeFlag)
}

func receivedUserInput() -> String {
    if let userInput = readLine() {
        return userInput.replacingOccurrences(of: " ", with: "")
    } else {
        print(NumberGameError.readLineMalfunction.rawValue)
        return ""
    }
}

func tryThreeStrike(generatedCorrectNumbers: [Int], lifeCount: inout Int, threeStrikeFlag: inout Bool) {
    let userInput = receivedUserInput()
    
    if isValidInput(userInput: userInput) == true {
        lifeCount -= 1
        
        let userTryNumbers = convertToThreeNumbers(from: userInput)
        
        let (strikeCount, ballCount) = computedStrikeCountAndBallCount(generatedCorrectNumbers: generatedCorrectNumbers, userTryNumbers: userTryNumbers)
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        
        threeStrikeFlag = isThreeStrike(strikeCount: strikeCount)
        
        printLifeCount(lifeCount: lifeCount, threeStrikeFlag: threeStrikeFlag)
    } else {
        print(NumberGameError.abnormalUserInput.rawValue)
    }
}

func printInputGuideLine() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력", terminator: " : ")
}

func convertToThreeNumbers(from userInput: String) -> [Int] {
    var convertedUserInput = [Int]()
    for character in userInput {
        convertToIntegerAndAppend(character: character, integerArray: &convertedUserInput)
    }
    return convertedUserInput
}

func convertToIntegerAndAppend(character: Character, integerArray: inout [Int]) {
    guard let convertedInteger = Int(String(character)) else {
        print(NumberGameError.typeConversionFailure.rawValue)
        return
    }
    integerArray.append(convertedInteger)
}

func isValidInput(userInput: String) -> Bool {
    if userInput.count == 3 && isInteger(userInput: userInput) && isNotDuplicated(userInput: userInput) && isNotZero(userInput: userInput) {
        return true
    } else {
        return false
    }
}

func isNotZero(userInput: String) -> Bool {
    var notZeroFlag: Bool = true
    for character in userInput where notZeroFlag == true {
        notZeroFlag = character != "0" ? true : false
    }
    return notZeroFlag
}

func isNotDuplicated(userInput: String) -> Bool {
    var userInputArray = [Int]()
    for character in userInput {
        convertToIntegerAndAppend(character: character, integerArray: &userInputArray)
    }

    let userInputSet = Set(userInputArray)

    if userInputArray.count == userInputSet.count {
        return true
    } else {
        return false
    }
}

func isInteger(userInput: String) -> Bool {
    var integerFlag: Bool = true
    for character in userInput where integerFlag == true {
        integerFlag = Int(String(character)) != nil ? true : false
    }
    return integerFlag
}

func printWinner(threeStrikeFlag: Bool) {
    if threeStrikeFlag == true {
        print("사용자 승리...!")
    } else {
        print("컴퓨터 승리...!")
    }
}

func printLifeCount(lifeCount: Int, threeStrikeFlag: Bool) {
    if threeStrikeFlag == true {
        return
    } else {
        print("남은 기회: \(lifeCount)")
    }
}

func isThreeStrike(strikeCount: Int) -> Bool {
    if strikeCount == 3 {
        return true
    } else {
        return false
    }
}

func generatedThreeRandomNumbers() -> [Int] {
    var randomNumbers: [Int]
    var deduplicatedNumbers: Set<Int>
    
    repeat {
        randomNumbers = [Int.random(in: 1...9), Int.random(in: 1...9), Int.random(in: 1...9)]
        deduplicatedNumbers = Set(randomNumbers)
    } while randomNumbers.count != deduplicatedNumbers.count
    
    return randomNumbers
}

func computedStrikeCountAndBallCount(generatedCorrectNumbers: [Int], userTryNumbers: [Int]) -> (Int, Int) {
    var strikeCount = 0
    var ballCount = 0
    
    for index in 0..<userTryNumbers.count {
        increaseStrikeCountOrBallCount(generatedCorrectNumbers: generatedCorrectNumbers,
                                       userTryNumbers: userTryNumbers,
                                       index: index,
                                       strikeCount: &strikeCount,
                                       ballCount: &ballCount)
    }
    return (strikeCount, ballCount)
}

func increaseStrikeCountOrBallCount(generatedCorrectNumbers: [Int], userTryNumbers: [Int], index: Int, strikeCount: inout Int, ballCount: inout Int) {
    if generatedCorrectNumbers[index] == userTryNumbers[index] {
        strikeCount += 1
    } else if generatedCorrectNumbers.contains(userTryNumbers[index]) {
        ballCount += 1
    }
}

runNumberGame()
