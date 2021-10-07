//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

var randomNumbers: [Int] = []
var remainChances: Int = 9
let numbersCount: Int = 3
let numberRange: ClosedRange<Int> = 1...9

func generateRandomNumbers(count: Int) -> [Int] {
    var numbers: Set<Int> = []
    
    while numbers.count < count {
        let randomNumber:Int = Int.random(in: numberRange)
        
        numbers.insert(randomNumber)
    }
    
    return Array(numbers)
}

func checkTheResult(for inputNumbers: [Int]) -> (Int, Int) {
    var sameNumberCount:Int = 0
    var strikeCount:Int = 0
    
    for inputNumber in inputNumbers {
        if randomNumbers.contains(inputNumber) {
            sameNumberCount += 1
        }
    }
    
    for index in 0...2 {
        if randomNumbers[index] == inputNumbers[index] {
            strikeCount += 1
        }
    }

    return (strikeCount, sameNumberCount - strikeCount)
}

func gameStart() {
    randomNumbers = generateRandomNumbers(count: numbersCount)
    
    while remainChances > 0 {
        let playNumbers: [Int] = generateRandomNumbers(count: numbersCount)
        print("임의의 수 : \(playNumbers.map{ String($0) }.joined(separator: " "))")
        let (strikeCount, ballCount) = checkTheResult(for: playNumbers)
        
        if strikeCount == numbersCount {
            break
        }
        
        remainChances -= 1
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        print("남은 기회 : \(remainChances)")
    }
    
    if remainChances == 0 {
        print("컴퓨터 승리...")
    } else {
        print("사용자 승리...")
    }
}

gameStart()
