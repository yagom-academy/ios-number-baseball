//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 컴퓨터가 제시할 임의의정수 3개
var computerNumbers: [Int] = []
var userNumbers: [Int] = []
// 남은 시도횟수를 담아둘 변수
var tryNumber: Int = 0
var ballCount : Int = 0
var strikeCount : Int = 0

// 1-9사이의 세개의 임의의 정수를 생성하여 반환하는 함수
// 중복X
func generateThreeRandomNumbers() -> [Int] {
    var numbers: Set<Int> = []
    
    while numbers.count < 3 {
        let num = Int.random(in: 1...9)
        numbers.update(with: num)
    }
    
    return Array(numbers)
}

computerNumbers = generateThreeRandomNumbers()
userNumbers = generateThreeRandomNumbers()

func foundBall() -> Int {
    let pairNumbers = zip(userNumbers, computerNumbers)
    
    for pairNumber in pairNumbers {
        if computerNumbers.contains(pairNumber.0) && pairNumber.0 != pairNumber.1 {
            ballCount += 1
        }
    }
    
    return ballCount
}

func foundStrike() -> Int {
    let pairNumbers = zip(userNumbers, computerNumbers)

    for pairNumber in pairNumbers {
        if pairNumber.0 == pairNumber.1 {
            strikeCount += 1
        }
    }
    
    return strikeCount
    
//    if computerNumbers[0] == userNumbers[0] {
//        strikeCount += 1
//    }
//    if computerNumbers[0] == userNumbers[1] {
//        ballCount += 1
//    }
//    if computerNumbers[0] == userNumbers[2] {
//        ballCount += 1
//    }
//
//    if computerNumbers[1] == userNumbers[0] {
//        ballCount += 1
//    }
//    if computerNumbers[1] == userNumbers[1] {
//        strikeCount += 1
//    }
//    if computerNumbers[1] == userNumbers[2] {
//        ballCount += 1
//    }
//
//    if computerNumbers[2] == userNumbers[0] {
//        ballCount += 1
//    }
//    if computerNumbers[2] == userNumbers[1] {
//        ballCount += 1
//    }
//    if computerNumbers[2] == userNumbers[2] {
//        strikeCount += 1
//    }
}

foundStrike()
foundBall()
print(computerNumbers)
print(userNumbers)
print("볼카운트",ballCount)
print(strikeCount)
