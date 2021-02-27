//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation




///
/// ## 게임을 시작하는 함수
/// -------
/// - 게임을 시작하면 정해둔 함수를 차례대로 수행합니다.
/// - 스트라이크와 볼 값을 출력합니다.
/// - 남은 게임 횟수를 차감하고, 3strike이 되지 않는 한 게임 횟수가 0이 될때까지 반복합니다.
func startGame() {
    
    // MARK:- 컴퓨터가 만드는 var storage
    var firstRandomNumber: Int = 0
    var secondRandomNumber: Int = 0
    var thirdRandomNumber: Int = 0
    var randomNumberArray: [Int] = [firstRandomNumber, secondRandomNumber, thirdRandomNumber]
    
    // MARK:- 우리가 입력하는 var storage
    var InputNumber: Int = 0
    var firstInputNumber: Int = 0
    var secondInputNumber: Int = 0
    var thirdInputNumber: Int = 0
    var inputNumberArray: [Int] = [firstInputNumber, secondInputNumber, thirdInputNumber]
    
    //MARK:- 
    var strike: Int = 0
    var ball: Int = 0
    var beforeBall: Int = 0
    var chanceToWin: Int = 9
    
    //MARK:- 함수 내 메서드 생성
    /// ## Strike를 판별하는 함수
    /// -----
    /// - 배열 내에 같은 수가 같은 자리에 위치한다면 strike가 하나씩 올라가는 형식으로 함수가 진행된다.
    func checkStrike() {
        if randomNumberArray[0] == inputNumberArray[0] { strike += 1 }
        if randomNumberArray[1] == inputNumberArray[1] { strike += 1 }
        if randomNumberArray[2] == inputNumberArray[2] { strike += 1 }
    }

    /// ## Ball을 판별하는 함수
    /// -----
    /// - 배열내에 같은 숫자가 있다면 일단 beforeBall 에 1이 추가된다.
    /// - 만약 그 숫자가 strike판정이 되는 경우, beforeBall 값에서 1을 빼 주어야 할 것이다.
    /// - 따라서 ball = beforeBall - strike로 변수를 설정해 ball 값을 결정지었다.
    func checkBall() {
        if randomNumberArray.contains(firstInputNumber) { beforeBall += 1 }
        if randomNumberArray.contains(secondInputNumber) { beforeBall += 1 }
        if randomNumberArray.contains(thirdInputNumber) { beforeBall += 1 }
        ball = beforeBall - strike
    }
    
    /// 변수에 랜덤 숫자를 생성하는 함수
    func makeNumber() {
        firstRandomNumber = Int.random(in: 1...9)
        secondRandomNumber = Int.random(in: 1...9)
        thirdRandomNumber = Int.random(in: 1...9)
    }

    /// 세 개의 변수가 중복값이 없도록 하는 함수
    func throwBall() {
        while ( firstRandomNumber == secondRandomNumber ) || ( firstRandomNumber == thirdRandomNumber ) || ( secondRandomNumber == thirdRandomNumber ) {
            makeNumber()
        }
        randomNumberArray = [firstRandomNumber, secondRandomNumber, thirdRandomNumber]
    }

    /// 사용자가 입력한 값을 정수형으로 저장하는 함수
    func batBall() {
        print("임의의 수(세 수를 띄어쓰기 없이 입력하세요): ", terminator:"")
        guard let inputString = readLine() else { return }
        guard let stringStorage = Int(inputString) else { return }
        InputNumber = stringStorage
    }

    /// 사용자가 입력한 값을 세 개의 수로 나누어 배열에 저장하는 함수
    func changeBatNumber() {
        firstInputNumber = (InputNumber - InputNumber % 100) / 100 //choonum = 123, (123-23)/100 =1
        secondInputNumber = (InputNumber - firstInputNumber * 100 - InputNumber % 10) / 10 // = 123-100 - 3 = 20/10 = 2
        thirdInputNumber = (InputNumber - firstInputNumber * 100 - secondInputNumber * 10) // 3
        print(firstInputNumber, secondInputNumber, thirdInputNumber)
        inputNumberArray = [firstInputNumber, secondInputNumber, thirdInputNumber]
    }

    //MARK:- 실질적인 게임 진행 과정
    for gameCount in 1...9 {
        throwBall()
        batBall()
        changeBatNumber()
        checkStrike()
        checkBall()

        print("\(strike) 스트라이크, \(ball) 볼")
        print("남은 기회: \(9-gameCount)")
        
        //strike가 세 개라면 사용자가 승리하는 조건문
        if strike == 3 {
            print("사용자 승리!")
            break
        }
        
        // 게임횟수가 9번이 되면 컴퓨터가 승리하는 조건문
        if gameCount == 9 {
            print("컴퓨터 승리...!")
        }
        
        //st, ball 값을 리셋
    }
}

startGame()

