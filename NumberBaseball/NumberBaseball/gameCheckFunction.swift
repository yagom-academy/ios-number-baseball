//
//  gameCheckFunction.swift
//  NumberBaseball
//
//  Created by 천승현 on 2022/12/23.
//

import Foundation

func checkGameResult(userNumbers: [String]) {
    let userRandomNumbers = userNumbers.compactMap{ Int($0) }
    var strikeCount: Int = 0
    var ballCount: Int = 0
    (strikeCount, ballCount) = compareNumbers(userRandomNumbers, with: computerNumbers)
    reduceLeftCount()
    if isThreeStrike(strike: strikeCount) {
        isUserWin = true
    }
    printGameResult(strike: strikeCount, ball: ballCount, leftCount: leftCount, isUserWin: isUserWin)
}

func compareNumbers(_ userNumbers: [Int], with computerNumbers: [Int]) -> (Int, Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    print("임의의 수 : ", terminator: "")
    userNumbers.forEach{print("\($0)", terminator: " ")}
    
    (0..<computerNumbers.count).forEach{ index in
        guard computerNumbers[index] != userNumbers[index] else {
            strikeCount += 1
            return
        }
        guard !computerNumbers.contains(userNumbers[index]) else {
            ballCount += 1
            return
        }
    }
    return (strikeCount, ballCount)
}

func reduceLeftCount() {
    leftCount -= 1
}

func isThreeStrike(strike strikeCount: Int) -> Bool {
    return strikeCount == 3 ? true : false
}

func printGameResult(strike strikeCount: Int, ball ballCount: Int, leftCount: Int, isUserWin: Bool) {
    print("\n\(strikeCount) 스트라이크, \(ballCount) 볼")
    if leftCount != 0, !isUserWin {
        print("남은 기회 : \(leftCount)")
    }
}
