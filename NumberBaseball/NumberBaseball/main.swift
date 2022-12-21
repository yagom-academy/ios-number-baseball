//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let numbers = Array(1...9)
let initialNumbers = makeRandomNumbers()

enum inputError : Error {
    case notOnlyNumber
    case wordSpacing
    case outOfRange
    case sameNumber
    case numberOfInput
}

func makeRandomNumbers() -> [Int] {
    var resultNumbers: Set<Int> = []

    while resultNumbers.count < 3 {
        guard let randomElement = numbers.randomElement() else {
            continue
        }
        resultNumbers.insert(randomElement)
    }
    return Array(resultNumbers)
}

func playGame() {
    var leftChances = 9
    var inputNumbers : [Int] = []
    var result : [Int] = []

    while leftChances > 0 {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
        print("중복 숫자는 허용하지 않습니다.")
        print("입력 : ", terminator: " ")
        
        let inputData = readLine()
        inputNumbers = checkAvailability(inputData: inputData)
        guard inputNumbers.isEmpty == false else {
            continue
        }
        
        result = checkStrikeBall(numbers: inputNumbers)
        
        let strike = result[0]
        let ball = result[1]
        
        if strike == 3 {
            print("사용자 승리!")
            return
        }
        
        leftChances -= 1
        
        print("\(strike) 스트라이크, \(ball) 볼")
        print("남은 기회 : \(leftChances)")
        print(" ")
    }
    print("컴퓨터의 승리입니다.")
}

func checkStrikeBall(numbers: [Int]) -> [Int] {
    var strike = 0
    var ball = 0
    
    for index in 0...2 {
        if initialNumbers[index] == numbers[index] {
            strike += 1
        } else if initialNumbers.contains(numbers[index]) {
            ball += 1
        }
    }
    return [strike,ball]
}

func checkAvailability(inputData: String?) -> [Int] {
    
    guard let inputData = inputData?.split(separator: " ") else {
        print("입력 형식이 잘못 되었습니다! 띄어쓰기를 준수해 주세요.")
        return []
    }
    
    let numberPattern = "^([1-9])$"
    for data in inputData {
        guard let _ = data.range(of: numberPattern, options: .regularExpression) else {
            print("입력 형식이 잘못 되었습니다! 숫자만 입력해 주세요.")
            return[]
        }
    }
    
    guard inputData.count == 3 else {
        print("입력 갯수가 잘못 되었습니다!")
        return []
    }
    
    let inputNumbers = inputData.compactMap { str in Int(str) }
    
    for number in inputNumbers {
        guard number > 0 && number < 10 else {
            print("범위를 벗어 났습니다!")
            return []
        }
    }
    
    guard Set(inputNumbers).count == 3 else {
        print("중복된 숫자가 있습니다!")
        return []
    }
    return inputNumbers
}

func menuPrint() {
    while true {
        print("1. 게임시작")
        print("2. 게임종료")
        print("원하는 기능을 선택해주세요 : ", terminator: " ")
        guard let inputData = readLine() else {
            print("입력이 잘못되었습니다")
            continue
        }
        
        switch inputData {
        case "1" :
            playGame()
        case "2" :
            print("게임을 종료합니다")
            return
        default :
            print("입력이 잘못되었습니다")
            continue
        }
    }
}

menuPrint()
