//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class GameBaseBall {
    var randomDigits = [Int]() // 1-A. 3개의 임의의 정수
    var playCount = 9 // 1-B. 남은 시도 횟수
    
    // 2-A. 3개의 임의의 숫자 생성
    func digitsGenerator() -> [Int] {
        var rCount: [Int] = []
        
        while rCount.count < 3 {
            rCount.append(Int.random(in: 1...3))
            let removeDuplicationDigit = Array(Set(rCount))
            rCount = removeDuplicationDigit
        }
        return rCount
    }
    
    // 2-B. 사용자 입력 숫자와 임의의 숫자를 비교해서 카운트 결과를 반환
    func countResult(inputNumber: [Int]) -> (ballCount: Int, strikeCount: Int) {
        var ballCount = 0
        var strikeCount = 0
        
        for index in 0...2 {
            if self.randomDigits[index] == inputNumber[index] {
                // 생성된 임의의 수 3개의 위치와 유저가 입력한 수 3개의 위치가 같다면
                strikeCount += 1
                
                // 유저가 입력한 수가 생성된 임의의 수에 포함된다면
            } else if inputNumber.contains(self.randomDigits[index]) {
                ballCount += 1
            }
        }
        print("입력한 수 : \(inputNumber)")
        return (ballCount, strikeCount)
    }
    
    
    // 2-C. 숫자야구 게임 시작 -> 게임 숫자를 입력 받는 함수
    func startGame() {
        self.randomDigits = self.digitsGenerator() // 임의의 정수 3개 생성하여 배열에 저장

        // 유저가 한번만 입력했을때 한번만 실행되게 해야함
        while self.playCount > 0 {
            self.playCount -= 1
            let autoGameStart = countResult(inputNumber: self.digitsGenerator())
            
            print("\(autoGameStart.ballCount) 볼, \(autoGameStart.strikeCount) 스트라이크, 남은 기회: \(self.playCount)")
            
            if autoGameStart.strikeCount == 3 {
                print("유저 승리")
                break
            } else if self.playCount == 0 {
                print("컴퓨터 승리")
                break
            }
        }
    }
}

let game = GameBaseBall()
game.startGame()
