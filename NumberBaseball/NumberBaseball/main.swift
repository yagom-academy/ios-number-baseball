//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

/*
STEP 1 : 기본 기능 구현

다음 변수를 생성합니다
i. 컴퓨터가 제시할 임의의 정수 3개를 담아둘 변수
ii. 남은 시도횟수를 담아둘 변수(초기값은 9입니다)
다음 함수를 구현합니다
 
i. 1~9 사이의 세 개의 임의의 정수를 생성하여 반환하는 함수(생성한 세 개의 정수는 중복된 수가 없어야합니다)
 
세 개의 정수를 전달받아 [1-1]의 수와 비교하여 볼과 스트라이크 결과를 반환하는 함수
게임시작 함수
 
이번 스텝에서는 사용자 입력없이 임의의 수를 생성하여 게임을 진행하도록 구현합니다
 */

import Foundation

var targetNumbers: [Int] = []

var strikeCount: Int = 0
var ballCount: Int = 0

var tryCount: Int = 9

var randomNumbers: [Int] = []

func createRandomNumbers(first: Int = 1, last: Int = 9, count: Int = 3) -> [Int] {
    var resultNumbers: [Int] = []
    
    repeat {
        let num: Int = Int.random(in: first...last)
        if !resultNumbers.contains(num) {
            resultNumbers.append(num)
        }
        
    } while resultNumbers.count < count
    
    return resultNumbers
}

targetNumbers = createRandomNumbers()

func startGame()
