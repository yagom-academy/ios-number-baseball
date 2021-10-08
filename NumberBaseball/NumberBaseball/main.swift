//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// MARK: 게임 관련 부분.
let errorMessage = "입력이 잘못되었습니다"

func numberBaseball() {
    menuLoop: while true {
        printMenu()
        
        guard let menuInput = readLine() else {
            print(errorMessage)
            return
        }
    
        switch menuInput {
        case "1":
            launchBaseBall()
        case "2":
            break menuLoop
        default:
            print(errorMessage)
        }
    }
}

func printMenu() {
    print("""
    1. 게임시작
    2. 게임종료
    원하는 기능을 선택해주세요 :
    """, terminator: " ")
}

func launchBaseBall() {
    let randomNumbers: [Int] = makingRandomNumbers()
    var userNumbers = [Int]()
    var gameCount: Int = 9

    while gameCount > 0 {
        userNumbers = makingUserNumbers()
        compareNumbers(randomNumbers: randomNumbers, userNumbers: userNumbers)

        if randomNumbers == userNumbers {
            break
        }

        gameCount -= 1
        
        print("남은 기회 : \(gameCount)")
    }

    if gameCount == 0 {
        print("컴퓨터 승리...!")
    } else {
        print("사용자 승리!")
    }
}

func makingRandomNumbers() -> [Int] {
    var nonDuplicateNumbers = Set<Int>()
    
    repeat {
        nonDuplicateNumbers.insert(Int.random(in: 1...9))
    } while nonDuplicateNumbers.count < 3
    
    let randomNumbers = Array(nonDuplicateNumbers)
    
    return randomNumbers
}

func makingUserNumbers() -> [Int] {
    var isValidValue = false
    var userNumbers = [Int]()
    
    receiveInputLoop: while true {
        var inputedUserNumbers = ""
      
        if let gameNumber = recieveGameNumber() {
            inputedUserNumbers = gameNumber
            isValidValue = checkInvalidUserNumbers(inputedUserNumbers)
        }
        
        if isValidValue == true {
            userNumbers = stringToArray(inputedUserNumbers)
            break receiveInputLoop
        } else {
            print(errorMessage)
        }
    }
    
    return userNumbers
}

func recieveGameNumber() -> String? {
    print("""
    숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
    중복 숫자는 허용하지 않습니다.
    입력 :
    """, terminator: " ")
    
    let gameNumber = readLine()
    
    return gameNumber
}

func checkInvalidUserNumbers(_ inputedUserNumbers: String) -> Bool {
    let arrayNumbers = Array(inputedUserNumbers)

    guard inputedUserNumbers.count == 5 else {
        return false
    }
    
    guard inputedUserNumbers.replacingOccurrences(of: " ", with: "").count == 3 else {
        return false
    }
    
    guard arrayNumbers[1] == " " && arrayNumbers[3] == " " else {
        return false
    }
    
    guard Int(inputedUserNumbers.replacingOccurrences(of: " ", with: "")) != nil else {
        return false
    }
    
    return true
}

func stringToArray(_ inputedUserNumbers: String) -> Array<Int> {
    var userNumbers: Array<Int> = Array<Int>()
    
    let userString = Array(inputedUserNumbers)
    
    for i in 0...inputedUserNumbers.count-1 {
        if let a = Int(String(userString[i])) {
            userNumbers.append(a)
        }
    }
    
    return userNumbers
}

func compareNumbers(randomNumbers: Array<Int>, userNumbers: Array<Int>) {
    var strikeCounts = 0
    var ballCounts = 0
    
    for numberIndex in 0...2 {
        if randomNumbers[numberIndex] == userNumbers[numberIndex] {
            strikeCounts += 1
        } else if randomNumbers.contains(userNumbers[numberIndex]){
            ballCounts += 1
        }
    }
    
    print("\(strikeCounts) 스트라이크, \(ballCounts) 볼")
}

numberBaseball()
