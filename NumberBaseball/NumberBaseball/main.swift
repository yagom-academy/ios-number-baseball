//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//


/* Step 1
 임의의 정수를 담아둘 3개의 변수 생성
 남은 시도횟수를 담아둘 변수 생성 (초기값 9)
 func generateRandomNumber() -> Set[Int] {임의의 수 생성}
 func giveGameResult() {정수 비교, 스트라이크, 볼 결과 반환}
 func startGame() {}
 */

/* Step 2
 func selectMenu() {1.게임시작 2.게임종료}
 func inputNumber() {}
 비교 기능 구현
 중복성 검증, 1~9까지 수만 유효
 */
import Foundation

let inputNumbers = generateRandomThreeNumbers()
let keyNumbers = generateRandomThreeNumbers()

func runNumberGame() {
    var remainNumber = 9
    
    while remainNumber > 0 {
        remainNumber -= 1
    }
}

func generateRandomThreeNumbers() -> [Int] {
    var randomNumbers = [Int]()
    
    while randomNumbers.count >= 3 {
        let randomNumber = Int.random(in: 1...9)
        if randomNumbers.contains(randomNumber) == false {
            randomNumbers.append(randomNumber)
        }
    }
    return randomNumbers
}

func giveGameResult() -> (Int, Int) {
    var numStrike = 0
    var numBall = 0
    
    for idx in 0..<inputNumbers.count {
        if inputNumbers[idx] == keyNumbers[idx] {
            numStrike += 1
        } else if keyNumbers.contains(inputNumbers[idx]) {
            numBall += 1
        }
    }
    
    return (numStrike, numBall)
}
