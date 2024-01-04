//
//  GenerateNumber.swift
//  NumberBaseball
//
//  Created by 김민제 on 1/4/24.
//

import Foundation

extension NumberBaseBall {
    func generateNumber() {
        comNumList = []
        
        while comNumList.count < 3 {
            var randomNum = Int.random(in: 1...9)
            
            var randomNumStr = String(randomNum)
            
            if !comNumList.contains(randomNumStr) {
                comNumList.append(randomNumStr)
            }
        }
        
    }

}

