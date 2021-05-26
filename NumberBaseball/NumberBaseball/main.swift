//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


//
//## STEP 1 : 기본 기능 구현
//
//1. 다음 변수를 생성합니다
//    1. 컴퓨터가 제시할 임의의 정수 3개를 담아둘 변수
//    2. 남은 시도횟수를 담아둘 변수
//        - 초기값은 9입니다
//2. 다음 함수를 구현합니다
//    1. 1~9 사이의 세 개의 임의의 정수를 생성하여 반환하는 함수
//        - 생성한 세 개의 정수는 중복된 수가 없어야합니다
//3. 세 개의 정수를 전달받아 [1-1]의 수와 비교하여 볼과 스트라이크 결과를 반환하는 함수
//4. 게임시작 함수
//    - 이번 스텝에서는 사용자 입력없이 임의의 수를 생성하여 게임을 진행하도록 구현합니다


var answerNumbers = [Int]()
var tryNumber = 9

func makeAnswer() {
    
    while answerNumbers.count < 3 {
        let number = Int.random(in: 1...9)
        appendUniqueNumber(number: number)

    }
    
}

func appendUniqueNumber(number:Int) {
    if !answerNumbers.contains(number) {
        answerNumbers.append(number)
    }
}
makeAnswer()
print(answerNumbers)
