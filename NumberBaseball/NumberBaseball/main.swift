//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
//JM check
import Foundation

var RandomNum : [Int] = [1,2,3]

var GameCount : Int = 9


func initRandom() -> [Int] {
    
    var Num:[Int] = [0,0,0]
    
    Num[0] = Int.random(in: 1...9)
    
    repeat {
        Num[1] = Int.random(in: 1...9)
    }while Num[0] == Num[1]
    
    repeat {
        Num[2] = Int.random(in: 1...9)
    }while Num[0] == Num[2] || Num[1] == Num[2]
 
   return Num
}

func returnResult(Num:[Int]) -> [Int] {
    var ball:Int = 0
    var strike:Int = 0

    for i in 0...2{
        if Num[i] != RandomNum[i] && Num.contains(RandomNum[i]) {
            ball += 1
        }else if Num[i] == RandomNum[i] {
            strike += 1
        }
    }
    return [ball,strike]
}

func startGame() {

    while GameCount>0 {

        GameCount -= 1

        let initnum:[Int] = initRandom()

        let ballStrike:[Int] = returnResult(Num: initnum)

        print("임의의 수 : \(initnum[0]),\(initnum[1]),\(initnum[2])")

        if ballStrike[1] == 3 {
            print("사용자 승리...!")
        }else if GameCount == 0 {
            print("컴퓨터 승리...!")
        }
        print("\(ballStrike[1]) 스트라이크, \(ballStrike[0]) 볼")
        print("남은 기회 : \(GameCount)")

    }
}

startGame()
