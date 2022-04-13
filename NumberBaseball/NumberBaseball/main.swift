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

func countStrikeOrBall(answerNumber: Array<Int>, tryCount: Int) -> [String : Int] {
    let suggestNumber = Array<Int>(generateThreeNonOverlappingRandomNumbers())
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
    
    var strikeBallCount: [String: Int] = [:]
    strikeBallCount["strike"] = strikeCount
    strikeBallCount["trycount"] = tryCount
    
    return strikeBallCount
}

func gameStart() {
    var answerNumber = Array<Int>()
    var tryCount = 9
    
    answerNumber = Array<Int>(generateThreeNonOverlappingRandomNumbers())
    
    while repeatCheck {
        tryCount -= 1
        let strikeBallCount = countStrikeOrBall(answerNumber: answerNumber, tryCount: tryCount)
        checkGameOver(strikeTryCount: strikeBallCount)
    }
}

func checkGameOver(strikeTryCount: [String : Int]) {
    if strikeTryCount["strike"] == 3 || strikeTryCount["trycount"] == 0 {
        repeatCheck = false
    }
    if strikeTryCount["strike"] == 3 {
        print("사용자 승리...!")
    } else if strikeTryCount["trycount"] == 0 {
        print("컴퓨터 승리...!")
    }
}

gameStart()
