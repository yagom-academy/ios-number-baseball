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

func execute() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요: ", terminator: "")
    
    guard let input = readLine(), !input.isEmpty else {
        //execute()
        return
    }
    
    verify(menu: input)
}

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

func compare(comNum: [String], userNum: [String]){
    var userNumList: Array<String> = []
    
    guard let inputUser = readLine() else {
        return
    }
    
    var strike: Int = 0
    var ball: Int = 0
    
    
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
    var comNum: Array<String> = []
    comNum = randomNumber()
    
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
