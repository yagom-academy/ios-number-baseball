//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class StartBaseballGame {
    var randomNumberArray: [Int] = []
    var checkUserOrComputer: Bool = true
    var restChance: Int = 9
    var hitThreeStrike: Bool = false
    
    func extractRandomNumber() {
        var checkRepeatNumberArray: [Int] = []
        
        while checkRepeatNumberArray.count < 4 {
            checkRepeatNumberArray.append(Int.random(in: 1...9))
            checkRepeatNumberArray = Array(Set(checkRepeatNumberArray))
        }
    }
    
    func checkNumberError(_ numbers: Int...) {
        
    }
    
    func compareComputerUserNumber(_ computerNumber: [Int]) {
        restChance -= 1
    }
    
    init() {
        
    }
}
