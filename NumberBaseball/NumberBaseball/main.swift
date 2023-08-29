//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var tryCount = 9


func makeUserRandomNumber() -> [Int] {
    var randomNum: Set<Int> = Set<Int>()
    
    func makeUserRandomNumber() -> [Int] {
        var randomNum = Set<Int>()
        
        while randomNum.count < 3 {
            randomNum.insert(Int.random(in: 1...9))
        }
        return Array(randomNum)
    }
    
    func makeComputerRandomNumber() -> [Int] {
        var randomNum: Set<Int> = Set<Int>()
        var randomNum = Set<Int>()
        
        while randomNum.count < 3 {
            randomNum.insert(Int.random(in: 1...9))
        }
        return Array(randomNum)
    }
    
    var computerChoice = makeComputerRandomNumber()
    
    
    while true {
        let userNumber = makeUserRandomNumber()
        
        func comparisonRanmdomNumber() {
            
            
            
            while true {
                let userNumber = makeUserRandomNumber()
                
                func comparisonRandomNumber() {
                    
                    var strike = 0
                    var ball = 0
                    
                    for (index, number) in userNumber.enumerated() {
                        if index == computerChoice.firstIndex(of: number) {
                            strike += 1
                            
                        } else if computerChoice.contains(number) {
                            
                        } else if computerChoice.contains(number){
                            
                            ball += 1
                        }
                    }
                    print("\(strike) 스트라이크, \(ball) 볼")
                }
                
                if tryCount < 0 {
                    print("컴퓨터 승리")
                    break
                } else {
                    print("임의의 수 : \(userNumber)")
                    comparisonRanmdomNumber()
                    if tryCount > 0 {
                        print("남은기회: \(tryCount)")
                    }
                    tryCount -= 1
                }
                
                
                if tryCount < 0 {
                    print("컴퓨터 승리...!")
                    break
                } else {
                    print("임의의 수 : \(userNumber)")
                    comparisonRandomNumber()
                    if tryCount > 0 {
                        print("남은 기회 : \(tryCount)")
                    }
                    tryCount -= 1
                }
                
            }
