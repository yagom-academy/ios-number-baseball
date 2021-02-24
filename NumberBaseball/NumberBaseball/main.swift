//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var correctNum: [Int] = []    // 임의의 정수 3개를 담아둘 변수
var attemptCount: Int = 9   // 남은 시도횟수를 담아둘 변수

// 1~9 사이의 세 개의 임의의 정수를 생성하여 반환하는 함수
func makeThreeRandomNum() -> [Int] {
    
    var randomNum = [Int](repeating: 0, count: 3)
    
    repeat {
        for index in 0...2 {
            randomNum[index] = Int.random(in: 1...9)
        }
    } while randomNum[0] == randomNum[1] || randomNum[1] == randomNum[2] || randomNum[0] == randomNum[2]
    
    return randomNum
}

// 예상하는 숫자 3개를 전달받아 맞춰야하는 숫자 3개와 비교하여 스트라이크와 볼을 반환하는 함수
func compareNum(_ guessNum: [Int]) -> (strikeNum: Int, ballNum: Int) {
    var strikeNum = 0
    var ballNum = 0
    
    for index in 0...2 {
        if (correctNum[index] == guessNum[index]) {
            strikeNum += 1
        } else if (correctNum.contains(guessNum[index])) {
            ballNum += 1
        }
    }
    print("임의의 수: \(guessNum[0]) \(guessNum[1]) \(guessNum[2])")
    
    return (strikeNum,ballNum)
}

// 게임시작 함수
func startGame() {
    correctNum = makeThreeRandomNum()
    
    while attemptCount != 0 {
        attemptCount -= 1
        let result = compareNum(makeThreeRandomNum())

        if (result.0 == 3){
            print("사용자 승리...!")
            break
        } else if (attemptCount == 0) {
            print("컴퓨터 승리...!")
        }
        
        print("\(result.0) 스트라이크, \(result.1) 볼")
        print("남은 기회: \(attemptCount)")
    }
    return
}

startGame()
