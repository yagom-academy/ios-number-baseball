//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

var leftLife: Int = 9
var comNumbers: [String] = []
var userNumbers: [String] = []

func startGame() {
    leftLife = 9
    comNumbers = makeRandomNumbers()
    userNumbers = []
    // print("-------------새 게임이 시작되었습니다.--------------")
    // print("정답 넘버: ", comNumbers )
    judgeNumbers()
    
}

func makeRandomNumbers() -> [String] {
    var randomNumbersArray: Set<String> = []
   
    while randomNumbersArray.count < 3 {
        randomNumbersArray.insert(String(Int.random(in: 1...9)))
    }
    return [String](randomNumbersArray)
}

func judgeBall(at index: Int) -> Int {
    if comNumbers.contains(userNumbers[index]) {
        return 1
    }
    return 0
}

func judgeStrike(at index: Int) -> Int {
    if comNumbers[index] == userNumbers[index] {
        return 1
    }
    return 0

}

func judgeNumbers() {
    userNumbers = makeRandomNumbers()
    judgeGame()
}

func judgeGame() {
    var ballCount: Int = 0
    var strikeCount: Int = 0

    for i in 0...2 {
       ballCount += judgeBall(at: i)
    }
    
    for i in 0...2 {
        ballCount -= judgeStrike(at: i)
        strikeCount += judgeStrike(at: i)
        
    }
    print("임의의 수 : ", userNumbers.joined(separator: " "))
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    
    
    leftLife -= 1
    if leftLife > 0 && strikeCount < 3 {

        print("남은 기회 : ", leftLife)
        judgeNumbers()
     } else if leftLife > 0 && strikeCount == 3 {
        print("남은 기회 : ", leftLife)
        print("인간 승리")
        // print("-------------게임이 종료되었습니다.--------------")
        // startGame()    // 로 복귀
     } else  {
        print("남은 기회 : ", leftLife)
        print("컴퓨터 승리...!")
        // print("-------------게임이 종료되었습니다.--------------")
        // startGame() // 로 복귀
    }

}

startGame()
