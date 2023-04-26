//
//  NumberBaseball - main.swift
//  Created by myungsun, yyss99.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func makeUniqueRandomNumbers() -> [Int] {
    var randomNumbers = Set<Int>()
    
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    
    return Array(randomNumbers)
}

func getBallAndStrikeResult(of userNumbers: [Int]) -> (Int, Int) {
    let sameNumbers = computerNumbers.filter { userNumbers.contains($0) }
    var ballCount = 0
    var strikeCount = 0
    
    for number in sameNumbers {
        if computerNumbers.firstIndex(of: number) == userNumbers.firstIndex(of: number) {
            strikeCount += 1
        }
    }
    ballCount = sameNumbers.count - strikeCount
    
    return (ballCount, strikeCount)
}

func startGame() {
    while count > 0 {
        let userNumbers = makeUniqueRandomNumbers()
        let (ballCount, strikeCount) = getBallAndStrikeResult(of: userNumbers)

        print("임의의 수 : \(userNumbers.map { String($0) }.joined(separator: " "))")
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")

        count -= 1

        if count > 0 {
            print("남은 기회 : \(count)")
        }

        if strikeCount == 3 {
            print("사용자 승리!")
            break
        }
        print()
    }
    if count == 0 {
        print("컴퓨터 승리...!")
    }
}

func showMenu() {
    while true {
        print("1. 게임시작 \n2. 게임종료 \n원하는 기능을 선택해주세요 : ", terminator: "")
        let menuChoice = readLine() ?? ""
        let startOption = "1"
        let endOption = "2"
        
        if menuChoice == startOption {
            print("start Game")
        } else if menuChoice == endOption {
            print("end Game")
            break
        } else {
            print("입력이 잘못되었습니다.")
        }
    }
}

func checkNumbers(for userInput: String) -> Bool {
    let invaildInput = -1
    let vaildNumberLength = 1
    let vaildNumberCount = 3
    let separatedInput = userInput.split(separator: " ").map { Int($0) ?? invaildInput }
    
    if separatedInput.contains(invaildInput)
        || separatedInput.filter({ String($0).count == vaildNumberLength }).count != vaildNumberCount {
        return false
    }
    return true
}

func inputUserGameNumber() {
    while true {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.\n입력 : ", terminator: "")
        if let userInput = readLine(), checkNumbers(for: userInput) {
                
        } else {
            print("입력이 잘못되었습니다")
        }
    }
}

let computerNumbers = makeUniqueRandomNumbers()
var count = 9

showMenu()
