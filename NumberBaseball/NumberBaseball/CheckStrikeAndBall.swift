//
//  CheckWinOrLose.swift
//  NumberBaseball
//
//  Created by 김민제 on 1/4/24.
//

import Foundation

extension NumberBaseBall {
    func compare(){
        while repeatTime > 0 {
            let strike = checkStrike()
            let ball = checkIfBall()
            
            print("\(strike) 스트라이크, \(ball) 볼")
            
            if strike == 3 {
                print("사용자 승리..!")
                repeatTime = 9
                break
            }
            
            repeatTime -= 1
            print("남은 기회는 \(repeatTime)")
            
            if repeatTime == 0 {
                print("컴퓨터 승리...!")
                repeatTime = 9
                break
            }
            
            userInputNumber()
        }
    }
    
    func checkStrike () -> Int {
        var numberOfStrike: Int = 0
        
        for i in 0...2 {
            if comNumList[i] == userNumList[i] {
                numberOfStrike += 1
            }
        }
        return numberOfStrike
    }
    
    func checkIfBall() -> Int {
        var numberOfBall: Int = 0

        for i in 0...(userNumList.count - 1) {
            var changedComNumList: [String] = comNumList
            changedComNumList[i] = "-1"

            if changedComNumList.contains(userNumList[i]) {
                numberOfBall += 1
            }
        }
        return numberOfBall
    }
}

