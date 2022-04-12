//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation



/*
 0. 게임 시작
 1. 길이가 3인 정수 배열 선언, 난수 카운터
 2. 시행횟수 선언 후 9 할당
 3. 난수 생성후 정수 배열에서 검색
     1. 같은 원소 있으면 다시 난수 생성
     2. 없으면 추가 후 난수 카운터 1증가
 4. 난수 카운터가 3이 아닌 경우 다시 난수 생성으로
 5. 임의의 수 생성 후 배열과 비교
 6. 배열과 일치하는게 있으면 일단 ball, 순서까지 동일하면 strike, 하나도 일치하지 않으면 nothing
 7. strike 갯수 알아보고 3이면 플레이어 승 아니면 시행횟수 0 될때까지 게임 다시 진행
 8. 시행 횟수 0에 도달 하면 컴퓨터 승
 11. 게임 종료
 */


var randomNumbers = [Int]()
var index = 0
var totalTrialNumber = 9

func makeRandomNumbers() -> Array<Int> {
    var randomNumbers = Set<Int>()
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    
    return Array(randomNumbers)
}


func checkStrikeBall() -> (Int, Int) {
    var strike = 0
    var ball = 0
    let numbers = makeRandomNumbers()
    
    for numberindex in (0...numbers.count - 1) {
        if numbers.contains(numbers[numberindex]) && index == numberindex {
            strike += 1
        } else if numbers.contains(numbers[numberindex]) && index != numberindex{
            ball += 1
        }
        
        index += 1
    }
    
    return (strike, ball)
}

