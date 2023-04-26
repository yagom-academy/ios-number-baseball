//
//  NumberBaseball - main.swift
//  Created by Zion, Minsup
//  Copyright © yagom academy. All rights reserved.

import Foundation

var inning = 9

func generateRandomNumberList() -> [String] {
    var randomNumberList: Set<String> = []
    
    while randomNumberList.count != 3 {
        let test = String(Int.random(in: 1...9))
        randomNumberList.insert(test)
    }
    
    return Array(randomNumberList)
}

func checkStrikeAndBall(_ computerNumberList: [String], _ randomNumberList: [String]) -> (strike: Int, ball: Int) {
    var strikeCount = 0
    var ballCount = 0

    for index in 0..<3 {
        strikeCount += computerNumberList[index] == randomNumberList[index] ? 1 : 0
        ballCount += computerNumberList.contains(randomNumberList[index]) ? 1 : 0
    }
    
    ballCount -= strikeCount
    return (strikeCount, ballCount)
}

func isGameOver(_ strikeCount: Int, _ turnCount: Int) -> Bool {
    if strikeCount == 3 {
        print("사용자 승리!")
        return true
    }
    
    if turnCount == 0 {
        print("컴퓨터 승리...!")
        return true
    }
    
    print("남은 기회 : \(turnCount)")
    return false
}

func startNumberBaseball() {
    let computerNumberList = generateRandomNumberList()

    while inning != 0 {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.\n입력", terminator: " : ")
        let inputNumberList = readLine()
    
        guard let userNumberList = inputNumberList?.components(separatedBy: .whitespaces),
              userNumberList.count == 3,
              Set(userNumberList).count == 3,
              userNumberList.filter({ stringNumber in
                  guard let integerNumber = Int(stringNumber), integerNumber <= 9 && integerNumber >= 1 else { return false }
                  return true
              }).count == 3
        else {
            print("입력이 잘못되었습니다.")
            continue
        }
                
        let randomNumberList = userNumberList
        let strikeAndBallCount = checkStrikeAndBall(computerNumberList, userNumberList)

        inning -= 1
        print("""
              임의의 수 : \(randomNumberList[0]) \(randomNumberList[1]) \(randomNumberList[2])
              \(strikeAndBallCount.strike) 스트라이크, \(strikeAndBallCount.ball) 볼
              """)


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
