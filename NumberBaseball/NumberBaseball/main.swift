//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func makeRandomNumbers() -> [Int] {
    var randomNumbers: Set<Int> = []
    while randomNumbers.count < 3 {
        let randomNumber: Int = Int.random(in: 1...9)
        randomNumbers.insert(randomNumber)
    }
    return randomNumbers.shuffled()
}


var computerNumbers: [Int] = makeRandomNumbers()

func compareComputerNumbers(with userNumbers: [Int]) -> [Int] {
    var ballCount: Int = .zero
    var strikeCount: Int = .zero
    
    for index in 0...2 where computerNumbers[index] == userNumbers[index] {
        strikeCount += 1
    }
    
    for userNumber in userNumbers where computerNumbers.contains(userNumber) {
       ballCount += 1
    }
    
    ballCount -= strikeCount
    
    return [ballCount, strikeCount]
}

func startGame() {
    var chancesLeft: Int = 9
    var isUserWin: Bool = false
    while chancesLeft > 0, isUserWin == false {
        let userNumbers: [Int] = makeRandomNumbers()
        print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
        let result: [Int] = compareComputerNumbers(with: userNumbers)
        print("\(result[1]) 스트라이크, \(result[0]) 볼")
        chancesLeft -= 1
        print("남은 기회 : \(chancesLeft)")
        isUserWin = result[1] == 3
    }
    if isUserWin {
        print("사용자 승리...!")
    } else {
        print("컴퓨터 승리...!")
    }
}

startGame()
