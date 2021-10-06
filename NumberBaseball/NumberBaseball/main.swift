//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class StartBaseballGame {
    var checkRepeatNumberArray: [Int] = []
    var randomNumberArray: [Int] = []
    var userNumberArray: [Int] = []
    var checkUserTrueOrComputerFalse: Bool = true
    var hitThreeStrike: Bool = false
    var restChance: Int = 9
  
    func extractRandomNumber(checkUserTrueOrComputerFalse: Bool) ->[Int]{
        checkRepeatNumberArray = []
        
        while checkRepeatNumberArray.count != 3 {
            checkRepeatNumberArray.append(Int.random(in: 1...9))
            checkRepeatNumberArray = Array(Set(checkRepeatNumberArray))
        }
        if checkUserTrueOrComputerFalse == true {
            userNumberArray = checkRepeatNumberArray
        } else {
            randomNumberArray = checkRepeatNumberArray
        }
        return checkRepeatNumberArray
    }
    
    func checkNumberError(_ numbers: Int...) {
        
    }
    
    func compareComputerUserNumber() -> [Int] {
        var sameNumberDifferentZero:[Int] = []
        
        for eachNumber in randomNumberArray{
            userNumberArray.contains(eachNumber) ? sameNumberDifferentZero.append(eachNumber) : sameNumberDifferentZero.append(0)
        }
        let sameNumber = sameNumberDifferentZero.filter{ $0 != 0 }
        let strikeCount:Int = sameNumber.filter{ userNumberArray.firstIndex(of: $0) == randomNumberArray.firstIndex(of: $0) }.count
        let ballCount:Int = sameNumber.count - strikeCount
        
        
        restChance -= 1
        return [strikeCount, ballCount]
    }
    
    init() {
        var kk: [Int] = []
        extractRandomNumber(checkUserTrueOrComputerFalse: false)
    
        while restChance > 0{
            let user = extractRandomNumber(checkUserTrueOrComputerFalse: true)
            let userStringArray = user.map{ String($0) }
            let printUserNumber = userStringArray.joined(separator: " ")
            print("임의의 수 : \(printUserNumber)")
            kk = compareComputerUserNumber()
            (restChance == 0 && kk[0] != 3) ? print("컴퓨터승리...!") : nil
            print("\(kk[0]) 스트라이크, \(kk[1]) 볼")
            print("남은 기회 : \(restChance)")
            kk[0] == 3 ? restChance = 0 : nil
        }
    }
}

var fellASleep = StartBaseballGame()

