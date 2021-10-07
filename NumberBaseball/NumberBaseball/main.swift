//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 
import Foundation

var randomNumbers: [Int] = []
var remainingChance: Int = 9
let numbersCount: Int = 3
let inputNumberRange: ClosedRange<Int> = 1...9

func generateRandomNumbers(count: Int) -> [Int] {
    var numbers: Set<Int> = []
    
    while numbers.count < count {
        let randomNumber: Int = Int.random(in: inputNumberRange)
        
        numbers.insert(randomNumber)
    }
    
    return Array(numbers)
}

func checkPlayResult(for inputNumbers: [Int]) -> (strikeCount: Int, ballCount: Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    for index in 0..<numbersCount{
        let isStrike: Bool = randomNumbers[index] == inputNumbers[index]
        let isBall: Bool = randomNumbers.contains(inputNumbers[index])
        
        if isStrike {
            strikeCount += 1
        } else if isBall {
            ballCount += 1
        }
    }
    
    return (strikeCount, ballCount)
}

func isNumber(numbers: [String]) -> [Int]? {
    var result: [Int] = []

    for number in numbers {
        guard let number = Int(number) else {
            return nil
        }

        if inputNumberRange.contains(number) == false {
            return nil
        }

        result.append(number)
    }
    return result
}

func getInputNumbers(count: Int) -> [Int]? {
    print("임의의 수 : ", terminator: "")
    
    guard let inputNumber: String = readLine() else {
        print("입력이 잘못되었습니다")
        return nil
    }
    
    let separatedNumbers: [String] = inputNumber.trimmingCharacters(in: .whitespaces).components(separatedBy: " ")
    
    guard let numbers: [Int] = isNumber(numbers: separatedNumbers),
            numbers.count == count,
            Set(numbers).count == count else {
        print("입력이 잘못되었습니다")
        return nil
    }

    return numbers
}

// MARK: Game playing
func startGame() {
    while true {
        print("1. 게임시작")
        print("2. 게임종료")
        print("원하는 기능을 선택해주세요 : ", terminator: "")
        
        guard let input: String = readLine() else {
            print("입력이 잘못되었습니다.")
            continue
        }
        
        if input == "1" {
            break
        } else if input == "2" {
            return
        } else {
            print("입력이 잘못되었습니다.")
            continue
        }
    }
    
    randomNumbers = generateRandomNumbers(count: numbersCount)
    
    while remainingChance > 0 {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
        print("중복 숫자는 허용하지 않습니다.")
        
        guard let playNumbers: [Int] = getInputNumbers(count: numbersCount) else {
            continue
        }
        let playResult = checkPlayResult(for: playNumbers)
        
        if playResult.strikeCount == numbersCount {
            break
        }
        
        remainingChance -= 1
        print("\(playResult.strikeCount) 스트라이크, \(playResult.ballCount) 볼")
        print("남은 기회 : \(remainingChance)")
    }
    
    printWin()
}

func printWin() {
    if remainingChance == 0 {
        print("컴퓨터 승리...")
    } else {
        print("사용자 승리...")
    }
}


// MARK: Game start
startGame()
