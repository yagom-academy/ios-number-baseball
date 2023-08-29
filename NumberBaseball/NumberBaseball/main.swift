//
//  NumberBaseball - main.swift
//  Created by jyubong, morgan.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: [Int] = []
var remainingCount: Int = 9

func getRandomNumbers() -> [Int] {
    var numbers: [Int] = []
    
    while numbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        
        if !numbers.contains(randomNumber){
            numbers.append(randomNumber)
        }
    }
    
    return numbers
}

func getResult(userNumbers: [Int]) -> (Int, Int) {
    var (strike, ball) = (0,0)
    for index in 0..<userNumbers.count where computerNumbers.contains(userNumbers[index]){
        if computerNumbers[index] == userNumbers[index]{
            strike += 1
        }else{
            ball += 1
        }
    }
    return (strike, ball)
}
