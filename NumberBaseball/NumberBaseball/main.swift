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
            print("입력이 잘못되었습니다.")
            continue
        }
        
        if userOrder == "1" {
            
        }
        
        inMenu = false
    }
}

offerBaseballGameMenu()
