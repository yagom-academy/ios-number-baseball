//
//  NumberBaseball - main.swift
//  Created by shapiro,yun
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var computerNumbers: Array<UInt> = []
let numberOfTry: UInt = 9
var playCount: UInt = 0
typealias BaseballCount = (strike: UInt, ball: UInt)
var baseballCount: BaseballCount = BaseballCount(0,0)
var isUserWin: Bool = false
var isComputerWin: Bool = false

func generateRandomNumber() -> UInt {
    let randomNumber = UInt.random(in: 1...9)
    return randomNumber
}

func generateUserNumbers(userNumbers: Array<UInt>) {
    let convertedNumber = userNumbers.map{"\($0)"}.reduce(""){
        return $0 + " " + $1
    }
    print("임의의 수 :\(convertedNumber)")
}

func generateComputerNumbers() {
    computerNumbers = generateRandomNumbers()
}

func generateRandomNumbers() -> Array<UInt> {
    var randomNumbers: Array<UInt> = []
    while randomNumbers.count < 3 {
        let randomNumber = generateRandomNumber()
        if randomNumbers.contains(randomNumber) == false {
            randomNumbers.append(randomNumber)
        }
    }
    return randomNumbers
}

func generateUserNumbers() -> Array<UInt> {
    generateRandomNumbers()
}

func printComparedNumberResult() {
    if isUserWin == true {
        print("유저 승리...!")
    } else if isComputerWin == true {
        print("컴퓨터 승리...!")
    }
    print("\(baseballCount.strike) 스트라이크, \(baseballCount.ball) 볼")
    print("남은 기회 : \(numberOfTry-playCount)")
}

func checkGameOver() -> Bool {
    if baseballCount.strike == 3 {
        isUserWin = true
        return false
    } else if numberOfTry == playCount {
        isComputerWin = true
        return false
    } else{
        return true
    }
}

func resetCount() {
    baseballCount = (0,0)
}

func compareNumber(with userNumbers: Array<UInt>) {
    generateUserNumbers(userNumbers: userNumbers)
    for i in 1..<userNumbers.count{
        if userNumbers[i] == computerNumbers[i] {
            baseballCount.strike += 1
        } else if computerNumbers.contains(userNumbers[i]) {
            baseballCount.ball += 1
        }
    }
    playCount += 1
}

func startGame() {
    generateComputerNumbers()
    while checkGameOver() {
        compareNumber(with: generateUserNumbers())
        printComparedNumberResult()
        resetCount()
    }
}

startGame()
