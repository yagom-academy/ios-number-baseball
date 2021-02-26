//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

/// 사용자가 고른 3개의 함수를 저장하는 Int형 배열
var userNumbers: [Int] = [1, 2, 3]

/// 남은 게임 카운트 회수를 저장하는 Int형 변수
var gameCount: Int = 9

func returnRandomNumbers() -> [Int] {
    
    var randomNumbers: [Int] = [0,0,0]
    
    randomNumbers[0] = Int.random(in: 1...9)
    
    repeat {
        randomNumbers[1] = Int.random(in: 1...9)
    } while randomNumbers[0] == randomNumbers[1]
    
    repeat {
        randomNumbers[2] = Int.random(in: 1...9)
    } while randomNumbers[0] == randomNumbers[2] || randomNumbers[1] == randomNumbers[2]
 
   return randomNumbers
}

/// 사용자가 입력한 수와 임의로 생성된 수를 비교하여
/// 볼과 스트라이크의 개수를 계산한 배열을 반환하는 함수이다.
///
/// 함수의 인자로 전달되는 Int 배열인 randomNumbers의 원소는 3개이고
/// 컴퓨터가 고른  3개의 수를 의미한다.
///
/// 출력되는 Int형 배열의 원소는 2개이고 첫번쨰 원소는 ball의 수
/// 그리고 두번쨰 원소는 strike의 수를 의미한다.
func returnCountOfBallAndStrike(randomNumbers: [Int]) -> [Int] {
    var ball: Int = 0
    var strike: Int = 0

    for index in 0...2 {
        if randomNumbers[index] != userNumbers[index] && randomNumbers.contains(userNumbers[index]) {
            ball += 1
        } else if randomNumbers[index] == userNumbers[index] {
            strike += 1
        }
    }
    return [ball,strike]
}

func startGame() {

    while gameCount > 0 {

        gameCount -= 1

        let initNum: [Int] = returnRandomNumbers()
        
        /// ball과 strike의 카운트를 나타내는 배열
        /// 첫번째 배열요소가 ball 두번째 배열요소가 strike
        let resultOfCount: [Int] = returnCountOfBallAndStrike(randomNumbers: initNum)

        print("임의의 수 : \(initNum[0]) \(initNum[1]) \(initNum[2])")

        if resultOfCount[1] == 3 {
            print("사용자 승리...!")
        } else if gameCount == 0 {
            print("컴퓨터 승리...!")
        }
        print("\(resultOfCount[1]) 스트라이크, \(resultOfCount[0]) 볼")
        print("남은 기회 : \(gameCount)")

    }
}

startGame()
