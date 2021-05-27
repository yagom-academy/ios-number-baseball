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


var tryNumber = 9

//3자리 랜덤 숫자 만들기
func makeRandomNumbers() -> [Int] {
    var randomArray = [Int]()
    while randomArray.count < 3 {
        let number = uniqueNumber(from: randomArray)
        randomArray.append(number)
    }
    return randomArray
}

//3자리 랜덤 숫자 만들때 중복 없이 숫자 추가하기
func uniqueNumber(from targetArray: [Int]) -> Int{
    let number = Int.random(in: 1...9)
    if !targetArray.contains(number) {
        return number
    }
    return uniqueNumber(from: targetArray)
}

let answerNumbers = makeRandomNumbers()
//아래 동작을 9번하기

//guessNumbers 만들기
var guessNumbers = makeRandomNumbers()

for i in 1...tryNumber {
    
    //guessNumbers랑 answerNumbers비교하기
    //같으면 게임종료
    if guessNumbers == answerNumbers {
        print("3 스트라이크, 0 볼")
        print("사용자 승리!")
        break
    }
    //다르면 스트라이크랑 볼 검사
    
}







print(answerNumbers)

