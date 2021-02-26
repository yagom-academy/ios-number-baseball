//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

///사용자가 입력한 숫자 3개를 담기 위한 배열
var numOfUserInputs : [Int] = []

var gameCount : Int = 9

/// 사용자 메뉴를 출력하고 메뉴를 입력받는 함수
func printMenuAndinputMenu() {
    
    while true {
    
        print("1. 게임시작")
        print("2. 게임종료")
        print("원하는 기능을 선택해주세요 : ", terminator : "")
    
        let userSelectedMenuInt : Int = Int( readLine()! )!
    
        if userSelectedMenuInt < 1 || userSelectedMenuInt > 2 {
            print("입력이 잘못되었습니다.")
            continue
        }
        
        guard userSelectedMenuInt == 1 else{
            return
        }
        
        break
    }
    
}

/// 사용자가 입력하는 3개의 게입 숫자를 입력받는 함수
func inputGameNum() {
    
    while true {
        
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
        print("중복 숫자는 허용하지 않습니다.")
        print("입력 : ", terminator : "")
        
        numOfUserInputs = readLine()!.split(separator: " ").map { Int($0) ?? -1 }
        
        if numOfUserInputs.contains(-1) {
            print("입력이 잘못되었습니다.")
            continue
        }
        
        if numOfUserInputs.count != 3{
            print("입력이 잘못되었습니다.")
            continue
        }
        
        if numOfUserInputs[0] < 1 || numOfUserInputs[1] < 1 || numOfUserInputs[2] < 1 || numOfUserInputs[0] > 9 || numOfUserInputs[1] > 9 || numOfUserInputs[2] > 9 {
            print("입력이 잘못되었습니다.")
            continue
        }
        
        if numOfUserInputs[0] == numOfUserInputs[1] || numOfUserInputs[0] == numOfUserInputs[2] || numOfUserInputs[1] == numOfUserInputs[2]{
            
            print("입력이 잘못되었습니다.")
            continue
        }
        
        break
    }
    
}

/// 사용자가 입력한 수와 임의로 생성된 수를 비교하여
/// 볼과 스트라이크의 개수를 계산한 배열을 반환하는 함수이다.
///
/// 함수의 인자로 전달되는 Int 배열인 Num의 원소는 3개이고
/// 사용자가 입력한 3개의 수를 의미한다.
///
/// 출력되는 Int형 배열의 원소는 2개이고 첫번쨰 원소는 ball의 수
/// 그리고 두번쨰 원소는 strike의 수를 의미한다.
func returnCountOfBallAndStrike(Num : [Int]) -> [Int] {
    
    var ball : Int = 0
    var strike : Int = 0

    for i in 0...2 {
        if Num[i] != numOfUserInputs[i] && Num.contains(numOfUserInputs[i]) {
            ball += 1
        } else if Num[i] == numOfUserInputs[i] {
            strike += 1
        }
    }
    
    return [ball,strike]
}

func initRandom() -> [Int] {
    
    var Num:[Int] = [0,0,0]
    
    Num[0] = Int.random(in : 1...9)
    
    repeat {
        Num[1] = Int.random(in : 1...9)
    }while Num[0] == Num[1]
    
    repeat {
        Num[2] = Int.random(in : 1...9)
    }while Num[0] == Num[2] || Num[1] == Num[2]
 
   return Num
}

func startGame() {
    
    printMenuAndinputMenu()
    
    let initnum:[Int] = initRandom()

    while gameCount>0 {

        gameCount -= 1
        
        inputGameNum()

        let ballStrike : [Int] = returnCountOfBallAndStrike(Num: initnum)

        if ballStrike[1] == 3 {
            print("사용자 승리...!")
        } else if gameCount == 0 {
            print("컴퓨터 승리...!")
        }
        print("\(ballStrike[1]) 스트라이크, \(ballStrike[0]) 볼")
        print("남은 기회 : \(gameCount)")

    }
}

startGame()

