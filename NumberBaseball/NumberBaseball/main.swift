//
//  NumberBaseball - main.swift
//  Created by BaekGom,barrd.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var repeatCheck = true

func generateThreeNonOverlappingRandomNumbers() -> Set<Int> {
    var randomNumbers = Set<Int>()
    
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    return randomNumbers
}

func countStrikeOrBall(answerNumber: Array<Int>, tryCount: Int) -> [String : Int] {
    let suggestNumber = Array<Int>(generateThreeNonOverlappingRandomNumbers())
    var strikeCount = 0
    var ballCount = 0
    
    if answerNumber[0] == suggestNumber[0] {
        strikeCount += 1
    } else if suggestNumber.contains(answerNumber[0]) {
        ballCount += 1
    }
    if answerNumber[1] == suggestNumber[1] {
        strikeCount += 1
    } else if suggestNumber.contains(answerNumber[1]) {
        ballCount += 1
    }
    if answerNumber[2] == suggestNumber[2] {
        strikeCount += 1
    } else if suggestNumber.contains(answerNumber[2]) {
        ballCount += 1
    }
    
    print("""
          임의의 수 : \(suggestNumber)
          \(strikeCount) 스트라이크, \(ballCount) 볼
          남은기회 : \(tryCount)
          """)
    if strikeCount == 3 {
        print("사용자 승리...!")
    }else if tryCount == 0 {
        print("컴퓨터 승리...!")
    }
    
    var strikeBallCount: [String: Int] = [:]
    strikeBallCount["strike"] = strikeCount
    strikeBallCount["trycount"] = tryCount
    
    return strikeBallCount
}

func gameStart() {
    var answerNumber = Set<Int>()
    var tryCount = 9
    
    while answerNumber.count < 3 {
        answerNumber.insert(Int.random(in: 1...9))
    }
    while repeatCheck {
        tryCount -= 1
        let strikeBallCount = countStrikeOrBall(answerNumber: Array<Int>(answerNumber), tryCount: tryCount)
        checkGameOver(strikeTryCount: strikeBallCount)
    }
}

func checkGameOver(strikeTryCount: [String : Int]) {
    if strikeTryCount["strike"] == 3 || strikeTryCount["trycount"] ?? 0 < 1{
        repeatCheck = false
    }
}

gameStart()
