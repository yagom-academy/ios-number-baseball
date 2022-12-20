//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let computerNumberArray: [Int]
var numberOfTry = 9

func makeRandomNumberArray() -> [Int] {
    var setNumber: Set<Int> = Set<Int>()
    while setNumber.count != 3 {
        setNumber.insert(Int.random(in: 1...9))
    }
    return Array(setNumber)
}

func countBallStrike(computerArray: [Int], numberArray: [Int]) -> (Int, Int) {
    var countStrike = 0
    var countBall = 0
    for index in 0..<3 {
        guard let findIndex = numberArray.firstIndex(of: computerArray[index]) else {
            continue
        }
        if index == findIndex {
            countStrike += 1
        } else {
            countBall += 1
        }
    }
    return (countStrike, countBall)
}

//computerNumberArray = makeRandomNumberArray()
//
//while numberOfTry != 0 {
//    let randomNumberArray: [Int]
//    let result: (Int, Int)
//    randomNumberArray = makeRandomNumberArray()
//    result = countBallStrike(computerArray: computerNumberArray, numberArray: randomNumberArray)
//    let countStrike = result.0
//    let countBall = result.1
//    print("임의의 수 : ", terminator: "")
//    for number in randomNumberArray {
//        print(number, terminator: " ")
//    }
//    print("\n\(countStrike) 스트라이크, \(countBall) 볼")
//    if countStrike == 3 {
//        break
//    }
//    numberOfTry -= 1
//    print("남은 기회 \(numberOfTry)")
//}
//
//if numberOfTry > 0 {
//    print("사용자 승리!")
//} else {
//    print("컴퓨터 승리...")
//}

func selectMenu() {
    print("1. 게임시작\n2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")

    if let userInput = readLine() {
        if userInput == "1" {
            startGame()
        } else if userInput == "2" {
            print("게임 종료")
        } else {
            print("입력이 잘못 되었습니다.")
        }
    }
}

func startGame() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
//    var userNumberArray: [Int]
    if let inputValue = readLine() {
        let numbers = inputValue.split(separator: " ")
//        userNumberArray[0] = numbers
        print(numbers)
    }
}

func isValidNumberArray(stringNumberArray: [String]) {

}

selectMenu()
