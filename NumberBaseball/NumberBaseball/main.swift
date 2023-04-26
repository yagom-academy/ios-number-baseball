//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

func offerBaseballGameMenu() {
    var inMenu: Bool = true
    
    while inMenu {
        print("""
        1. 게임시작
        2. 게임종료
        원하는 기능을 선택해주세요 :
        """, terminator: " ")
        
        guard let userOrder = readLine(), (userOrder == "1" || userOrder == "2") else {
            print("입력이 잘못되었습니다")
            continue
        }
        
        if userOrder == "1" {
            
        }
        
        inMenu = false
    }
}

func retrieveNumbers() -> [Int] {
    print("""
    숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
    중복 숫자는 허용하지 않습니다.
    입력 :
    """, terminator: " ")
    
    guard let inputNumber = readLine() else {
        print("입력이 잘못되었습니다")
        return retrieveNumbers()
    }
    
    let userNumbers = inputNumber.split(separator: " ").compactMap{ Int($0) }
    
    guard userNumbers.count == 3, Set(userNumbers).count == 3 else {
        print("입력이 잘못되었습니다")
        return retrieveNumbers()
    }
    
    return userNumbers
}

offerBaseballGameMenu()
retrieveNumbers()
