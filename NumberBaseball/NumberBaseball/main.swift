//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class StartBaseballGame {
    var randomNumbers: [Int] = []
    var computerNumbers: [Int] = []
    var userNumbers: [Int] = []
    var userTrueAndComputerFalse: Bool = true
    var restChance: Int = 9
  
    func extractRandomNumber(userTrueAndComputerFalse: Bool) -> [Int] {
        randomNumbers = []
        
        while randomNumbers.count != 3 {
            randomNumbers.append(Int.random(in: 1...9))
            randomNumbers = Array(Set(randomNumbers))
        }
        if userTrueAndComputerFalse == true {
            userNumbers = randomNumbers
        } else {
            computerNumbers = randomNumbers
        }
        return randomNumbers
    }
    
    func countStrikeAndBall() -> [Int] {
        var checkSameNumber:[Int] = []
        
        for eachNumber in computerNumbers{
            userNumbers.contains(eachNumber) ? checkSameNumber.append(eachNumber) : checkSameNumber.append(0)
        }
        let sameNumber = checkSameNumber.filter{ $0 != 0 }
        let strikeCount:Int = sameNumber.filter{ userNumbers.firstIndex(of: $0) == computerNumbers.firstIndex(of: $0) }.count
        let ballCount:Int = sameNumber.count - strikeCount
        
        restChance -= 1
        
        return [strikeCount, ballCount]
    }
    
    init() {
        var strikeAndBall: [Int] = []
        extractRandomNumber(userTrueAndComputerFalse: false)
    
        while restChance > 0{
            let userArray = extractRandomNumber(userTrueAndComputerFalse: true)
            let userStringArray = userArray.map{ String($0) }
            let printUserNumber = userStringArray.joined(separator: " ")
            print("임의의 수 : \(printUserNumber)")
            strikeAndBall = countStrikeAndBall()
            (restChance == 0 && strikeAndBall[0] != 3) ? print("컴퓨터승리...!") : nil
            print("\(strikeAndBall[0]) 스트라이크, \(strikeAndBall[1]) 볼")
            print("남은 기회 : \(restChance)")
            strikeAndBall[0] == 3 ? restChance = 0 : nil
        }
    }
}

let iosBaseballGame = StartBaseballGame()

