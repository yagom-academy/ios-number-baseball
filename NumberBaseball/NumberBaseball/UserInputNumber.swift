//
//  UserInputNumber.swift
//  NumberBaseball
//
//  Created by 김민제 on 1/4/24.
//

import Foundation

extension NumberBaseBall {
    func userInputNumber() {
        userNumList = []
        
        var flag: Bool = true
        
        while flag {
                        
            guard let randomNum = readLine() else {
                return
            }
            
            var splitUserInput = randomNum.components(separatedBy: " ")
            
            if splitUserInput[0] != splitUserInput[1] && splitUserInput[0] != splitUserInput[2] && splitUserInput[1] != splitUserInput[2] {
                flag = false
                userNumList = splitUserInput
            }
        }
        
        compare()
        
    }
}


