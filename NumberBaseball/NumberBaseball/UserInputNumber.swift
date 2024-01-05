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
            print("입력해주세요 : ", terminator: "")
            
            guard let randomNum = readLine() else {
                return
            }
            
            let splitUserInput = randomNum.components(separatedBy: " ")
            
            if splitUserInput.count > 3 {
                print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
                continue
            } 
            
            let deleteSameNumber: Array<String> = []
            
            for i in 0...(splitUserInput.count - 1) {
                let deleteSameNumber = splitUserInput.filter({$0 == splitUserInput[i]})
            }
            
            if deleteSameNumber.count == 3 {
                flag = false
                userNumList = splitUserInput
            } else if deleteSameNumber.count > 3{
                print("중복 숫자는 허용하지 않습니다.")
            }
        }
        compare()
    }
}


