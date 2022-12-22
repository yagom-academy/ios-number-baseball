//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum InputError: Error {
    case invalidNumber
}

var winNumberArray: [UInt] = []
var userNumberArray: [UInt] = []
var strikeNumber = 0
var ballNumber = 0
var chance = 9
var menuNumber = 0

func createRandomNumbers() -> [UInt] {
    var randomNumbers: Set<UInt> = []
    
    while randomNumbers.count < 3 {
        randomNumbers.insert(UInt.random(in: 1...9))
    }
    
    return Array(randomNumbers)
}

func countStrikeBall() {
    for index in 0 ..< winNumberArray.count {
        if winNumberArray[index] == userNumberArray[index] {
            strikeNumber += 1
        } else if winNumberArray.contains(userNumberArray[index]) {
            ballNumber += 1
        }
    }
}

func menuInputOutput() throws {
    print("1. 게임시작\n2. 게임종료\n원하는 기능을 선택해주세요 : ", terminator: "")
    
    let inputMenu = readLine()
    
    guard let menu = inputMenu else {
        throw InputError.invalidNumber
    }
    
    guard menu == "1" || menu == "2" else {
        throw InputError.invalidNumber
    }
    
    let menuIntOptional = Int(menu)
    
    if let menuInt = menuIntOptional {
        menuNumber = menuInt
    }
}

func inputNumbers() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.\n입력 : ", terminator: "")
    
    guard let inputNumber = readLine() else {
        print("입력이 잘못되었습니다")
        return inputNumbers()
    }
    
    let inputNumberArray = inputNumber.components(separatedBy: " ").map{ UInt($0) }
    
    for number in inputNumberArray {
        if let number = number {
            userNumberArray.append(number)
        }
    }
    
    guard userNumberArray.count == 3 else {
        print("입력이 잘못되었습니다")
        userNumberArray = []
        return inputNumbers()
    }
    
    if userNumberArray[0] > 9 {
        print("입력이 잘못되었습니다")
        userNumberArray = []
        return inputNumbers()
    } else if userNumberArray[1] > 9 {
        print("입력이 잘못되었습니다")
        userNumberArray = []
        return inputNumbers()
    } else if userNumberArray[2] > 9 {
        print("입력이 잘못되었습니다")
        userNumberArray = []
        return inputNumbers()
    }
    
    let userNumberSet = Set(userNumberArray)
    let userNumbers = Array(userNumberSet)
    
    guard userNumbers.count == 3 else {
        print("입력이 잘못되었습니다")
        userNumberArray = []
        return inputNumbers()
    }
}

func playGame() throws {
    winNumberArray = createRandomNumbers()
    
    for _ in 1...9 {
        inputNumbers()
        countStrikeBall()
        chance -= 1
        
        print("\(strikeNumber) 스트라이크, \(ballNumber) 볼")
        
        if strikeNumber == 3 {
            print("사용자 승리!")
            try startGame()
            break
        }
        
        if chance != 0 {
            print("남은기회 : \(chance)")
        }
        else {
            print("컴퓨터 승리...!")
            try startGame()
        }
        strikeNumber = 0
        ballNumber = 0
        userNumberArray.removeAll()
    }
}

func startGame() throws{
    do {
        try menuInputOutput()
        
        chance = 9
        strikeNumber = 0
        ballNumber = 0
        userNumberArray.removeAll()
        
        if menuNumber == 2 {
            return
        }
        try playGame()
    }
    catch InputError.invalidNumber {
        print("입력이 잘못되었습니다")
        try startGame()
    }
}

try startGame()
