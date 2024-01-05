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
        
        print("입력해주세요 : ", terminator: "")
        
        guard let randomNum = readLine() else {
            return
        }
        
        let splitUserInput = randomNum.components(separatedBy: " ")
        
        guard splitUserInput.count == 3 else {
            print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
            userInputNumber()
            return
        }
        
        for i in 0...(splitUserInput.count - 1) {
            let duplicatedArr: Array<String> = splitUserInput.filter({$0 == splitUserInput[i]})
            
            guard duplicatedArr.count == 1 else {
                print("중복 숫자는 허용하지 않습니다.")
                userInputNumber()
                return
            }
        }
        
        userNumList = splitUserInput
        compare()
    }
}


