//
//  GenerateNumber.swift
//  NumberBaseball
//
//  Created by 김민제 on 1/4/24.
//

import Foundation

extension NumberBaseBall {
    func randomNumber() -> [String] {
        var randomList: Array<String> = []
        var randomNum1 = Int.random(in: 1...9)
        var randomNum2 = Int.random(in: 1...9)
        var randomNum3 = Int.random(in: 1...9)
        
        var flag: Bool = true
        
        while flag {
            if randomNum1 != randomNum2 && randomNum1 != randomNum3 && randomNum2 != randomNum3 {
                flag = false
            } else if randomNum1 == randomNum2 || randomNum2 == randomNum3 {
                randomNum2 = Int.random(in: 1...9)
            } else if randomNum1 == randomNum3 || randomNum2 == randomNum3 {
                randomNum3 = Int.random(in: 1...9)
            }
        }
        randomList.append(String(randomNum1))
        randomList.append(String(randomNum2))
        randomList.append(String(randomNum3))
        
        return randomList
    }

}

