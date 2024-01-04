//
//  ExcuteGame.swift
//  NumberBaseball
//
//  Created by 김민제 on 1/4/24.
//

import Foundation

extension NumberBaseBall {
    enum GameFunc: String {
        case start = "1"
        case end = "2"
    }

    func execute() {
        var flag: Bool = true
        
        while flag {
            print("1. 게임시작")
            print("2. 게임종료")
            print("원하는 기능을 선택해주세요: ", terminator: "")
            
            guard let input = readLine(), !input.isEmpty else {
                print("입력이 잘못 되었습니다.")
                continue
            }
            
            guard let selected = GameFunc(rawValue: input) else {
                continue
            }
        
            switch selected {
            case .start:
                gameStart()
            case .end:
                flag = false
            }
        }
    }
}
