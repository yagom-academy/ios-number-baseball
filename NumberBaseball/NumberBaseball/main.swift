//
//  NumberBaseball - main.swift
//  Created by BaekGom,barrd.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

var repeatCheck = true
let countNumber = 3
let randomNumberRange = 1...9
let arrayRange = 0...2
let gameOverStrikeCount = 3
let gameOverTryCount = 0

func selectMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    let userSelectMenu = readLine()
    
    if(userSelectMenu == "1"){
        repeatCheck = true
        gameStart()
        selectMenu()
    }else if(userSelectMenu == "2"){
        print("", terminator: "")
    }else{
        print("입력이 잘못되었습니다")
        selectMenu()
    }
}

func userInputNumbers() -> String {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    let userInput = readLine() ?? ""
    
    if confirmUserInputNumbers(userInputNumbers: userInput) {
        return userInput
    }else{
        print("입력이 잘못되었습니다")
        return userInputNumbers()
    }
}

func confirmUserInputNumbers(userInputNumbers : String) -> Bool {
    if userInputNumbers.isEmpty || userInputNumbers.split(separator: " ").count != 3 || userInputNumbers.filter({$0.isNumber }).count != 3 || Set(userInputNumbers).count != 4 {
        return false
    }else{
        return true
    }
}

func generateThreeNonOverlappingRandomNumbers() -> Set<Int> {
    var randomNumbers = Set<Int>()
    
    while randomNumbers.count < countNumber {
        randomNumbers.insert(Int.random(in: randomNumberRange))
    }
    return randomNumbers
}

func countStrikeOrBall(answerNumber: [Int], tryCount: Int, userSuggestNumbers: String) -> (Int, Int) {
    var userSuggestThreeNumbers = [Int]()
    let userSuggestNumbersSplit = userSuggestNumbers.components(separatedBy: " ")
    userSuggestThreeNumbers = userSuggestNumbersSplit.map{Int($0) ?? 0}
    var strikeCount = 0
    var ballCount = 0
    
    for arrayLocation in arrayRange {
        if answerNumber[arrayLocation] == userSuggestThreeNumbers[arrayLocation] {
            strikeCount += 1
        } else if userSuggestThreeNumbers.contains(answerNumber[arrayLocation]) {
            ballCount += 1
        }
    }
    
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    print("남은기회 : \(tryCount)")
    let strikeTryCount: (Int, Int) = (strikeCount, tryCount)
    
    return strikeTryCount
}

func gameStart() {
    let randomNumberGeneratedByComputer = [Int](generateThreeNonOverlappingRandomNumbers())
    var tryCount = 9
    
    while repeatCheck {
        tryCount -= 1
        let strikeTryCount = countStrikeOrBall(answerNumber: randomNumberGeneratedByComputer, tryCount: tryCount, userSuggestNumbers: userInputNumbers())
        checkGameOver(strikeTryCount: strikeTryCount)
    }
}

func checkGameOver(strikeTryCount: (Int, Int)) {
    if strikeTryCount.0 == gameOverStrikeCount || strikeTryCount.1 == gameOverTryCount {
        repeatCheck = false
    }
    
    if strikeTryCount.0 == gameOverStrikeCount {
        print("사용자 승리…!")
    } else if strikeTryCount.1 == gameOverTryCount {
        print("컴퓨터 승리…!")
    }
}
 
selectMenu()
