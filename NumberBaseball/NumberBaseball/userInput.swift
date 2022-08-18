//
//  NumberBaseball - userInput.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

func inputData() -> String {
    guard let data = readLine() else {
        return ""
    }
    return data
}

func printMenu() {
    let menu = """
            1. 게임시작
            2. 게임 종료
            원하는 기능을 선택해주세요 :
            """
    print(menu, terminator: " ")
}
