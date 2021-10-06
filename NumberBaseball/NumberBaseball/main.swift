//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class StartBaseballGame {
    var randomNumberArray: [Int] = []
    var computerNumberArray: [Int] = []
    var userNumberArray: [Int] = []
    var userTrueAndComputerFalse: Bool = true
    var restChance: Int = 9
  
    func extractRandomNumber(userTrueAndComputerFalse: Bool) -> [Int] {
        randomNumberArray = []
        
        while randomNumberArray.count != 3 {
            randomNumberArray.append(Int.random(in: 1...9))
            randomNumberArray = Array(Set(randomNumberArray))
        }
        if userTrueAndComputerFalse == true {
            userNumberArray = randomNumberArray
        } else {
            computerNumberArray = randomNumberArray
        }
        return randomNumberArray
    }
    
    func countStrikeAndBall() -> [Int] {
        var checkSameNumber:[Int] = []
        
        for eachNumber in computerNumberArray{
            userNumberArray.contains(eachNumber) ? checkSameNumber.append(eachNumber) : checkSameNumber.append(0)
        }
        let sameNumber = checkSameNumber.filter{ $0 != 0 }
        let strikeCount:Int = sameNumber.filter{ userNumberArray.firstIndex(of: $0) == computerNumberArray.firstIndex(of: $0) }.count
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

