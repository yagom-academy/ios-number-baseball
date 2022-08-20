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

func decideUserVictory() -> Bool{
    if foundStrike() == 3 {
        return true
    }
    return false
}

func startBaseBallGame() {
    while(tryNumber > 0) {
        let tryUserInput = getUserInput()
        
        for number in tryUserInput {
            if let number = Int(number) {
                userNumbers.append(number)
            }
        }
        
        if filterUserInput(input: tryUserInput) == false {
            userNumbers.removeAll()
            continue
        }
        
        tryNumber -= 1
        
        if tryNumber == 8 {
            computerNumbers = generateThreeRandomNumbers()
        }
        
        print(computerNumbers)
        print(foundStrike() ," 스트라이크,", foundBall(), " 볼")
        
        if tryNumber == 0 {
            if decideUserVictory() == true {
                print("사용자 승리!")
                userNumbers.removeAll()
                break
            } else {
                print("컴퓨터 승리...!")
                userNumbers.removeAll()
                break
            }
        } else {
            if decideUserVictory() == true {
                print("사용자 승리!")
                userNumbers.removeAll()
                break
            }
            print("남은 기회 : \(tryNumber)")
        }
        userNumbers.removeAll()
    }
}

func printError() {
    print("입력이 잘못되었습니다.")
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요")
    print("중복 숫자는 허용하지 않습니다.")
}

func filterUserInput( input: [String] ) -> Bool {
    if Set(input).count != 3 {
        printError()
        return false
    }
    
    guard let userInputnum = Int(input.joined()) else {
        printError()
        return false
    }
    
    if userInputnum < 100 || userInputnum > 999 {
        printError()
        return false
    }
    return true
}

func getUserInput() -> [String] {
    print("입력 : ",terminator: "")
    guard let userInput = readLine()?.components(separatedBy: " ") else {
        printError()
        return []
    }
    return userInput
}

func selectMunu() {
    while exitSelectMenu == false {
        tryNumber = 9
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
