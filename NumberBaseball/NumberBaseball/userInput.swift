//
//  NumberBaseball - userInput.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

func inputMenu() -> String {
    guard let menu = readLine() else {
        return ""
    }
    return menu
}

func printMenu() {
    let menu = """
            1. 게임시작
            2. 게임 종료
            원하는 기능을 선택해주세요 :
            """
    print(menu, terminator: " ")
}
