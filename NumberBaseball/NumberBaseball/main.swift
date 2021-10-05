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


let keyNumbers = generateRandomThreeNumbers()

func runNumberGame() {
    var remainNumber = 9
    var trialNumbers: [Int]
    
    while true {
        remainNumber -= 1
        trialNumbers = generateRandomThreeNumbers()
        let (numStrike, numBall) = giveGameResult(trialNumbers: trialNumbers)
        print("임의의 수: \(trialNumbers[0]) \(trialNumbers[1]) \(trialNumbers[2])")
        print("\(numStrike) 스트라이크, \(numBall) 볼")
        if numStrike == 3 {
            print("사용자 승리...!")
            break
        }
        print("남은 기회: \(remainNumber)")
        if remainNumber <= 0 {
            print("컴퓨터 승리...!")
            break
        }
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

func giveGameResult(trialNumbers: [Int]) -> (Int, Int) {
    var numStrike = 0
    var numBall = 0
    
    for idx in 0..<trialNumbers.count {
        if trialNumbers[idx] == keyNumbers[idx] {
            numStrike += 1
        } else if keyNumbers.contains(trialNumbers[idx]) {
            numBall += 1
        }
    }
    return (numStrike, numBall)
}

