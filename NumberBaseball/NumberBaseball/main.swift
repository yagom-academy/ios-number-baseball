//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum NumberBaseballGameError: Error {
    case readLineIsNil
    case invalidUserInput
}

var programIsRunning = true
var targetNumbers: [Int] = []
var tryCount = 9
var isUserWin = false
let numbersCount = 3
let posiableNumberRange = 1...9

func initGameVariables() {
    targetNumbers = createRandomNumbers()
    isUserWin = false
    tryCount = 9
    programIsRunning = true
}

func playNumberBaseballGame() {
    initGameVariables()
    
    while tryCount > 0 && isUserWin == false {
        do {
            let strikeCount = try playRound()
            isUserWin = isUserWin(with: strikeCount)
            
            printTryCount()
        } catch NumberBaseballGameError.readLineIsNil {
            printInvalidInput()
            continue
        } catch NumberBaseballGameError.invalidUserInput {
            printInvalidInput()
            continue
        } catch {
            print(error)
        }
    }
    
    printWinner()
}

func playRound() throws -> Int {
    var score: (strike: Int, ball: Int) = (0, 0)
    
    do {
        let randomNumbers = try receiveUserNumbers()
        score = compare(randomNumbers, with: targetNumbers)
        printStrikeAndBall(score: score)
    } catch NumberBaseballGameError.readLineIsNil {
        throw NumberBaseballGameError.readLineIsNil
    } catch NumberBaseballGameError.invalidUserInput {
        throw NumberBaseballGameError.invalidUserInput
    } catch {
        print(error)
    }
    
    return score.strike
}

func receiveUserNumbers() throws -> [Int] {
    printUserInput()
    
    guard let input = readLine() else {
        throw NumberBaseballGameError.readLineIsNil
    }
    
    let inputSplited = input.components(separatedBy: " ").filter { $0 != "" }
    let userNumbers = inputSplited.compactMap { Int($0) }
        
    do {
        try validateNumbersCount(by: inputSplited)
        try validateNumbersCount(by: userNumbers)
        try validateOverlapCount(by: userNumbers)
        try validateNumberRange(in: userNumbers)
    } catch NumberBaseballGameError.invalidUserInput {
        throw NumberBaseballGameError.invalidUserInput
    } catch {
        print(error)
    }
    
    return userNumbers
}

func validateNumbersCount(by array: [Any]) throws {
    if array.count != numbersCount {
        throw NumberBaseballGameError.invalidUserInput
    }
}

func validateOverlapCount(by array: [Int]) throws {
    let removedOverlapSet = Set(array)
    if removedOverlapSet.count != numbersCount {
        throw NumberBaseballGameError.invalidUserInput
    }
}

func validateNumberRange(in numbers: [Int]) throws {
    if numbers.filter({ posiableNumberRange.contains( $0 ) }).count != numbersCount {
        throw NumberBaseballGameError.invalidUserInput
    }
}

func createRandomNumbers(range: ClosedRange<Int> = posiableNumberRange) -> [Int] {
    var resultNumbers: Set<Int> = []
    
    repeat {
        let randomNumber: Int = Int.random(in: range)
        resultNumbers.insert(randomNumber)
    } while resultNumbers.count < numbersCount
    
    return resultNumbers.shuffled()
}

func printUserInput() {
    let userInputSentence = """
    숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
    중복 숫자는 허용하지 않습니다.
    입력 :
    """
    print(userInputSentence, terminator: " ")
}

func compare(_ randomNumbers: [Int], with targetNumbers: [Int]) -> (strike: Int, ball: Int) {
    var score: (strike: Int, ball: Int) = (0, 0)
    
    for i in randomNumbers.indices {
        if randomNumbers[i] == targetNumbers[i] {
            score.strike += 1
        } else if targetNumbers.contains(randomNumbers[i]) {
            score.ball += 1
        }
    }
    
    return score
}

func printStrikeAndBall(score: (strike: Int, ball: Int)) {
    print("\(score.strike) 스트라이크, \(score.ball) 볼")
}

func printWinner() {
    if isUserWin {
        print("사용자 승리!")
    } else {
        print("컴퓨터 승리...!")
    }
}

func printTryCount() {
    if isUserWin == false {
        tryCount = tryCount - 1
        print("남은 기회 : \(tryCount)")
    }
}

func isUserWin(with strikeCount: Int) -> Bool {
    return strikeCount == numbersCount
}

func managementGame() {
    while programIsRunning {
        printMenu()
        
        do {
            try receiveMenuInput()
        } catch NumberBaseballGameError.readLineIsNil {
            printInvalidInput()
            continue
        } catch NumberBaseballGameError.invalidUserInput {
            printInvalidInput()
            continue
        } catch {
            print(error)
        }
    }
}

func printMenu() {
    let menuSentence = """
    1. 게임 시작
    2. 게임 종료
    원하는 기능을 선택해주세요 :
    """
    print(menuSentence, terminator: " ")
}

func receiveMenuInput() throws {
    guard let input = readLine() else {
        throw NumberBaseballGameError.readLineIsNil
    }
    
    switch input {
    case "1":
        playNumberBaseballGame()
    case "2":
        programIsRunning = false
        return
    default :
        throw NumberBaseballGameError.invalidUserInput
    }
}

func printInvalidInput() {
    print("입력이 잘못되었습니다.")
}

managementGame()
