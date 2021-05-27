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

func makeUserNumber() -> Array<UInt> {
    let userNumber = readLine()!
    let arr = userNumber.split(separator: " ")
    let intArr = arr.map{ UInt($0)! }
    if intArr.count != 3 {
        makeUserNumber()
    }
    return intArr
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
    }
}

func resetCount() {
    ballCount = 0
    strikeCount = 0
}

func compareNumber(userNumbers: Array<UInt>) {
    printUserNumbers(userNumbers: userNumbers)
    for i in 0...userNumbers.count-1 {
        if userNumbers[i] == computerNumbers[i] {
            strikeCount += 1
        } else if computerNumbers.contains(userNumbers[i]) {
            ballCount += 1
        }
    }
    numberOfTry -= 1
}

func selectMenu() {
    print("1. 게임 시작")
    print("2. 게임 종료")
    print("원하는 기능을 선택해 주세요 : ", terminator: " ")
    guard let menu = readLine() else {
        return
    }
    switch menu {
    case "1":
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요")
        startGame()
    case "2":
        return
    default:
        selectMenu()
    }
}

func startGame() {
    makeComputerNumbers()
    while isComputerWin == false && isUserWin == false {
        compareNumber(userNumbers: makeUserNumber())
        checkGameOver()
        printResult()
        resetCount()
    }
}

selectMenu()
