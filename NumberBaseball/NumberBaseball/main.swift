//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

var tryCount: Int = 9
var strike = 0
var ball = 0

func makeThreeRandomNumbers() -> Set<Int> {
    var randomNumber: Int
    var randomNumberSet: Set<Int> = []
    while(randomNumberSet.count < 3) {
        randomNumber = Int.random(in: 1...9)
        randomNumberSet.insert(randomNumber)
    }
    return randomNumberSet
}

var computerRandomNumbers:[Int] = Array(makeThreeRandomNumbers())
var userRandomNumbers:[Int] = Array(makeThreeRandomNumbers())

func findNotStrike() -> Array<Int> {
    var result: [Int] = []
    for (userindex, usernumber) in userRandomNumbers.enumerated() {
        if let numberNotStrike = compareForStrike(userNumber: usernumber, index: userindex) {
            result.append(numberNotStrike)
        }
    }
    return result
}

func compareForStrike(userNumber: Int, index: Int) -> Int? {
    for (computerindex, computernumber) in computerRandomNumbers.enumerated() {
        if computernumber == userNumber && computerindex == index {
            strike += 1
            return nil
        }
    }
    return userNumber
}

func findBall(numbersNotStrike:[Int]) { // 매개변수가 스트라이크는 아니지만 볼 일수도 있는 숫자들
    for number in numbersNotStrike {
        ballcount(number: number)
    }
}

func ballcount(number:Int) {
    for computerNumber in computerRandomNumbers {
        if number == computerNumber {
            ball += 1
        }
    }
}

func startGame() {
    strike = 0
    ball = 0
    while tryCount > 0 || strike == 3 {
        userRandomNumbers = Array(makeThreeRandomNumbers())
        print("임의의 수 : ", terminator: "")
        for i in userRandomNumbers {
            print(i, terminator: " ")
        }
        findNotStrike()
        tryCount -= 1
        if strike == 3 {
            print("사용자 승리...!")
        }
        if tryCount == 0 {
            print("컴퓨터 승리...!")
        }
        print("\(strike) 스트라이크, \(ball) 볼")
        print("남은 기회 : \(tryCount)")
    }
}
