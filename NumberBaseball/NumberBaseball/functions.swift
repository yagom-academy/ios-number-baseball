//
//  Functions.swift
//  NumberBaseball
//
//  Created by 유제민 on 2022/08/19.
//

import Foundation

func compareWithComputerNumbers(from userNumbers: [Int]) -> (Int, Int) {
    var strike = 0
    var ball = 0
    for index in 0...2 {
        if computerNumbers[index] == userNumbers[index] {
            strike += 1
        } else if userNumbers.contains(computerNumbers[index]) {
            ball += 1
        }
    }
    return (strike, ball)
}

func generateRandomNumbers() -> [Int] {
    var remainingNumbers = Array(1...9)
    var randomNumbers: [Int] = []
    while randomNumbers.count < 3 {
        let number = Int(arc4random_uniform(UInt32(remainingNumbers.count)))
        let selectedNumber = remainingNumbers[number]
        if selectedNumber != 0 {
            randomNumbers.append(selectedNumber)
        }
        remainingNumbers[number] = 0
    }
    return randomNumbers
}

func validateUserNumbers(userNumbers: [Int]) {
    for userNumber in userNumbers {
        guard (1...9).contains(userNumber) else {
            print("""
            숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
            중복 숫자는 허용하지 않습니다.
            """)
            getUserNumbers()
            return
        }
    }
    if Set(userNumbers).count == 3 {
        return
    } else {
        print("""
        숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
        중복 숫자는 허용하지 않습니다.
        """)
        getUserNumbers()
    }
}

func getUserNumbers() -> [Int] {
    print("입력 : ", terminator: "")
    guard let input = readLine() else { return [] }
    let userNumbers = input.split(separator: " ").compactMap({ Int($0)})
    validateUserNumbers(userNumbers: userNumbers)
    return userNumbers
}
