//
//  NumberBaseball - menu.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

func startNumberBaseball() {
    var menu = ""
    while menu != "2" {
        menu = inputMenu()
        
        switch menu {
        case "1":
            startGame()
        case "2":
            print("\n프로그램 종료")
        default:
            print("입력이 잘못되었습니다.")
        }
    }
}

func inputMenu() -> String {
    printMenuGuideline()
    let menu = inputData()
    
    return menu
}

func printMenuGuideline() {
    let guideline = """
            1. 게임시작
            2. 게임 종료
            원하는 기능을 선택해주세요 :
            """
    print(guideline, terminator: " ")
}
