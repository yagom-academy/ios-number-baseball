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
    guard let selectedMenu = readLine()?.trimmingCharacters(in: .whitespaces) else { return }
    
    if selectedMenu == "1" {
        return startGame()
    }
    else if selectedMenu == "2" {
        return
    }
    else {
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
    guard let receivedNumbers = readLine() else { return receiveNumbers() }
    let userNumbers = receivedNumbers.trimmingCharacters(in: .whitespaces).components(separatedBy: " ")
    guard checkReceivedNumbers(userNumbers: userNumbers) else { return receiveNumbers() }
    
    return userNumbers
}

func checkReceivedNumbers(userNumbers: [String]) -> Bool {
    if Set(userNumbers).count != 3 || Int(userNumbers.joined()) == nil {
        print("입력이 잘못되었습니다.")
        return false
    }
    return true
}

func startGame() {
    remainedChances = 9
    let randomNumbers = makeRandomNumbers()
    
    while remainedChances > 0 {
        let userNumbers = randomNumbers
        guard !checkUserWin(userNumbers: userNumbers, randomNumbers: randomNumbers) else { break }
        printCounts(userNumbers: userNumbers, randomNumbers: randomNumbers)
        print("남은 기회 : \(remainedChances)")
        checkComputerWin(remainedChances: remainedChances)
    }
    selectMenu()
}

func makeRandomNumbers() -> [String] {
    var randomNumbers: Set<String> = []
    
    while randomNumbers.count < 3 {
        let number = Int.random(in: 1...9)
        randomNumbers.insert(String(number))
    }
    
    return Array(randomNumbers)
}

func calcStrikeCounts(userNumbers: [String], randomNumbers: [String]) -> Int {
    var strikeCounts = 0
    
    for (index, number) in userNumbers.enumerated() {
        strikeCounts += randomNumbers.enumerated().filter { $0.element == number && $0.offset == index }.count
    }
    
    return strikeCounts
}

func calcBallCounts(userNumbers: [String], randomNumbers: [String]) -> Int {
    var ballCounts = 0
    
    for (index, number) in userNumbers.enumerated() {
        ballCounts += randomNumbers.enumerated().filter { $0.element == number && $0.offset != index }.count
    }
    
    return ballCounts
}

func printCounts(userNumbers: [String], randomNumbers: [String]) {
    let strikeCounts = calcStrikeCounts(userNumbers: userNumbers, randomNumbers: randomNumbers)
    let ballCounts = calcBallCounts(userNumbers: userNumbers, randomNumbers: randomNumbers)
    print("\(strikeCounts) 스트라이크, \(ballCounts) 볼")
}

func checkUserWin(userNumbers: [String], randomNumbers: [String]) -> Bool {
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
