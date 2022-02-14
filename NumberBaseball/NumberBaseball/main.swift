//
//  NumberBaseball - main.swift
//  Created by Chuuny & Doogie.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var remainedChances = 9

func selectMenu() {
    print("""
          1.게임 시작
          2.게임 종료
          원하는 기능을 선택해주세요 :
          """, terminator: " ")
    guard let selectedMenu = readLine() else {
        print("입력이 잘못되었습니다.")
        return
    }
    
    let trimmedSelectedMenu = selectedMenu.trimmingCharacters(in: .whitespaces)
    
    if trimmedSelectedMenu == "1" {
        return startGame()
        
    } else if trimmedSelectedMenu == "2" {
        return
        
    } else {
        print("입력이 잘못되었습니다.")
        return selectMenu()
    }
}

func receiveNumbers() -> [String] {
    print("""
        숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
        중복 숫자는 허용하지 않습니다.
        입력 :
        """, terminator: " ")
    
    guard let userInput = readLine() else {
        print("입력이 잘못되었습니다.")
        return receiveNumbers()
    }
    
    let trimmedReceivedNumbers = userInput.trimmingCharacters(in: .whitespaces)
    let receivedNumbers = trimmedReceivedNumbers.components(separatedBy: " ").filter{ !$0.isEmpty }
    
    guard checkReceivedNumbers(userNumbers: receivedNumbers) else { return receiveNumbers() }
    
    return receivedNumbers
}

func checkReceivedNumbers(userNumbers: [String]) -> Bool {
    let checkedNumbers = userNumbers.filter { $0.count == 1 && $0 != "0" }
    if Set(checkedNumbers).count != 3 || Int(checkedNumbers.joined()) == nil {
        print("입력이 잘못되었습니다.")
        return false
    }
    return true
}

func startGame() {
    remainedChances = 9
    let randomNumbers = makeRandomNumbers()
    
    while remainedChances > 0 {
        let userNumbers = receiveNumbers()
        guard !checkUserWin(using: userNumbers, and: randomNumbers) else { break }
        printCounts(using: userNumbers, and: randomNumbers)
        print("남은 기회 : \(remainedChances)")
        checkComputerWin(remainedChances: remainedChances)
    }
    return selectMenu()
}

func makeRandomNumbers() -> [String] {
    var randomNumbers: Set<String> = []
    
    while randomNumbers.count < 3 {
        let number = Int.random(in: 1...9)
        randomNumbers.insert(String(number))
    }
    
    return Array(randomNumbers)
}

func calculateStrikeCounts(using userNumbers: [String], and randomNumbers: [String]) -> Int {
    var strikeCounts = 0
    
    for (index, number) in userNumbers.enumerated() {
        strikeCounts += randomNumbers.enumerated().filter { $0.element == number && $0.offset == index }.count
    }
    
    return strikeCounts
}

func calculateBallCounts(using userNumbers: [String], and randomNumbers: [String]) -> Int {
    var ballCounts = 0
    
    for (index, number) in userNumbers.enumerated() {
        ballCounts += randomNumbers.enumerated().filter { $0.element == number && $0.offset != index }.count
    }
    
    return ballCounts
}

func printCounts(using userNumbers: [String], and randomNumbers: [String]) {
    let strikeCounts = calculateStrikeCounts(using: userNumbers, and: randomNumbers)
    let ballCounts = calculateBallCounts(using: userNumbers, and: randomNumbers)
    print("\(strikeCounts) 스트라이크, \(ballCounts) 볼")
}

func checkUserWin(using userNumbers: [String], and randomNumbers: [String]) -> Bool {
    if userNumbers == randomNumbers {
        print("사용자 승리...!")
        return true
    }
    else {
        remainedChances -= 1
    }
    
    return false
}

func checkComputerWin(remainedChances: Int) {
    if remainedChances == 0 {
        print("컴퓨터 승리...!")
    }
}

selectMenu()
