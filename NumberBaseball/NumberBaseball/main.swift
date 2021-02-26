//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: [Int] = []    // 임의의 정수 3개를 담아둘 변수
var attemptCount: Int = 9   // 남은 시도횟수를 담아둘 변수

// 1~9 사이의 세 개의 임의의 정수를 생성하여 반환하는 함수
func makeRandomNumber() -> [Int] {
    var randomNumber: Set<Int> = []
    
    while randomNumber.count != 3 {
        randomNumber.insert(Int.random(in: 1...9))
    }
    
    return Array(randomNumber)
}

// 예상하는 숫자 3개를 전달받아 맞춰야하는 숫자 3개와 비교하여 스트라이크와 볼을 반환하는 함수
func compareNumber(_ userNumbers: [Int]) -> (strikeNumber: Int, ballNumber: Int) {
    var strikeNumber = 0
    var ballNumber = 0
    
    for index in 0...2 {
        if (computerNumbers[index] == userNumbers[index]) {
            strikeNumber += 1
        } else if (computerNumbers.contains(userNumbers[index])) {
            ballNumber += 1
        }
    }
    print("임의의 수: \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
    
    return (strikeNumber, ballNumber)
}

// 게임시작 함수
func startGame() {
    computerNumbers = makeRandomNumber()
    
    print("\(computerNumbers[0]), \(computerNumbers[1]), \(computerNumbers[2])")
    
    for _ in 1...attemptCount {
        let result = compareNumber(makeRandomNumber())
        attemptCount -= 1

        if (result.strikeNumber == 3){
            print("사용자 승리...!")
            break
        } else if (attemptCount == 0) {
            print("컴퓨터 승리...!")
        }
        
        print("\(result.strikeNumber) 스트라이크, \(result.ballNumber) 볼")
        print("남은 기회: \(attemptCount)")
    }
}

startGame()
