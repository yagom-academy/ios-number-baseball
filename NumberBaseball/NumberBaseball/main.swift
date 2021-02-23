//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomValue:[Int] = []
var count = 9

class NumberBaseball {
    
    // 중복안돼
    func random() -> [Int]{
        var randomNum:[Int] = []
        
        while randomNum.count != 3 {
            let num = Int.random(in: 1...9)
            
            if randomNum.contains(num) {
                continue
                
            } else {
                randomNum.append(num)
            }
        }
        
        return randomNum
    }
    
    func compare(score:(Int, Int, Int)) -> String {
        // (1, 2, 3)
       
        return ""
    }
    
    func startGame() {
        
        
    }
    
}

let NBGame = NumberBaseball()
NBGame.startGame()
