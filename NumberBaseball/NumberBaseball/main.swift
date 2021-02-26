//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// control+ command+ e   editor-edit all in scope
var firstRandomNumber: Int = 0
var secondRandomNumber: Int = 0
var thirdRandomNUmber: Int = 0
var randomNumberArray: [Int] = [firstRandomNumber, secondRandomNumber, thirdRandomNUmber]



// 사용자가 추신수처럼 공을 친다는 뜻으로 chooNum
var InputNumber: Int = 0
var firstInputNumber: Int = 0
var secondInputNumber: Int = 0
var thirdInputNumber: Int = 0
var inputNumberArray: [Int] = [firstInputNumber, secondInputNumber, thirdInputNumber]


// ball의 의미가 규칙의 의미와 조금 다릅니다 ㅋㅋ
var strike: Int = 0
var ball: Int = 0

// 남은 게임 횟수
var chanceToWin: Int = 9

// 함수 모음
func makeNumber() {
    firstRandomNumber = Int.random(in: 1...9)
    secondRandomNumber = Int.random(in: 1...9)
    thirdRandomNUmber = Int.random(in: 1...9)
} // 변수에 숫자를 할당하는 함수
func throwBall() {
    while ( firstRandomNumber == secondRandomNumber ) || ( firstRandomNumber == thirdRandomNUmber ) || ( secondRandomNumber == thirdRandomNUmber ) {
        makeNumber()
    } // 28/243
    randomNumberArray = [firstRandomNumber, secondRandomNumber, thirdRandomNUmber]
} // 컴퓨터가 생성한 숫자가 겹치지 않도록 만들어주는 함수
func batBall() {
    print("임의의 수(세 수를 띄어쓰기 없이 입력하세요): ", terminator:"")
    guard let chooString = readLine() else { return }
    guard let a = Int(chooString) else { return }
    InputNumber = a //123 = 1, 2, 3
} //숫자 세개를 입력받는 함수
func changeBatNumber() {
    firstInputNumber = (InputNumber - InputNumber%100)/100 //choonum = 123, (123-23)/100 =1
    secondInputNumber = (InputNumber - firstInputNumber*100 - InputNumber%10)/10 // = 123-100 - 3 = 20/10 = 2
    thirdInputNumber = (InputNumber - firstInputNumber*100 - secondInputNumber*10) // 3
    
    print(firstInputNumber, secondInputNumber, thirdInputNumber)
    inputNumberArray = [firstInputNumber, secondInputNumber, thirdInputNumber]
} // 쓴 세자리 수에서 각 수를 뽑아내는 함수
func compareIndex() {

    if randomNumberArray[0] == inputNumberArray[0] { strike += 1 } //123, 132 -> [1, 2, 3], [1, 3, 2]
    if randomNumberArray[1] == inputNumberArray[1] { strike += 1 } // 1strike
    if randomNumberArray[2] == inputNumberArray[2] { strike += 1 }
} // 배열 안에 같은 숫자가 같은 자리에 있는지를 검사하는 함수
func compareNumber() {
    if randomNumberArray.contains(firstInputNumber) { ball += 1 } //123, 132
    if randomNumberArray.contains(secondInputNumber) { ball += 1 }//ball = 3
    if randomNumberArray.contains(thirdInputNumber) { ball += 1 }

} //배열 안에 같은 숫자가 있는지를 검사하는 함수


//게임 시작
while chanceToWin > 0 {
    
    throwBall()
    batBall()
    changeBatNumber()
    compareIndex()
    compareNumber()

    //판정
    print("\(strike) 스트라이크, \(ball - strike) 볼")
    
    //strike가 세 개라면 사용자 승리
    if strike == 3 {
        print("게임 좀 하는데? 너가 바로 숫자야구 추신수")
        break
    }
    
    // 게임 횟수 1회 차감
    chanceToWin -= 1
    
    // 게임 횟수가 0이라면 컴퓨터 승리
    if chanceToWin == 0 {
        print("컴퓨터한테 지냐? ㅋㅋ AI가 인류를 지배한다.")
    }
    
    //st, ball 값을 리셋
    strike = 0
    ball = 0
}

