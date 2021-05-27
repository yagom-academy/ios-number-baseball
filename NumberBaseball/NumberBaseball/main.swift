//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var number: Int = 6

func getRandomNumbers() -> [Int] {
    var randomNumbers = Set<Int>()
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 0...9))
    }
    return Array(randomNumbers)
}

func compareNumbers(_ computer: [Int], _ user: [Int]) -> (strike: Int, ball: Int) {
    var strike: Int = 0
    var ball: Int = 0
    var tempNumbers = [Int]()   // 스트라이크가 아닌 숫자의 배열 생성, 임시변수
    
    for index in 0...2 {
        if computer[index] == user[index] {
            strike += 1
        } else {
            tempNumbers.append(computer[index])
        }
    }
    
    for index in tempNumbers {
        if user.contains(index){
            ball += 1
        }
    }
    return (strike, ball)
}

/* 함수 isComputerWin 생성 - 사용자와 컴퓨터의 승패 여부 판별 및 출력 */
func isGameFinished(_ computerNumbers: [Int], _ userNumbers: [Int], _ gameCountNumber: Int) -> Bool {
    if computerNumbers == userNumbers{
        print("사용자의 승리!")
        return true
    } else if gameCountNumber == 0{
        print("컴퓨터의 승리...!")
        return true
    } else{
        return false
    }
}

func startGame() {
    var gameCountNumber = 9                               // 변수 gameCount를 전역변수에서 지역변수로 변경했습니다. 변수명을 gameCountNumber
    let computerNumbers = getRandomNumbers()
    var userNumbers = [Int]()
    var eachCountResult: (strike: Int, ball: Int)        // 변수 result를 eachCountResult로 변경했습니다. 반복문 외부에서 선언했습니다.
    var gameResult: Bool
    /* 반복문을 repeat while로 변경했습니다.*/
    repeat {
        userNumbers = getRandomNumbers()
        print("임의의 수 : \(userNumbers)")
        
        eachCountResult = compareNumbers(computerNumbers, userNumbers)
        gameCountNumber -= 1
        
        //여기서 결과 출력...
        gameResult = isGameFinished(computerNumbers, userNumbers, gameCountNumber)
        // 유저가 이기면 ture를 저장하고 사용자의 승리 출력
        // 유저가 지면 true를 저장하고 컴퓨터의 승리 출력
        // 승부가 안나면 false를 저장
        
        print("\(eachCountResult.strike) 스트라이크, \(eachCountResult.ball) 볼")
        print("남은 기회 : \(gameCountNumber)")
    } while !gameResult
}
    
//    while gameCount != 0 {
//        var userNumbers = getRandomNumbers()
//        print("임의의 수 : \(userNumbers)")
//
//        var result = compareNumbers(computerNumbers, userNumbers)
//        if result.strike == 3 {
//            print("사용자 승리!")
//            break
//        }
//        gameCount -= 1
//        if gameCount == 0 {
//            print("컴퓨터의 승리...!")
//        }
//        print("\(result.strike) 스트라이크, \(result.ball) 볼")
//        print("남은 기회 : \(gameCount)")
//

startGame()
