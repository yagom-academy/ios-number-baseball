//
//  NumberBaseball - main.swift
//  Created by Roy and 쿼카 .
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var userInputNumbers: Array<String> = []
let computerNumbers = generateRandomNumbers()
var remainingChangeCount: Int = 9
var strikeCounting = 0
let endGameCount = 3

// 사용자정의를 못만드니 전역변수로 처리하는데, one이라는 숫자대신 변수로
func generateRandomNumbers(range: ClosedRange<Int> = 1...9, numbersCount: Int = 3) -> Array<Int> {
    var randomNumbers: Set<Int> = []
    while randomNumbers.count < numbersCount {
        randomNumbers.insert(Int.random(in: range))
    }
    return Array(randomNumbers)
}

func calculateStrikeBallWith(_ userNumbers: Array<Int>, and computerNumbers: Array<Int>) -> (strikeResult: Int, ballResult: Int) {
    let strikePoint = 1
    var (strikeCount, ballCount) = (Int.zero, Int.zero)
    for index in userNumbers.indices {
        strikeCount += userNumbers[index] == computerNumbers[index] ? strikePoint : .zero
    }
    ballCount = (Set(computerNumbers).intersection(userNumbers).count - strikeCount)
    strikeCounting += strikeCount
    return (strikeCount, ballCount)
}

func printPlayingGameMessage(userNumbers: Array<Int> ,ballCount: Int ,strikeCount: Int) {
    let (strikeDescription, ballDescription) =  ("스트라이크," ,"볼")
    let (randomNumbersDescription, remainingChanceDescription) = ("임의의 수 : " ,"남은 기회 :")
    let squareBrakets: CharacterSet = ["[","]"]
    
    print("\(randomNumbersDescription) \(userNumbers.description.replacingOccurrences(of: ",", with: "").trimmingCharacters(in: squareBrakets))")
    print("\(strikeCount) \(strikeDescription) \(ballCount) \(ballDescription) ")
    print("\(remainingChanceDescription) \(remainingChangeCount)")
}

func judgeGameResult() {
    let (userWin, computerWin) = ("사용자의 승리...!", "컴퓨터의 승리...!")
    print(remainingChangeCount == .zero ? computerWin : userWin)
}

func selectMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    
    let input: String? = readLine()
    
    switch input {
    case "1":
        playGame()
    case "2":
        return
    default:
        print("입력이 잘못되었습니다.")
        selectMenu()
    }
}

func receiveInputNumbers() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫지는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    
    guard let inputNumbers = readLine() else { return }
    userInputNumbers.append(contentsOf: inputNumbers.components(separatedBy: ""))
    }


func verifyNumbers(to numbers: Array<String>) -> Array<Int> {
   return [0]
}

func playGame() {
    let chancePoint = 1
    
    while remainingChangeCount > .zero {
        let userNumbers = generateRandomNumbers()
        let (strikeResult, ballResult) = calculateStrikeBallWith(userNumbers, and: computerNumbers)
        remainingChangeCount -= chancePoint
        printPlayingGameMessage(userNumbers: userNumbers, ballCount: ballResult, strikeCount: strikeResult)
        if strikeCounting == endGameCount { break }
    }
    judgeGameResult()
}
selectMenu()

"""
목표 종료 시간!! 10 시 30분

1. 다음 함수를 구현합니다
i. 사용자 메뉴를 출력하고 메뉴를 입력받는 함수 (게임시작, 게임종료)
ii. 게임 숫자를 입력받는 함수
2. 게임 메뉴 및 사용자가 입력하는 세 개의 숫자의 유효성을 검증하는 과정을 구현합니다
3. 사용자가 입력한 수와 임의로 생성한 정수를 비교하는 게임을 진행하도록 구현합니다
"""
