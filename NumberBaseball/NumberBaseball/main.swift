//
//  NumberBaseball - main.swift
//  Created by BaekGom,barrd.
//  Copyright © yagom academy. All rights reserved.
//

var repeatCheck = true
let countNumber = 3
let randomNumberRange = 1...9
let arrayRange = 0...2
let gameOverStrikeCount = 3
let gameOverTryCount = 0

func generateThreeNonOverlappingRandomNumbers() -> Set<Int> {
    var randomNumbers = Set<Int>()
    
    while randomNumbers.count < countNumber {
        randomNumbers.insert(Int.random(in: randomNumberRange))
    }
    return randomNumbers
}

func countStrikeOrBall(answerNumber: [Int], tryCount: Int) -> (Int, Int) {
    let suggestNumber = [Int](generateThreeNonOverlappingRandomNumbers())
    var strikeCount = 0
    var ballCount = 0
    
    for arrayLocation in arrayRange {
        if answerNumber[arrayLocation] == suggestNumber[arrayLocation] {
            strikeCount += 1
        } else if suggestNumber.contains(answerNumber[arrayLocation]) {
            ballCount += 1
        }
    }
    
    print("임의의 수 : ", terminator: "")
    for number in suggestNumber {
        print(number,  terminator: " ")
    }
    print()
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
        let strikeTryCount = countStrikeOrBall(answerNumber: randomNumberGeneratedByComputer, tryCount: tryCount)
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

gameStart()
