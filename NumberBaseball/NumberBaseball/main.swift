//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: [Int] = []
var userNumbers: [Int] = []
var tryNumber: Int = 9
var exitSelectMenu: Bool = false

func generateThreeRandomNumbers() -> [Int] {
    var numbers: Set<Int> = []
    
    while numbers.count < 3 {
        let num = Int.random(in: 1...9)
        numbers.update(with: num)
    }
    return Array(numbers)
}

func foundBall() -> Int {
    var ballCount: Int = 0
    let pairNumbers = zip(userNumbers, computerNumbers)
    
    for (userNumber, computerNumber) in pairNumbers {
        if computerNumbers.contains(userNumber) && userNumber != computerNumber {
            ballCount += 1
        }
    }
    return ballCount
}

func foundStrike() -> Int {
    var strikeCount : Int = 0
    let pairNumbers = zip(userNumbers, computerNumbers)

    for (userNumber, computerNumber) in pairNumbers {
        if userNumber == computerNumber {
            strikeCount += 1
        }
    }
    return strikeCount
}

func decideUserVictory() {
    if foundStrike() == 3 {
        print("사용자 승리!")
        return
    }
}

func startBaseBallGame() {
    while(tryNumber > 0) {
        tryNumber -= 1
        
        let tryUserInput = getUserInput()
        
        for number in tryUserInput {
            if let number = Int(number) {
                userNumbers.append(number)
            }
        }
        
        if tryNumber == 8 {
            computerNumbers = generateThreeRandomNumbers()
        }
        
        print(computerNumbers)
        print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
        print(foundStrike() ," 스트라이크,", foundBall(), " 볼")
        userNumbers.removeAll()
        
        if tryNumber == 0 {
            decideUserVictory()
            print("컴퓨터 승리...!")
            return
        } else {
            decideUserVictory()
            print("남은 기회 : \(tryNumber)")
            print("\n")
        }
    }
}

func printError() {
    print("입력이 잘못되었습니다.")
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요")
    print("중복 숫자는 허용하지 않습니다.")
}

func filterUserInput( input: [String] ) {
    if Set(input).count != 3 {
        printError()
        return
    }
    
    guard let userInputnum = Int(input.joined()) else {
        printError()
        return
    }
    
    if userInputnum < 100 || userInputnum > 999 {
        printError()
        return
    }
}

func getUserInput() -> [String] {
    print("입력 : ",terminator: "")
    guard let userInput = readLine()?.components(separatedBy: " ") else {
        printError()
        return []
    }
    filterUserInput(input: userInput)
    return userInput
}

func selectMunu() {
    while exitSelectMenu == false {
        print("1. 게임시작")
        print("2. 게임종료")
        print("원하는 기능을 선택해 주세요",terminator: " ")
        
        guard let menuInput = readLine() else {
            print("원하시는 메뉴를 입력해주세요.")
            continue
        }
        
        let menu = menuInput.map{ String($0) }.filter{$0 != " "}.joined()
        
        if menu == "1" {
            startBaseBallGame()
        } else if menu == "2" {
            print("게임을 종료합니다.")
            exitSelectMenu = true
        } else {
            print("입력이 잘못되었습니다.")
            continue
        }
    }
}
selectMunu()
