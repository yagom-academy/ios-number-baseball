//
//  NumberBaseball - main.swift
//  Created by redmango & dasanKim.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum InputError: Error {
    case emptyInput
    case wrongInput
    case duplicateNumber
}

func createRandomNumbers() -> [Int] {
    var uniqueRandomNumbers = Set<Int>()
    
    while uniqueRandomNumbers.count < 3 {
        uniqueRandomNumbers.insert(Int.random(in: 1...9))
    }
    return Array(uniqueRandomNumbers)
}

func compare(_ computerRandomNumbers: [Int], and userNumbers: [Int]) -> (strikeCount: Int, ballCount: Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    for index in 0..<computerRandomNumbers.count {
        if computerRandomNumbers[index] == userNumbers[index] {
            strikeCount += 1
        } else if computerRandomNumbers.contains(userNumbers[index]){
            ballCount += 1
        }
    }
    return (strikeCount: strikeCount, ballCount: ballCount)
}

func judgeWinnerBy(_ strikeCount: Int, _ remainingChance: Int, _ winCondition: Int) -> String {
    var winner: String = String()
    
    if strikeCount == winCondition {
        winner = "USER"
    } else if remainingChance == 0 {
        winner = "COMPUTER"
    }
    return winner
}

func selectMenu() {
    var selectNumber: String = ""
    var isGameLoop: Bool = true
    
    while isGameLoop {
        print("""
    1. 게임시작
    2. 게임종료
    원하는 기능을 선택해주세요
    """, terminator: " : ")
        
        do {
            try selectNumber = input()
        } catch InputError.emptyInput {
            print("다시 입력해주세요.")
        } catch {
            print("알 수 없는 오류가 발생했습니다. 다시 입력해주세요.")
        }
        
        switch selectNumber {
        case "1":
            startBaseballGame()
        case "2":
            isGameLoop = false
        default:
            print("입력이 잘못되었습니다.")
        }
    }
}

func input() throws -> String {
    guard let userInput = readLine() else {
        throw InputError.emptyInput
    }
    return userInput
}

func receiveUserInput() throws -> [Int] {
    var userStringInputs = [String]()
    var userIntInputs = [Int]()
    let userInputRegEx = #"^([1-9]{1})\s([1-9]{1})\s([1-9]{1})$"#
    var isValidated: Bool
    
    print("""
    숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
    중복 숫자는 허용하지 않습니다.
    입력
    """, terminator: " : ")
    
    guard let optionalInput = readLine() else {
        throw InputError.emptyInput
    }
    
    isValidated = optionalInput.range(of: userInputRegEx, options: .regularExpression) != nil
    
    if isValidated {
        userStringInputs = optionalInput.split(separator: " ", omittingEmptySubsequences: true).map{ String($0) }
    } else {
        throw InputError.wrongInput
    }
    
    let uniqueUserNumbers: Set<String> = Set(userStringInputs)
    
    if !(userStringInputs.count == uniqueUserNumbers.count) {
        throw InputError.duplicateNumber
    }
    
    for input in userStringInputs {
        userIntInputs.append(Int(input) ?? 0)
    }
    return userIntInputs
}

func startBaseballGame() {
    let computerRandomNumbers: [Int] = createRandomNumbers()
    var userRandomNumbers = [Int]()
    var remainingChance: Int = 9
    
    print(computerRandomNumbers)
    while remainingChance > 0 {
        remainingChance -= 1
        
        do {
            try userRandomNumbers = receiveUserInput()
        } catch InputError.emptyInput {
            print("빈 값입니다.")
        } catch InputError.wrongInput {
            print("입력이 잘못되었습니다.")
        } catch InputError.duplicateNumber {
            print("중복된 숫자가 있습니다.")
        } catch {
            print("알 수 없는 오류가 발생했습니다. 다시 입력해주세요.")
        }
 
        let gameResult: (strikeCount: Int, ballCount: Int) = compare(computerRandomNumbers, and: userRandomNumbers)
        
        print("임의의 수 : \(userRandomNumbers.map{ String($0) }.joined(separator: " "))")
        print("\(gameResult.strikeCount) 스트라이크, \(gameResult.ballCount) 볼")
        
        let winner: String = judgeWinnerBy(gameResult.strikeCount, remainingChance, computerRandomNumbers.count)
        
        if winner.isEmpty {
            print("남은 기회: \(remainingChance)")
        } else {
            print("\(winner) WIN!!")
            break
        }
    }
}

selectMenu()
