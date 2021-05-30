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

func generateRandomNumber() -> UInt {
    let randomNumber = UInt.random(in: 1...9)
    return randomNumber
}

func printUserNumbers() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력: ", terminator:" ")
}

func generateComputerNumbers() {
    computerNumbers = generateRandomNumbers()
    print(computerNumbers)
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

func checkDuplicatedNumber(userNumbers: Array<UInt>) -> Bool {
    let ConvertedNumbers = Set(userNumbers)
    if(userNumbers.count != ConvertedNumbers.count) {
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

func inputUserNumbers() {
    var intArr: Array<UInt> = []
    
    guard let userNumber = readLine() else {
        return inputUserNumbers()
    }
   
    let split = userNumber.components(separatedBy: " ")
    
    for i in split {
        guard UInt(i) != nil else {
            print("입력이 잘못되었습니다")
            return inputUserNumbers()
        }
    }
    
    intArr = userNumber.split(separator: " ").map { UInt($0)! }
    
    if checkUserNumberRange(userNumbers: intArr) && checkUserNumberCount(userNumbers: intArr) && checkDuplicatedNumber(userNumbers: intArr) {
        compareNumber(with: intArr)
    } else {
        inputUserNumbers()
    }
}

func printComparedNumberResult() {
    if isUserWin == true {
        print("유저 승리...!")
    } else if isComputerWin == true {
        print("컴퓨터 승리...!")
    }
    print("\(baseballCount.strike) 스트라이크, \(baseballCount.ball) 볼")
    print("남은 기회 :\(numberOfTry-playCount)")
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
    printUserNumbers()
    for i in 0..<userNumbers.count {
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
        inputUserNumbers()
        printComparedNumberResult()
        resetCount()
    }
}

selectMenu()
