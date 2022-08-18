//
//  NumberBaseball - menu.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

func printMenuGuideline() {
    let guideline = """
            1. 게임시작
            2. 게임 종료
            원하는 기능을 선택해주세요 :
            """
    print(guideline, terminator: " ")
}

func inputMenu() -> String {
    printMenuGuideline()
    let menu = inputData()
    
    return menu
}
