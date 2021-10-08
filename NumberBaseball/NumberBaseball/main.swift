//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var randomNumbers: [Int] = []
var chancesLeft: Int = 9
var randomNumberAmount = 3

class BaseballGame {
  
    var computerNumbers: [Int] = []
    var userNumbers: [Int] = []
    var userTrueAndComputerFalse: Bool = true

    func extractRandomNumber(randomNumberAmount:Int = randomNumberAmount ,isUser userTrueAndComputerFalse: Bool) -> [Int] {
        randomNumbers = []
        let randomNumberRange = 1...9

        while randomNumbers.count != randomNumberAmount {
            randomNumbers.append(Int.random(in: randomNumberRange))
            randomNumbers = Array(Set(randomNumbers))
        }
        if userTrueAndComputerFalse == true {
            userNumbers = randomNumbers
        } else {
            computerNumbers = randomNumbers
        }
        return randomNumbers
    }
    
    func countStrikeAndBall() -> (strike: Int, ball:Int) {
        var checkSameNumber:[Int] = []
        
        for eachNumber in computerNumbers{
            userNumbers.contains(eachNumber) ? checkSameNumber.append(eachNumber) : checkSameNumber.append(0)
        }
        let sameNumber = checkSameNumber.filter{ $0 != 0 }
        let strikeCount:Int = sameNumber.filter{ userNumbers.firstIndex(of: $0) == computerNumbers.firstIndex(of: $0) }.count
        let ballCount:Int = sameNumber.count - strikeCount
        
        chancesLeft -= 1
        
        return (strike : strikeCount, ball: ballCount)
    }
    
    init() {
        extractRandomNumber(isUser: false)
    
        while chancesLeft > 0{
            let users = extractRandomNumber(isUser: true)
            let mappedUsers = users.map{ String($0) }
            let printUserNumber = mappedUsers.joined(separator: " ")
            let strikeAndBall = countStrikeAndBall()
            print("임의의 수 : \(printUserNumber)")
            print("\(strikeAndBall.strike) 스트라이크, \(strikeAndBall.ball) 볼")
            print("남은 기회 : \(chancesLeft)")
            (chancesLeft == 0 && strikeAndBall.strike != 3) ? print("컴퓨터승리...!") : strikeAndBall.strike == 3 ? chancesLeft = 0 : nil
        }
    }
}

BaseballGame()
