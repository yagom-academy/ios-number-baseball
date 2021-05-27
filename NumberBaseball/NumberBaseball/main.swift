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

func makeUserNumbers() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력: ", terminator:" ")
    let userNumber = readLine()!
    let intArr = userNumber.split(separator: " ").map { UInt($0)! }
    if checkUserNumberRange(userNumbers: intArr) && checkUserNumberCount(userNumbers: intArr) && checkDuplicatedNumber(userNumbers: intArr) {
        compareNumber(userNumbers: intArr)
    } else {
        makeUserNumbers()
    }
}

func checkDuplicatedNumber(userNumbers: Array<UInt>) -> Bool {
    let ConvertedNumbers = Set(userNumbers)
    if(userNumbers.count != ConvertedNumbers.count)
    {
        print("입력이 잘못되었습니다")
        return false
    }
    return true
}

func checkUserNumberRange(userNumbers: Array<UInt>) -> Bool{
    for number in userNumbers {
        if number > 9 || number < 1 {
            print("입력이 잘못되었습니다.")
            return false
        }
    }
    return true
}

func checkUserNumberCount(userNumbers: Array<UInt>) -> Bool {
    if userNumbers.count != 3 {
        print("입력이 잘못되었습니다.")
        return false
    }
    return true
}

func makeComputerNumbers() {
    while computerNumbers.count < 3 {
        makeRandomNumber()
        if computerNumbers.contains(randomNumber) == false {
            computerNumbers.append(randomNumber)
        }
    }
    print(computerNumbers)
    
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
    for i in 0...userNumbers.count-1 {
        if userNumbers[i] == computerNumbers[i] {
            strikeCount += 1
        } else if computerNumbers.contains(userNumbers[i]) {
            ballCount += 1
        }
    }
    numberOfTry -= 1
}

func printMenu() {
    print("1. 게임 시작")
    print("2. 게임 종료")
    print("원하는 기능을 선택해 주세요 : ", terminator: " ")
}


func selectMenu() {
    printMenu()
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
        print("입력이 잘못되었습니다")
        selectMenu()
    }
}

func startGame() {
    makeComputerNumbers()
    while isComputerWin == false && isUserWin == false {
        makeUserNumbers()
        checkGameOver()
        printResult()
        resetCount()
    }
}

selectMenu()
