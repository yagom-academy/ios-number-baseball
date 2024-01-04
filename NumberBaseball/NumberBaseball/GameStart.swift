//
//  GameStart.swift
//  NumberBaseball
//
//  Created by 김민제 on 1/4/24.
//

import Foundation

extension NumberBaseBall {
    func gameStart(){
                
        guard var userInput = readLine() else {
            return
        }
        
        let splitUserInput = userInput.components(separatedBy: " ")
        
        if userInput.count < 3 {
            print("입력이 잘못 되었습니다.")
            print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
            print("중복된 숫자는 허용되지 않습니다!")
        }
        
        
    }
}

