//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

//MARK: - Step 1
/// 1. 변수 설정
/// 2. 난수 3개 생성하는 함수 구현
///   - 중복된 숫자가 없어야한다
///   - 1~9 사이의 숫자여야 한다

func generateRandomNumbers() -> Set<Int> {
    var randomNumbers: Set<Int> = []
    
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1..<10))
    }
    
    return randomNumbers
}



