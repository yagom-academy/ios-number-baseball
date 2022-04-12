//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

func startGame() {
    
    var threeRandomNumbers: [Int]
    var chance = 9
    var result: String
    
    threeRandomNumbers = peakThreeRandomNumbers()
    
}

func peakThreeRandomNumbers() -> [Int] {
    var list: [Int] = []
    
    while true {
        list.append(Int.random(in: 1...9))
        
        list = Array(Set(list))
        
        if list.count == 3 {
            print(list)
            break
        }
    }
    
    return list
}

func calculateResult(computer: [Int], user: [Int]) -> [Int] {
    
    var resultStrikeAndBall: [Int] = [0, 0]

    for i in 0...2 {
        guard let foundIdx = computer.firstIndex(of: user[i]) else { continue }
        
        if foundIdx == i {
            resultStrikeAndBall[0] += 1
        } else {
            resultStrikeAndBall[1] += 1
        }
    }
    
    return resultStrikeAndBall
}
