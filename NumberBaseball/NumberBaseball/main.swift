//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


// control+ command+ e   editor-edit all in scope
var randomNum1: Int = 0
var randomNum2: Int = 0
var randomNum3: Int = 0
var randomNumArr: [Int] = [randomNum1, randomNum2, randomNum3]


// 사용자가 추신수처럼 공을 친다는 뜻으로 chooNum
var inputNum: Int = 0
var inputNum1: Int = 0
var inputNum2: Int = 0
var inputNum3: Int = 0
var inputNumArray: [Int] = [inputNum1, inputNum2, inputNum3]


// ball의 의미가 규칙의 의미와 조금 다릅니다 ㅋㅋ
var strike: Int = 0
var ball: Int = 0

// 남은 게임 횟수
var remainGameNum: Int = 9

// 함수 모음
func numberMaker() {
    randomNum1 = Int.random(in: 1...9)
    randomNum2 = Int.random(in: 1...9)
    randomNum3 = Int.random(in: 1...9)
} // 변수에 숫자를 할당하는 함수
func throwTheBall() {
    while ( randomNum1 == randomNum2 ) || ( randomNum1 == randomNum3 ) || ( randomNum2 == randomNum3 ) {
        numberMaker()
    } // 28/243
    randomNumArr = [randomNum1, randomNum2, randomNum3]
} // 컴퓨터가 생성한 숫자가 겹치지 않도록 만들어주는 함수
func battingTheBall() {
    print("임의의 수(세 수를 띄어쓰기 없이 입력하세요): ", terminator:"")
    guard let chooString = readLine() else { return }
    guard let a = Int(chooString) else { return }
    inputNum = a //123 = 1, 2, 3
} //숫자 세개를 입력받는 함수
func battingNumChanger() {
    inputNum1 = (inputNum - inputNum%100)/100 //choonum = 123, (123-23)/100 =1
    inputNum2 = (inputNum - inputNum1*100 - inputNum%10)/10 // = 123-100 - 3 = 20/10 = 2
    inputNum3 = (inputNum - inputNum1*100 - inputNum2*10) // 3
    
    print(inputNum1, inputNum2, inputNum3)
    inputNumArray = [inputNum1, inputNum2, inputNum3]
} // 쓴 세자리 수에서 각 수를 뽑아내는 함수
func compareIndex() {
<<<<<<< HEAD
    if ryuNumArray[0] == inputNumArray[0] { strike += 1 } //123, 132 -> [1, 2, 3], [1, 3, 2]
    if ryuNumArray[1] == inputNumArray[1] { strike += 1 } // 1strike
    if ryuNumArray[2] == inputNumArray[2] { strike += 1 }
} // 배열 안에 같은 숫자가 같은 자리에 있는지를 검사하는 함수
func compareNum() {
    if ryuNumArray.contains(inputNum1) { ball += 1 } //123, 132
    if ryuNumArray.contains(inputNum2) { ball += 1 } //ball = 3
    if ryuNumArray.contains(inputNum3) { ball += 1 }
=======
    if randomNumArr[0] == chooNumArray[0] { strike += 1 } //123, 132 -> [1, 2, 3], [1, 3, 2]
    if randomNumArr[1] == chooNumArray[1] { strike += 1 } // 1strike
    if randomNumArr[2] == chooNumArray[2] { strike += 1 }
} // 배열 안에 같은 숫자가 같은 자리에 있는지를 검사하는 함수
func compareNum() {
    if randomNumArr.contains(chooNum1) { ball += 1 } //123, 132
    if randomNumArr.contains(chooNum2) { ball += 1 } //ball = 3
    if randomNumArr.contains(chooNum3) { ball += 1 }
>>>>>>> 8444921bb643e095dd5ac7750543cd6ea140f718
} //배열 안에 같은 숫자가 있는지를 검사하는 함수


//게임 시작
while remainGameNum > 0 {
    
    throwTheBall()
    battingTheBall()
    battingNumChanger()
    compareIndex()
    compareNum()

    //판정
    print("\(strike) 스트라이크, \(ball - strike) 볼")
    
    //strike가 세 개라면 사용자 승리
    if strike == 3 {
        print("게임 좀 하는데? 너가 바로 숫자야구 추신수")
        break
    }
    
    // 게임 횟수 1회 차감
    remainGameNum -= 1
    
    // 게임 횟수가 0이라면 컴퓨터 승리
    if remainGameNum == 0 {
        print("컴퓨터한테 지냐? ㅋㅋ AI가 인류를 지배한다.")
    }
    
    //st, ball 값을 리셋
    strike = 0
    ball = 0
}

