//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class StartBaseballGame {
    var randomNumberArray: [Int] = []
    var checkUserOrComputer: Bool = true
    var restChance: Int = 9
    var hitThreeStrike: Bool = false
    var checkRepeatNumberArray: [Int] = []
    
    func extractRandomNumber()->[Int] {
       
        while checkRepeatNumberArray.count != 3 {
            checkRepeatNumberArray.append(Int.random(in: 1...9))
            checkRepeatNumberArray = Array(Set(checkRepeatNumberArray))
        }
        return checkRepeatNumberArray
    }
    
    func checkNumberError(_ numbers: Int...) {
        
    }
    
    func compareComputerUserNumber(_ computerNumber: [Int]) {
//        guard let userNumber = readLine(), userNumber != "" else{
//            fatalError("입력이 잘못되었습니다.")
//        }
//        let userNumberArray = (userNumber.split(separator: " ")).map{ Int($0) }
//
        let userNumberArray = computerNumber
        var sameNumberDifferentZero:[Int] = []
      
        for eachNumber in checkRepeatNumberArray{
            userNumberArray.contains(eachNumber) ? sameNumberDifferentZero.append(eachNumber) : sameNumberDifferentZero.append(0)
        }
        let sameNumber = sameNumberDifferentZero.filter{ $0 != 0 }
        let strikeCount:Int = sameNumber.filter{ userNumberArray.firstIndex(of: $0) == checkRepeatNumberArray.firstIndex(of: $0) }.count
        let ballCount:Int = sameNumber.count - strikeCount
        
        
        restChance -= 1
    }
    
    init() {
        
    }
}



