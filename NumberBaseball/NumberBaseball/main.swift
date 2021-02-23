//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class NumberBaseballGame {
    var randomNums: [Int] = []
    var tryCnt = 9

    // 1~9 사이의 세 개의 임의의 정수 반환
    func getRandomNums() -> [Int] {
        var randomNumberArray: [Int] = []

        while randomNumberArray.count < 3 {
            let randomNum = Int.random(in: 1...9)
            if randomNumberArray.contains(randomNum) { continue }
            
            randomNumberArray.append(randomNum)
        }
        
        return randomNumberArray
    }
    
    // 볼과 스트라이크 결과를 반환
    func getGameResult(userNumber: [Int]) -> Dictionary<String, Int> {
        var gameResult = ["strike": 0, "ball": 0]
        
        for index in 0...2 {
            if randomNums[index] == userNumber[index] {
                gameResult["strike"]! += 1
            } else if userNumber.contains(randomNums[index]) {
                gameResult["ball"]! += 1
            }
        }
        
        return gameResult
    }
    
    func startGame() {
        randomNums = getRandomNums()
        
        for _ in 1...tryCnt {
            tryCnt -= 1

            let userNumbers = getRandomNums()
            let gameResult = getGameResult(userNumber: userNumbers)

            print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")

            if gameResult["strike"] == 3 {
                print("사용자 승리!!")
            }
            else if tryCnt == 0 {
                print("컴퓨터 승리...!")
            }

            print("\(gameResult["strike"]!) 스트라이크, \(gameResult["ball"]!) 볼")
            print("남은 기회 : \(tryCnt)")
        }
    }
}

let test = NumberBaseballGame()
test.startGame()
