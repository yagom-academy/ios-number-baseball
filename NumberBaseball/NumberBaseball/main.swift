//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

var randomNumbers: [Int] = []
var remainingChance: Int = 9
let numbersCount: Int = 3
let numberRange: ClosedRange<Int> = 1...9

func generateRandomNumbers(count: Int) -> [Int] {
    var numbers: Set<Int> = []
    
    while numbers.count < count {
        let randomNumber: Int = Int.random(in: numberRange)
        
        numbers.insert(randomNumber)
    }
    
    return Array(numbers)
}

func checkTheResult(for inputNumbers: [Int]) -> (strikeCount: Int, ballCount: Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    for index in 0..<numbersCount{
        if randomNumbers[index] == inputNumbers[index] {
            strikeCount += 1
        } else if randomNumbers.contains(inputNumbers[index]) {
            ballCount += 1
        }
    }
    
    return (strikeCount, ballCount)
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
        let playNumbers: [Int] = generateRandomNumbers(count: numbersCount)
        let playNumbersForPrint: String = playNumbers.map { String($0) }.joined(separator: " ")
        let result = checkTheResult(for: playNumbers)
        print("임의의 수 : \(playNumbersForPrint)")
        
        if result.strikeCount == numbersCount {
            break
        }
        
        remainingChance -= 1
        print("\(result.strikeCount) 스트라이크, \(result.ballCount) 볼")
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
