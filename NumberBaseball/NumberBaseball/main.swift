//
//  NumberBaseball - main.swift
//  Created by Zion, Minsup
//  Copyright © yagom academy. All rights reserved.

import Foundation

func generateRandomNumberList() -> [String] {
    var randomNumberList: Set<String> = []
    
    while randomNumberList.count != 3 {
        let randomNumber = String(Int.random(in: 1...9))
        randomNumberList.insert(randomNumber)
    }
    
    return Array(randomNumberList)
}

func checkStrikeAndBall(_ computerNumberList: [String], _ userNumberList: [String]) -> (strike: Int, ball: Int) {
    var strike = 0
    var ball = 0

    for index in 0..<3 {
        strike += computerNumberList[index] == userNumberList[index] ? 1 : 0
        ball += computerNumberList.contains(userNumberList[index]) ? 1 : 0
    }
    
    ball -= strike
    print("\(strike) 스트라이크, \(ball) 볼")
    return (strike, ball)
}

func isGameOver(_ strike: Int, _ inning: Int) -> Bool {
    if strike == 3 {
        print("사용자 승리!")
        return true
    }
    
    if inning == 0 {
        print("컴퓨터 승리...!")
        return true
    }
    
    print("남은 기회 : \(inning)")
    return false
}

func verifyInputString(_ inputString: String?) -> [String]? {
    guard let userNumberList = inputString?.components(separatedBy: .whitespaces) else { return nil }
    guard userNumberList.count == 3, Set(userNumberList).count == 3 else { return nil }
    
    for userNumber in userNumberList {
        guard let integerNumber = Int(userNumber), 1...9 ~= integerNumber else { return nil }
    }
    
    return userNumberList
}

func playNumberBaseball() {
    let computerNumberList = generateRandomNumberList()
    var inning = 9
    
    while inning != 0 {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.\n입력", terminator: " : ")
        let inputString = readLine()
    
        guard let userNumberList = verifyInputString(inputString) else {
            print("입력이 잘못되었습니다.")
            continue
        }
        
        let strikeAndBall = checkStrikeAndBall(computerNumberList, userNumberList)
        inning -= 1

        if isGameOver(strikeAndBall.strike, inning) {
            break
        }
    }
}

func start() {
    while true {
        print("1. 게임시작\n2. 게임종료\n원하는 기능을 선택해주세요", terminator: " : ")
        let inputMenu = readLine()

        switch inputMenu {
        case "1":
            playNumberBaseball()
        case "2":
            return
        default:
            print("입력이 잘못되었습니다.")
        }
    }
}

start()
