//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let randomNumbers = createRandomNumbers()
var attemptCount = 9
var ballCount = 0
var strikeCount = 0

func executeGame(of selectedMenu: String) {
    if selectedMenu == "1" {
        while attemptCount > 0 && strikeCount < 3 {
            getNumbers()
        }
    } else if selectedMenu == "2" {
        return
    }
}

executeGame(of: selectMenu())
