//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class StartBaseballGame {
    var randomNumberArray: [Int] = []
    var checkUserTrueOrComputerFalse: Bool = true
    var restChance: Int = 9
    var hitThreeStrike: Bool = false
    var checkRepeatNumberArray: [Int] = []
    var userNumberArray: [Int] = []
    
    func extractRandomNumber(checkUserTrueOrComputerFalse: Bool) {
        while checkRepeatNumberArray.count != 3 {
            checkRepeatNumberArray.append(Int.random(in: 1...9))
            checkRepeatNumberArray = Array(Set(checkRepeatNumberArray))
        }
        if checkUserTrueOrComputerFalse {
            userNumberArray = checkRepeatNumberArray
        } else {
            randomNumberArray = checkRepeatNumberArray
        }
    }
    
    func checkNumberError(_ numbers: Int...) {
        
    }
    
    func compareComputerUserNumber() -> [Int] {
        //        guard let userNumber = readLine(), userNumber != "" else{
        //            fatalError("입력이 잘못되었습니다.")
        //        }
        //        let userNumberArray = (userNumber.split(separator: " ")).map{ Int($0) }
        //
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
        while restChance != 0 || kk[0] != 3 {
            extractRandomNumber(checkUserTrueOrComputerFalse: true)
            kk = compareComputerUserNumber()
            print("\(kk[0]) 스트라이크, \(kk[1]) 볼")
        }
    }
}

var fellASleep = StartBaseballGame()
