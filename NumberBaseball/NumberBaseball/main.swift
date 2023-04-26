//
//  NumberBaseball - main.swift
//  Created by Zion, Minsup
//  Copyright © yagom academy. All rights reserved.

import Foundation

func generateRandomNumberList() -> [String] {
    var randomNumberList: Set<String> = []
    
    while randomNumberList.count != 3 {
        let test = String(Int.random(in: 1...9))
        randomNumberList.insert(test)
    }
    
    return Array(randomNumberList)
}

func checkStrikeAndBall(_ computerNumberList: [String], _ userNumberList: [String]) -> (strike: Int, ball: Int) {
    var strikeCount = 0
    var ballCount = 0

    for index in 0..<3 {
        strikeCount += computerNumberList[index] == userNumberList[index] ? 1 : 0
        ballCount += computerNumberList.contains(userNumberList[index]) ? 1 : 0
    }
    
    ballCount -= strikeCount
    print("""
          임의의 수 : \(userNumberList[0]) \(userNumberList[1]) \(userNumberList[2])
          \(strikeCount) 스트라이크, \(ballCount) 볼
          """)
    return (strikeCount, ballCount)
}

func isGameOver(_ strikeCount: Int, _ inning: Int) -> Bool {
    if strikeCount == 3 {
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

func verifyInputNumberList(_ inputNumberList: String?) -> [String]? {
    guard let userNumberList = inputNumberList?.components(separatedBy: .whitespaces) else { return  nil }
    guard userNumberList.count == 3, Set(userNumberList).count == 3 else { return nil }
    guard userNumberList.filter({
        guard let integerNumber = Int($0), integerNumber <= 9 && integerNumber >= 1 else { return false }
        return true
    }).count == 3 else { return nil }
    
    
    return userNumberList
}

func startNumberBaseball() {
    let computerNumberList = generateRandomNumberList()
    var inning = 9
    
    while inning != 0 {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.\n입력", terminator: " : ")
        let inputNumberList = readLine()
    
        guard let userNumberList = verifyInputNumberList(inputNumberList) else {
            print("입력이 잘못되었습니다.")
            continue
        }
        
        let strikeAndBallCount = checkStrikeAndBall(computerNumberList, userNumberList)
        inning -= 1

        if isGameOver(strikeAndBallCount.strike, inning) {
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
            startNumberBaseball()
        case "2":
            return
        default:
            print("입력이 잘못되었습니다.")
        }
    }
}

start()
