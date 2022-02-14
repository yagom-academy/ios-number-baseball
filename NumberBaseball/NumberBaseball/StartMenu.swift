//
//  StartMenu.swift
//  NumberBaseball
//
//  Created by mmim on 2022/02/11.
//

import Foundation

func startGameMenu() {
    let firstOption = "1"
    let secondOption = "2"
    print("""
        1. 게임시작
        2. 게임종료
        원하는 기능을 선택해주세요 :
        """, terminator: " ")
    guard let userSelectedOption = readLine() else { return }
    switch userSelectedOption {
    case firstOption:
        startGame()
    case secondOption:
        break
    default :
        print("입력이 잘못되었습니다")
        startGameMenu()
    }
}
