//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum GameFunc: String {
    case start = "1"
    case end = "2"
    case other = "x" // 변경예정
}

func execute(){
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요: ", terminator: "")
    
    guard let input = readLine(), !input.isEmpty else {
        //execute()
        return
    }
    
    verify(menu: input)
}

func verify(menu: String) {
    let selected = GameFunc(rawValue: menu)
    switch selected {
    case .start:
        gameStart()
    case .end:
        //gameEnd()
        print("")
    case .other:
        //execute()
        print("")
    }
}

func gameStart(){
    var comNum1 = Int.random(in: 1...9)
    var comNum2 = Int.random(in: 1...9)
    var comNum3 = Int.random(in: 1...9)
    
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
