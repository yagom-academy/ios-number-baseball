//
//  NumberBaseball - main.swift
//  Created by shapiro,yun
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var computerNumbers: Array<UInt> = []
var numberOfTry: UInt = 9
var ballCount: UInt = 0
var strikeCount: UInt = 0
var randomNumber: UInt = 0
var isUserWin: Bool = false
var isComputerWin: Bool = false

func makeRandomNumber() {
    randomNumber = UInt.random(in: 1...9)
}

func printUserNumbers(userNumbers: Array<UInt>) {
    let convertedNumber = userNumbers.map{"\($0)"}.reduce("") {
        return $0 + " " + $1
    }
    print("임의의 수 : \(convertedNumber)")
}

func makeComputerNumbers() {
    while computerNumbers.count < 3 {
        makeRandomNumber()
        if computerNumbers.contains(randomNumber) == false {
            computerNumbers.append(randomNumber)
        }
    }
}

func makeUserNumbers() -> Array<UInt> {
    var userNumbers: Array<UInt> = []
    while userNumbers.count < 3 {
        makeRandomNumber()
        if userNumbers.contains(randomNumber) == false {
            userNumbers.append(randomNumber)
        }
    }
    return userNumbers
}

func printResult() {
    if isUserWin == true {
        print("유저 승리...!")
    } else if isComputerWin == true {
        print("컴퓨터 승리...!")
    }
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    print("남은 기회 : \(numberOfTry)")
}

func checkGameOver () {
    if strikeCount == 3{
        isUserWin = true
        return
    } else if numberOfTry == 0{
        isComputerWin = true
        return
    } else {
        numberOfTry -= 1
    }
}

func resetCount() {
    ballCount = 0
    strikeCount = 0
}
