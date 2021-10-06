//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

/*
 1. 다음 변수를 생성합니다
    i. 컴퓨터가 제시할 임의의 정수 3개를 담아둘 변수
    ii. 남은 시도횟수를 담아둘 변수(초기값은 9입니다)
 
 2. 다음 함수를 구현합니다
    i. 1~9 사이의 세 개의 임의의 정수를 생성하여 반환하는 함수(생성한 세 개의 정수는 중복된 수가 없어야합니다)
 
 3. 세 개의 정수를 전달받아 [1-1]의 수와 비교하여 볼과 스트라이크 결과를 반환하는 함수
 
 4. 게임시작 함수
    이번 스텝에서는 사용자 입력없이 임의의 수를 생성하여 게임을 진행하도록 구현합니다
 */

import Foundation

// 임의의 정수 3개 담아둘 변수! -> Set or Array?
// index 가 필요하겠다. -> Array.

var answerRandomInt: [Int] = [] // 번호를 담아둘 배열
var chance: Int = 9 // 남은 시도횟수
var randomIntComputer: [Int] = [] // 컴퓨터가 줄 수
var strike: Int = 0
var ball: Int = 0

func generateRandomInt(to: inout [Int]) {
    // 3개 랜덤하게 생성해서 randomInt 에 넣어주는 것 까지!
    var originalNumber: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    originalNumber.shuffle()
    for _ in 1...3 {
        to.append(originalNumber.removeFirst())
    }
}

func judgeBaseballResult() {
    //야구 결과를 판단하는 함수
    for pitch in 0...2 {
        if randomIntComputer[pitch] == answerRandomInt[pitch] {
            strike += 1
        } else if answerRandomInt.contains(randomIntComputer[pitch]) {
            ball += 1
        }
    }
    //찬스를 안깎음
    print("임의의 수 : \(randomIntComputer[0]) \(randomIntComputer[1]) \(randomIntComputer[2])")
    print("\(strike) 스트라이크, \(ball) 볼")
}

func playGame() {
    generateRandomInt(to: &answerRandomInt)
    
    for _ in 1...chance {
        generateRandomInt(to: &randomIntComputer)
        judgeBaseballResult()
        randomIntComputer.removeAll()
        
        chance -= 1
        
        print("남은 기회 : \(chance)")
        
        if strike == 3 {
            print("사용자 승리!")
            return
        }
        
        if chance == 0 {
            print("컴퓨터 승리...!")
            return
        }
        strike = 0
        ball = 0
    }
}


// readLine() 으로 받은 "Int Int Int" 비교해야 하는 건 [Int, Int, Int]
// String 으로 들어온 입력을 Int()로 바꿔서, 인덱스 하나하나 비교하는 순서?

playGame()

