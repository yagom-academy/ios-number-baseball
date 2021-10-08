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

var targetNumbers: [Int] = []
var tryCount = 9
var isUserWin = false
let numbersCount = 3
let posiableNumberRange = 1...9

func initGameVariables() {
    targetNumbers = createRandomNumbers()
    isUserWin = false
    tryCount = 9
}

func playNumberBaseballGame() {
    initGameVariables()
    
    while tryCount > 0 && isUserWin == false {
        do {
            let strikeCount = try playRound()
            
            isUserWin = isThreeStrike(count: strikeCount)
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
        let randomNumbers = try readUserNumbers()
        
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

func readUserNumbers() throws -> [Int] {
    printRandomNumbers()
    
    guard let input = readLine() else {
        throw NumberBaseballGameError.readLineIsNil
    }
    
    let inputSplited = input.components(separatedBy: " ")
    let userNumbers = inputSplited.compactMap { Int($0) }
    guard inputSplited.count == numbersCount &&
          userNumbers.count == numbersCount else {
        throw NumberBaseballGameError.invalidUserInput
    }
    
    
    let userNumbersSet = Set(userNumbers)
    guard userNumbersSet.count == numbersCount else {
        throw NumberBaseballGameError.invalidUserInput
    }
    
    guard userNumbers.filter({ posiableNumberRange.contains( $0 ) }).count == userNumbers.count else {
        throw NumberBaseballGameError.invalidUserInput
    }
    
    return userNumbers
}

func createRandomNumbers(range: ClosedRange<Int> = posiableNumberRange) -> [Int] {
    var resultNumbers: Set<Int> = []
    
    repeat {
        let randomNumber: Int = Int.random(in: range)
        resultNumbers.insert(randomNumber)
    } while resultNumbers.count < numbersCount
    
    return resultNumbers.shuffled()
}

func printRandomNumbers() {
    print("입력 : ", terminator: "")
}

func convertIntArrayToString(_ array: [Int]) -> String {
    let resultString: String = array.map { String($0) }.joined(separator: " ")
    
    return resultString
}

func compare(_ randomNumbers: [Int], with targetNumbers: [Int]) -> (strike: Int, ball: Int) {
    var score: (strike: Int, ball: Int) = (0, 0)
    
    for i in randomNumbers.indices {
        if randomNumbers[i] == targetNumbers[i] {
            score.strike += 1
        } else if targetNumbers.contains(randomNumbers[i]) && targetNumbers[i] != randomNumbers[i] {
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

func isThreeStrike(count: Int) -> Bool {
    return count == 3
}

func managementGame() {
    printMenu()
    
    guard let input = readLine() else {
        return
    }
    
    checkMenuInput(input: input)
}

func printMenu() {
    let menuSentence = """
    1. 게임 시작
    2. 게임 종료
    원하는 기능을 선택해주세요 :
    """
    print(menuSentence, terminator: " ")
}

func checkMenuInput(input: String) {
    switch input {
    case "1":
        playNumberBaseballGame()
    case "2":
        return
    default :
        printInvalidInput()
    }
    managementGame()
}

func printInvalidInput() {
    print("입력이 잘못되었습니다.")
}

managementGame()
