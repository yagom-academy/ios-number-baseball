//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var tryNumber = 9
let validateComputerArray: [Int] = randomChoice()
for _ in 0...tryNumber {
    let validateUserArray: [Int] = randomChoice()
    let strikeCount = strike(computerRandomArray: validateComputerArray, userRandomArray: validateUserArray)
    let ballCount = commonElement(computerRandomArray: validateComputerArray, userRandomArray: validateUserArray) - strikeCount

    print("임의의수 :", terminator: " ")
    validateUserArray.forEach { element in
        print(element, terminator: " ")
    }
    print("\n(strikeCount) 스트라이크, (ballCount) 볼", terminator: " ")
    if strikeCount == 3 {
        print("- 사용자 승리")
        break
    }
    print("\n남은기회: (tryNumber)")

    if tryNumber == 0 {
        print("컴퓨터 승리...!")
    }
    tryNumber -= 1
}

func randomChoice() -> [Int] {
    var ranArray:[Int] = []
    var ranSet:Set<Int> = []
    while ranSet.count < 3 {
        let ranNum = Int.random(in: 1...9)
        ranSet.insert(ranNum)
    }
    ranArray = Array<Int>(ranSet)

    return ranArray
}

func commonElement(computerRandomArray: [Int], userRandomArray: [Int]) -> Int {
    var commonElementCount = 0
    if computerRandomArray.contains(userRandomArray[0]) {
        commonElementCount += 1
    }
    if computerRandomArray.contains(userRandomArray[1]) {
        commonElementCount += 1
    }
    if computerRandomArray.contains(userRandomArray[2]) {
        commonElementCount += 1
    }
    return commonElementCount
}

func strike(computerRandomArray: [Int], userRandomArray: [Int]) -> Int {
    var strikeCount = 0
    if computerRandomArray[0] == userRandomArray[0] {
        strikeCount += 1
    }
    if computerRandomArray[1] == userRandomArray[1] {
        strikeCount += 1
    }
    if computerRandomArray[2] == userRandomArray[2] {
        strikeCount += 1
    }
    return strikeCount
}
