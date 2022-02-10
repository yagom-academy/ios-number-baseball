//
//  NumberBaseball - main.swift
//  Created by Chuuny & Doogie.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var remainedChances = 9

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

func playGame() {
    remainedChances = 9
    let randomNumbers = makeRandomNumbers()
    
    while remainedChances > 0 {
        let userNumbers = makeRandomNumbers()
        print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
        
        if checkUserWin(userNumbers: userNumbers, randomNumbers: randomNumbers) {
            return
        }
        else if remainedChances == 0 {
            print("컴퓨터 승리...!")
        }
        printCounts(userNumbers: userNumbers, randomNumbers: randomNumbers)
        print("남은 기회 \(remainedChances)")
    }
}

playGame()
