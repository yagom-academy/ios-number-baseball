//
//  NumberBaseball - main.swift
//  Created by BaekGom,barrd.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

var repeatCheck = true
let countNumber = 3
let randomNumberRange = 1...9
let arrayExtent = 0...2
let gameOverStrikeCount = 3
let gameOverTryCount = 0

func printMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
}

func selectMenu() {
    printMenu()
    let userSelectMenu = readLine()?.trimmingCharacters(in: .whitespaces)
    
    if userSelectMenu == "1" {
        repeatCheck = true
        gameStart()
        selectMenu()
    }
    else if userSelectMenu == "2" {
        
    } else {
        print("입력이 잘못되었습니다")
        selectMenu()
    }
}

func printGameRule() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
}

func userInputNumbers() -> String {
    printGameRule()
    let userInput = readLine()?.trimmingCharacters(in: .whitespaces) ?? ""
    
    if isValidate(inputNumbers: userInput) {
        return userInput
    } else{
        print("입력이 잘못되었습니다")
        return userInputNumbers()
    }
}

func isNumbersCountThree(numbers: String) -> Bool {
    return numbers.filter({$0.isNumber }).count != 3
}

func validateOverlappingNumbers(numbers: String) -> Bool {
    return Set(numbers).count != 4
}

func isZeroInNumbers(numbers: String) -> Bool {
    return numbers.contains("0")
}

func isValidate(inputNumbers: String) -> Bool {
    if  isNumbersCountThree(numbers: inputNumbers) || validateOverlappingNumbers(numbers: inputNumbers) || isZeroInNumbers(numbers: inputNumbers) {
        return false
    } else{
        return true
    }
}

func threeNonOverlappingRandomNumbers() -> Set<Int> {
    var randomNumbers = Set<Int>()
    
    while randomNumbers.count < countNumber {
        randomNumbers.insert(Int.random(in: randomNumberRange))
    }
    return randomNumbers
}

func countStrikeOrBall(computerNumbers: [Int], tryCount: Int, userSuggestNumbers: String) -> (Int, Int) {
    let splitedUserSuggestNumbers = userSuggestNumbers.components(separatedBy: " ")
    let splitedUserSuggestThreeNumbers = splitedUserSuggestNumbers.map({(numbers: String) -> Int in return Int(numbers) ?? 0})
    var strikeCount = 0
    var ballCount = 0
    
    for index in arrayExtent {
        if computerNumbers[index] == splitedUserSuggestThreeNumbers[index] {
            strikeCount += 1
        } else if splitedUserSuggestThreeNumbers.contains(computerNumbers[index]) {
            ballCount += 1
        }
    }
    
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    print("남은기회 : \(tryCount)")
    return (strikeCount, tryCount)
}

func gameStart() {
    let randomNumberGeneratedByComputer = [Int](threeNonOverlappingRandomNumbers())
    var tryCount = 9
    
    while repeatCheck {
        tryCount -= 1
        let strikeTryCount = countStrikeOrBall(computerNumbers: randomNumberGeneratedByComputer, tryCount: tryCount, userSuggestNumbers: userInputNumbers())
        checkGameOver(strikeTryCount: strikeTryCount)
    }
}

func checkGameOver(strikeTryCount: (Int, Int)) {
    if strikeTryCount.0 == gameOverStrikeCount || strikeTryCount.1 == gameOverTryCount {
        repeatCheck = false
    }
    
    if strikeTryCount.0 == gameOverStrikeCount {
        print("사용자 승리…!")
    } else if strikeTryCount.1 == gameOverTryCount {
        print("컴퓨터 승리…!")
    }
}
 
selectMenu()



