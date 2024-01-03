//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func execute(){
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요: ", terminator: "")
    
    var input = readLine()
    
    if input == "1"{
        //gameStart()
    } else if input == "2" {
        
    } else {
        execute()
    }
}

func gameStart(){
    var comNum1 = Int.random(in: 1...9)
    var comNum2 = Int.random(in: 1...9)
    var comNum3 = Int.random(in: 1...9)
    
    var userInput = readLine()?.split(separator: "")
    
    if userInput.count < 3 {
        print("입력이 잘못 되었습니다.")
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
        print("중복된 숫자는 허용되지 않습니다!")
    }
}
