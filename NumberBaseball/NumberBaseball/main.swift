//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


// 회차 선언
var chance = 0

// 임의의 수 저장을 위한 빈 배열 선언
var arrayNum: Array<Int> = []

// 랜덤한 3개 숫자 배열에 저장
while arrayNum.count < 3 {
    let ranNum = Int.random(in: 1...9)
    
    if !arrayNum.contains(ranNum) {
        arrayNum.append(ranNum)
    }
}

// 개발용 임의의 수 출력
print(arrayNum)

// 사용자 입력 함수 입력한 값을 정수의 배열로 변환   #1 2 3 -> [1, 2, 3]
func userInputNum() -> [Int] {
    let inputNum = readLine()!
    let arrayStringInputNum = inputNum.components(separatedBy: " ")
    var arrayIntInputNum: [Int] = []
    
    for i in arrayStringInputNum {
        let iInt = Int(i)!
        arrayIntInputNum.append(iInt)
    }
    
    return arrayIntInputNum
}


// 스트라이크 볼 체크 함수
func strikeBallCheck(sourceArr: [Int], checkArr: [Int]) -> [Int] {
    var strike = 0
    var ball = 0
    var result: [Int] = []
    
    for i in 0...2 {
        if sourceArr[i] == checkArr[i] {
            strike += 1
        } else if arrayNum.contains(checkArr[i]) {
            ball += 1
        }
    }
    
    result.append(strike)
    result.append(ball)
    
    return result
}

// 9회차가 될 때 까지 반복
while chance < 9 {
    chance += 1 // 회차 시작
    
    // 사용자 입력 함수 실행
    let userInput = userInputNum()
    
    // 스트라이크 볼 체크 함수 실행
    let sbCheck = strikeBallCheck(sourceArr: arrayNum, checkArr: userInput)
    
    print("\(chance)회차 \(sbCheck[0])스트라이크, \(sbCheck[1])볼")
    
    // 지정된 숫자와 사용자 입력 숫자가 같을 시
    if sbCheck[0] == 3 {
        print("사용자 승리!")
        break
    }
    
    if chance == 9 {
        print("컴퓨터 승리!")
    }
}
