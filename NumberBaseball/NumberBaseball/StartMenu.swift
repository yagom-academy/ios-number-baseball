//
//  StartMenu.swift
//  NumberBaseball
//
//  Created by mmim, onetool on 2022/02/11.
//

import Foundation

func startGameInterface() {
    print("""
        1. 게임시작
        2. 게임종료
        원하는 기능을 선택해주세요 :
        """, terminator: " ")
    guard let userSelectedOption = readLine() else { return }
    switch userSelectedOption {
    case "1":
        startGame()
    case "2":
        break
    default :
        print("입력이 잘못되었습니다")
        startGameInterface()
    }
}
