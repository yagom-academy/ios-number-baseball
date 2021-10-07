//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let digitsOfGame = 3

var randomTargetNums: [Int] = generateUniqueRandomNums(from: 1, to: 9)
var randomPlayerNums: [Int] = [Int]()

var remainedRounds = 9
var strikeCounts = 0
var ballCounts = 0

func judgeStrikeAndBall(at: Int) {
    if randomTargetNums[at] == randomPlayerNums[at] {
        strikeCounts += 1
    } else if Set(randomTargetNums).contains(randomPlayerNums[at]) {
        ballCounts += 1
    }
}

func countStrikeAndBall() {
    for order in 0..<digitsOfGame {
        judgeStrikeAndBall(at: order)
    }
}

func generateUniqueRandomNums(from start: Int, to end: Int) -> [Int] {
    var uniqueRandomNums: Set<Int> = Set<Int>()
    
    while uniqueRandomNums.count < digitsOfGame {
        let num = Int.random(in: start...end)
        uniqueRandomNums.insert(num)
    }
    
    return Array(uniqueRandomNums)
}

func presentPlayerNums() {
    randomPlayerNums = generateUniqueRandomNums(from: 1, to: 9)
    
    var playerNums: [String] = []
    for order in 0..<digitsOfGame {
        playerNums.append(String(randomPlayerNums[order]))
    }
    
    print("임의의 수 : \(playerNums.joined(separator: " "))")
}

func decreaseRemainedRounds() {
    remainedRounds -= 1
}

func presentRoundResult() {
    print("\(strikeCounts) 스트라이크 \(ballCounts) 볼")
    print("남은 기회 : \(remainedRounds)")
}

func gameResult() {
    if strikeCounts == digitsOfGame {
        print("플레이어 승리...!")
    } else if remainedRounds == 0 {
        print("컴퓨터 승리...!")
    }
}

func resetStrikeAndBallCounts() {
    strikeCounts = 0
    ballCounts = 0
}

func playBaseballGame() {
    repeat {
        resetStrikeAndBallCounts()
        presentPlayerNums()
        countStrikeAndBall()
        decreaseRemainedRounds()
        presentRoundResult()
    } while remainedRounds > 0 && strikeCounts < digitsOfGame
    gameResult()
}

//MARK: -메뉴구현
let defaultErrorMessage = "입력이 잘못되었습니다"

func presentMenu() {
    print("""
    1. 게임시작
    2. 게임종료
    """)
}

func selectMenu() -> String {
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    let selectedMenu = readLine() ?? ""
    return selectedMenu
}

func operateMenu(menu: String) {
    switch menu {
    case "1":
        playBaseballGame()
    case "2":
        break
    default:
        print(defaultErrorMessage)
        break
    }
}

func runBaseballGame() {
    var selectedMenu: String
    
    repeat {
        presentMenu()
        selectedMenu = selectMenu()
        operateMenu(menu: selectedMenu)
    } while selectedMenu != "2"
    
}

//MARK: -플레이어 숫자 입력

func presentInputForm() {
    print("""
    숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
    중복 숫자는 허용하지 않습니다.
    """)
}

func inputPlayerNums() {
    print("입력 : ", terminator: "")
    guard let input = readLine(), !input.isEmpty else {
        return print(defaultErrorMessage)
    }
}
