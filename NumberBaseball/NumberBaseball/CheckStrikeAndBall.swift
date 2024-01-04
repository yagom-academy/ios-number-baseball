//
//  CheckWinOrLose.swift
//  NumberBaseball
//
//  Created by 김민제 on 1/4/24.
//

import Foundation

extension NumberBaseBall {
    func compare(){
                
        var strike: Int = 0
        var ball: Int = 0
        
        while strike != 3 {
            
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

