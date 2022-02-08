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


func compareUserAndComputer() {
    var strike = 0
    var ball = 0
    if computerRandomNumbers[0] == userRandomNumbers[0] {
        strike += 1
    } else {
        ball += 1
    }
    if computerRandomNumbers[1] == userRandomNumbers[1] {
        strike += 1
    } else {
        ball += 1
    }
    if computerRandomNumbers[2] == userRandomNumbers[2] {
        strike += 1
    } else {
        ball += 1
    }
    print(strike, ball)
}

func findNotStrike() -> Array<Int> {
    var result: [Int] = []
    for (usernumber, userindex) in userRandomNumbers.enumerated() {
        if let numberNotStrike = compareForStrike(userNumber: usernumber, index: userindex) {
            result.append(numberNotStrike)
        }
    }
    return result
}

func compareForStrike(userNumber: Int, index: Int) -> Int? {
    for (computernumber, computerindex) in computerRandomNumbers.enumerated() {
        if computernumber == userNumber && computerindex == index {
            strike += 1
        }
        if userRandomNumbers.last == computernumber {
            return userNumber
        }
    }
    return nil
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
