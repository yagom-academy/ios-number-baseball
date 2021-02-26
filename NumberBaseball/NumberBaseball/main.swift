//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 한번에 코딩해서 커밋하지말고 페어 프로그래밍으로 하나씩 메서드를 만들어서 커밋
// 전역변수 호출명 self 남발 금지
class GameBaseBall {
    var randomDigits = [Int]()
    var playCount = 9
    
    // contains를 활용하여 중복 숫자 제거해보기
    // 다른 방법으로 중복 숫자 제거해보기
    // 왜 메모리 누수가 일어난다고 생각했는지 ?
    func digitsGenerator() -> [Int] {
        var rCount: [Int] = [] // 변수명 변경
        
        while rCount.count < 3 {
            rCount.append(Int.random(in: 1...3)) // 1...9 사이의 3개의 정수를 생성하는것으로 수정
            let removeDuplicationDigit = Array(Set(rCount))
            rCount = removeDuplicationDigit
        }
        return rCount
    }
    
    // 메서드명 변경
    func countResult(inputNumber: [Int]) -> (ballCount: Int, strikeCount: Int) {
        var ballCount = 0
        var strikeCount = 0
        
        for index in 0...2 {
            if self.randomDigits[index] == inputNumber[index] {
                strikeCount += 1
            } else if inputNumber.contains(self.randomDigits[index]) { // contains 함수의 정확한 용도 알기
                ballCount += 1
            }
        }
        print("입력한 수 : \(inputNumber)")
        return (ballCount, strikeCount)
    }
    
    func startGame() {
        self.randomDigits = self.digitsGenerator()

        // 반복문 중첩 간결하게 변경(이중 중첩 X)
        while self.playCount > 0 {
            self.playCount -= 1
            let autoGameStart = countResult(inputNumber: self.digitsGenerator()) // 상수명 변경
            
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
