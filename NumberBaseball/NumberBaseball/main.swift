//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


var computerNumber = makeRandomNumber()
var remainingNumber = 9
var userNumberList = Array<Int>()
let computerNumberList = Array(computerNumber)


func launchMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    
    guard let selection = readLine() else {
        print("입력이 잘못되었습니다")
        launchMenu()
        return
    }
    
    switch selection {
    case "1":
        userInput()
        startGame(with: userNumberList, and: computerNumberList)
    case "2":
        return
    default:
        print("입력이 잘못되었습니다")
        launchMenu()
        return
    }
}


func userInput() {
    userNumberList.removeAll()
    
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다")
    print("입력 : ", terminator: "")
    guard let inputString = readLine() else {
        print("입력이 잘못되었습니다")
        userInput()
        return
    }
    
    let userData = inputString.components(separatedBy: " ")
    if verifyUserInput(userData) {
        for number in userData {
            userNumberList.append(Int(number) ?? 0)
        }
        return
    } else {
        print("입력이 잘못되었습니다")
        userInput()
        return
    }
}

func verifyUserInput(_ userData: [String]) -> Bool {
    if userData.count != 3 {
        return false
    }
    
    let userDataSet = Set(userData)
    if userDataSet.count < 3 {
        return false
    }
    
    for char in userData {
        guard let number = Int(char),
              number > 0,
              number < 10 else {
                  return false
              }
    }
    
    return true
}

func makeRandomNumber() -> Set<Int> {
    var numbers = Set<Int>()
    
    while numbers.count < 3 {
        numbers.insert(Int.random(in: 1...9))
    }
    
    return numbers
}


func startGame(with userArray: Array<Int>, and computerArray: Array<Int>) {
    print("임의의 수 :", userArray[0], userArray[1], userArray[2])
    
    let strikesAndBalls = compareNumbers(in: userArray, with: computerArray)
    let strikes = strikesAndBalls["strikes"] ?? 0
    let balls = strikesAndBalls["balls"] ?? 0
    
    print("\(strikes) 스트라이크, \(balls) 볼")
    
    remainingNumber -= 1
    
    if strikes == 3 {
        print("사용자 승리!")
        launchMenu()
        return
    } else if remainingNumber == 0 {
        print("남은 기회: \(remainingNumber)")
        print("컴퓨터 승리...!")
        launchMenu()
        return
    } else {
        print("남은 기회: \(remainingNumber)")
        userInput()
        startGame(with: userNumberList, and: computerNumberList)
        return
    }
}

func compareNumbers(in userArray: Array<Int>, with computerArray: Array<Int>) -> Dictionary<String, Int> {
    let strikes = countStrike(in: userArray, with: computerArray)
    let balls = countBall(in: userArray, with: computerArray)
    
    return ["strikes": strikes, "balls": balls]
}


func countStrike(in userArray: Array<Int>, with computerArray: Array<Int>) -> Int {
    var strikes = 0
    
    for i in 0..<userArray.count {
        if userArray[i] == computerArray[i] {
            strikes += 1
        }
    }
    
    return strikes
}

func countBall(in userArray: Array<Int>, with computerArray: Array<Int>) -> Int {
    var balls = 0
    
    for i in 0..<userArray.count {
        if computerArray.contains(userArray[i]) && computerArray[i] != userArray[i] {
            balls += 1
        }
    }
    
    return balls
}


// startGame(with: userNumberList, and: computerNumberList)
launchMenu()
