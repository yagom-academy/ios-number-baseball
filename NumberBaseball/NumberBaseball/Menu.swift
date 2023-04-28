//
//  Menu.swift
//  NumberBaseball
//
//  Created by Hyun A Song on 2023/04/28.
//

import Foundation

func selectMenu() -> String {
    let menu: [String] = ["1", "2"]
    print("""
        1. 게임 시작
        2. 게임 종료
        원하는 기능을 선택해주세요 :
        """, terminator: " ")
    
    guard let selectedMenu = readLine(), menu.contains(selectedMenu) else {
        print("입력이 잘못 되었습니다.")
        return selectMenu()
    }
    return selectedMenu
}
