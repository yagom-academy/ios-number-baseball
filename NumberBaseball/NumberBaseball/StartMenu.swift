//
//  StartMenu.swift
//  NumberBaseball
//
//  Created by mmim, onetool on 2022/02/10.
//

import Foundation

func startGameSelect () {
    print("1. 게임시작\n2. 게임종료")
    print("원하는 기능을 선택해주세요 : ")
    guard let userSelect = readLine() else { return }
    if userSelect == "1" {
        startGame()
    }
    if userSelect == "2" {
    } else {
        print("입력이 잘못되었습니다")
        startGameSelect()
    }
}
