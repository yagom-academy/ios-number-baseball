//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

var computerRandomNumbers:[Int] = makeThreeRandomNumbers()
var tryCount: Int = 9

func startGame() {
    var userStrikeCount = 0
    var userBallCount = 0
    var userRandomNumbers: [Int]
    while tryCount > 0 && userStrikeCount < 3 {
        userStrikeCount = 0
        userBallCount = 0
        userRandomNumbers = makeThreeRandomNumbers()
        print("임의의 수 : ", terminator: "")
        for userNumber in userRandomNumbers {
            print(userNumber, terminator: " ")
        }
        print()
        (userStrikeCount, userBallCount) = checkBall(notStrikeNumbers: findNotStrike(userStrikeCount: userStrikeCount, userNumbers: userRandomNumbers), userBallCount: userBallCount)
        tryCount -= 1
        if userStrikeCount == 3 {
            print("사용자 승리...!")
        }
        if tryCount == 0 {
            print("컴퓨터 승리...!")
        }
        print("\(userStrikeCount) 스트라이크, \(userBallCount) 볼")
        print("남은 기회 : \(tryCount)")
    }
}

func makeThreeRandomNumbers() -> [Int] {
    var randomNumbers: Set<Int> = []
    while(randomNumbers.count < 3) {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomNumbers)
}

func findNotStrike(userStrikeCount: Int, userNumbers: [Int]) -> ([Int], Int) {
    var notStrikeNumbers: [Int] = []
    var strikeCount = userStrikeCount //var
    for (userIndex, userNumber) in userNumbers.enumerated() {
        if let (notStrikeNumber, strikeCount2) = countStrike(userNumber: userNumber, userIndex: userIndex, userStrikeCount: strikeCount) {
            strikeCount = strikeCount2
            if let notStrikeNum = notStrikeNumber {
                notStrikeNumbers.append(notStrikeNum)
            }
            
        }
    }
    return (notStrikeNumbers, strikeCount)
}

func countStrike(userNumber: Int, userIndex: Int, userStrikeCount: Int) -> (Int?, Int)? {
    var strikeCount = userStrikeCount
    for (computerIndex, computerNumber) in computerRandomNumbers.enumerated() {
        if computerNumber == userNumber && computerIndex == userIndex {
            strikeCount += 1
            return (nil, strikeCount)
        }
    }
    return (userNumber, strikeCount)
}

func checkBall(notStrikeNumbers: ([Int], Int), userBallCount: Int) -> (Int, Int) {
    var ballCount = userBallCount
    let strikeCount = notStrikeNumbers.1
    for checkNumber in notStrikeNumbers.0 {
        ballCount = countBall(userNumber: checkNumber, userBallCount: ballCount)
    }
    return (strikeCount, ballCount)
}

func countBall(userNumber: Int, userBallCount: Int) -> Int {
    var ballCount = userBallCount
    for computerNumber in computerRandomNumbers {
        if userNumber == computerNumber {
            ballCount += 1
        }
    }
    return ballCount
}

print(computerRandomNumbers)
startGame()
