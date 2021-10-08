//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var targetNumbers: [Int] = []
var tryCount = 9
var isUserWin = false

func playNumberBaseballGame() {
    // 전역 변수로 선언 되었기 때문에 새로운 게임에서
    // 값을 초기화 해주어야 함!
    targetNumbers = createRandomNumbers()
    isUserWin = false
    tryCount = 9
    
    while tryCount > 0 && isUserWin == false {
        let strikeCount = playRound()
        
        isUserWin = isThreeStrike(count: strikeCount)
        printTryCount()
    }
    printWinner()
}

func playRound() -> Int {
    let randomNumbers = createRandomNumbers()
    printRandomNumbers(numbers: randomNumbers)
    
    let score = compare(randomNumbers, with: targetNumbers)
    printStrikeAndBall(score: score)
    
    return score.strike
}

func createRandomNumbers(range: ClosedRange<Int> = 1...9, count: Int = 3) -> [Int] {
    var resultNumbers: Set<Int> = []
    
    repeat {
        let randomNumber: Int = Int.random(in: range)
        resultNumbers.insert(randomNumber)
    } while resultNumbers.count < count
    
    return resultNumbers.shuffled()
}

func printRandomNumbers(numbers: [Int]) {
    print("임의의 수 : ", terminator: "")
    print(convertIntArrayToString(numbers))
}

func convertIntArrayToString(_ array: [Int]) -> String {
    let resultString: String = array.map { String($0) }.joined(separator: " ")
    
    return resultString
}

func compare(_ randomNumbers: [Int], with targetNumbers: [Int]) -> (strike: Int, ball: Int) {
    var score: (strike: Int, ball: Int) = (0, 0)
    
    for i in randomNumbers.indices {
        if randomNumbers[i] == targetNumbers[i] {
            score.strike += 1
        } else if targetNumbers.contains(randomNumbers[i]) && targetNumbers[i] != randomNumbers[i] {
            score.ball += 1
        }
    }
    
    return score
}

func printStrikeAndBall(score: (strike: Int, ball: Int)) {
    print("\(score.strike) 스트라이크, \(score.ball) 볼")
}

func printWinner() {
    if isUserWin {
        print("사용자 승리!")
    } else {
        print("컴퓨터 승리...!")
    }
}

func printTryCount() {
    if isUserWin == false {
        tryCount = tryCount - 1
        print("남은 기회 : \(tryCount)")
    }
}

func isThreeStrike(count: Int) -> Bool {
    return count == 3
}

func managementGame() {
    printMenu()
    
    guard let input = readLine() else {
        return
    }
    
    checkMenuInput(input: input)
}

func printMenu() {
    let menuSentence = """
    1. 게임 시작
    2. 게임 종료
    원하는 기능을 선택해주세요 :
    """
    print(menuSentence, terminator: "")
}

func checkMenuInput(input: String) {
    switch input {
    case "1":
        playNumberBaseballGame()
    case "2":
        return
    default :
        printInvalidInput()
    }
    managementGame()
}

func printInvalidInput() {
    print("입력이 잘못되었습니다.")
}

managementGame()
