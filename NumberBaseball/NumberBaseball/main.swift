//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

func startGame() {
    
    var chance: Int = 9
    var threeRandomNumbers: [Int]
    var userPickedNumbers: [Int]
    var result: [Int]
    
    threeRandomNumbers = pickThreeRandomNumbers()
    
    while chance > 0 {
    
        userPickedNumbers = pickThreeRandomNumbers()
        
        result = calculateResult(computer: threeRandomNumbers, user: userPickedNumbers)
        print("임의의 수 : \(userPickedNumbers[0]) \(userPickedNumbers[1]) \(userPickedNumbers[2])")
        print("\(result[0]) 스트라이크, \(result[1]) 볼")
        
        if result[0] == 3 {
            print("사용자 승리...!")
            break
        }
        
        chance -= 1
        print("남은 기회 : \(chance)")
        
    }
    
    if chance == 0 {
        print("컴퓨터 승리...!")
    }
    
}

func pickThreeRandomNumbers() -> [Int] {
    var list: [Int] = []
    
    while true {
        list.append(Int.random(in: 1...9))
        
        list = Array(Set(list))
        
        if list.count == 3 {
            // print(list)
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


startGame()
