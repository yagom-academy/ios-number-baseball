//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var trialRoundsCount : Array<Int> = [1,2,3,4,5,6,7,8,9]
var remainedTrialRounds : Int = trialRoundsCount.count - 1
var computerGameNumber : Set<Int> = makeRandomGameNumber()
var gameNumbers : Array<Int> = Array(computerGameNumber)

var userGameNumber : Set<Int> = makeRandomGameNumber()
var arrUserGameNumber : Array<Int> = Array(userGameNumber)

// 임의의 수를 계속 생성해야한다. -> 세트를 계속 생성한다. -> 세트를 계속 배열로 바꿔준다.

// 게임넘버와 유저넘버가 일치하지않으면서(자리수가 일치하지않으면서)



func compareNumber() {
    var strikeCount = 0
    var ballCount = 0
    for i in 0...2 {
        if gameNumbers[i] == arrUserGameNumber[i] {     // 자리수가 같고, 숫자도 같으면 스트라이크카운트 + 1
            strikeCount += 1
        }
        if gameNumbers[i] != arrUserGameNumber[i] && gameNumbers.contains(arrUserGameNumber[i]) {       // 자리수와 숫자가 같지않고, 숫자를 포함하면 볼카운트 + 1
            ballCount += 1
        }
    }
    if strikeCount == 3 {
        print("사용자 승리...")
        return
    }
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
}



print("임의의 수 : \(arrUserGameNumber[0]) \(arrUserGameNumber[1]) \(arrUserGameNumber[2])")
compareNumber()


func makeRandomGameNumber() -> Set<Int> {
    var randomGameNumbers : Set<Int> = []
    while randomGameNumbers.count < 3 {
        randomGameNumbers.insert(Int.random(in: 1...9))
    }
    return randomGameNumbers
}


func playNumberBaseballGame (round : Int) {
    
    var trialRoundsCount : Array<Int> = [1,2,3,4,5,6,7,8,9]
    var remainedTrialRounds : Int = trialRoundsCount.count - round
    
    
    if remainedTrialRounds == 0 {
        print("남아있는 기회가 없습니다.")
        return
    }
}





