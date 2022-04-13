//
//  NumberBaseball - main.swift
//  Created by BaekGom,barrd.
//  Copyright © yagom academy. All rights reserved.
//

var repeatCheck = true

func generateThreeNonOverlappingRandomNumbers() -> Set<Int> {
    var randomNumbers = Set<Int>()
    let countNumber = 3
    let randomNumberRange = 1...9
    
    while randomNumbers.count < countNumber {
        randomNumbers.insert(Int.random(in: randomNumberRange))
    }
    return randomNumbers
}

func countStrikeOrBall(answerNumber: [Int], tryCount: Int) -> [String: Int] {
    let suggestNumber = [Int](generateThreeNonOverlappingRandomNumbers())
    let arrayRange = 0...2
    var strikeCount = 0
    var ballCount = 0
    var StringSuggestNumber: String = String()
    
    for arrayLocation in arrayRange {
        StringSuggestNumber += String(suggestNumber[arrayLocation])
    }
    
    StringSuggestNumber.insert(" ", at: StringSuggestNumber.index(StringSuggestNumber.startIndex, offsetBy: 1))
    StringSuggestNumber.insert(" ", at: StringSuggestNumber.index(StringSuggestNumber.startIndex, offsetBy: 3))
    
    for arrayLocation in arrayRange {
        if answerNumber[arrayLocation] == suggestNumber[arrayLocation] {
            strikeCount += 1
        } else if suggestNumber.contains(answerNumber[arrayLocation]) {
            ballCount += 1
        }
    }
    
    print("""
          임의의 수 : \(StringSuggestNumber)
          \(strikeCount) 스트라이크, \(ballCount) 볼
          남은기회 : \(tryCount)
          """)
    
    var strikeBallCount = [String: Int]()
    strikeBallCount["strike"] = strikeCount
    strikeBallCount["trycount"] = tryCount
    
    return strikeBallCount
}

func gameStart() {
    let answerNumbers = [Int](generateThreeNonOverlappingRandomNumbers())
    var tryCount = 9
    
    while repeatCheck {
        tryCount -= 1
        let strikeBallCount = countStrikeOrBall(answerNumber: answerNumbers, tryCount: tryCount)
        checkGameOver(strikeTryCount: strikeBallCount)
    }
}

func checkGameOver(strikeTryCount: [String: Int]) {
    let gameOverStrikeCount = 3
    let gameOverTryCount = 0
    
    if strikeTryCount["strike"] == gameOverStrikeCount || strikeTryCount["trycount"] == gameOverTryCount {
        repeatCheck = false
    }
    
    if strikeTryCount["strike"] == gameOverStrikeCount {
        print("사용자 승리...!")
    } else if strikeTryCount["trycount"] == gameOverTryCount {
        print("컴퓨터 승리...!")
    }
}

gameStart()
