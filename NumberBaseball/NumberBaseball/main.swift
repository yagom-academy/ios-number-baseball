//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let numbers = Array(1...9)
let initialNumbers = makeRandomNumbers()

func makeRandomNumbers() -> [Int] {
    var resultnumbers: Set<Int> = []
    
    while resultnumbers.count < 3 {
        guard let randomElement = numbers.randomElement() else{
            return []
        }
        resultnumbers.insert(randomElement)
    }
    
    return Array(resultnumbers)
}

func checkNumbers(numbers: [Int]) -> [Int] {
    var strike = 0
    var ball = 0
    
    for number in numbers {
        if initialNumbers.contains(number){
            ball += 1
        }
    }
    for index in 0...2{
        if initialNumbers[index] == numbers[index]{
            strike += 1
            ball -= 1
        }
    }
    return [strike, ball]
}
