//
//  NumberBaseball - userInput.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

func inputMenu() -> String? {
    guard let menu = readLine() else {
        return ""
    }
    return menu
}
