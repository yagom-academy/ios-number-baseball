//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

func creatRandomNumber() -> [Int] {
    var randNumber: [Int] = []
    var count: Int = 0
    
    while count < 3 {
        let temp: Int = Int.random(in: 1...9)
        
        if !randNumber.contains(temp) {
            randNumber.append(temp)
            count += 1
        }
    }
    return randNumber
}

func compareThreeNumber(a: [Int], b: [Int]) -> Bool {
    var count: Int = 0
    
    for element in a {
        if b.contains(element) {
            count += 1
        }
    }
    if count == 3 {
        return true
    } else {
        return false
    }
}

func startNumberBaseBall() {
    let randomNumber: [Int] = creatRandomNumber()
    var count: Int = 9
    
    while count == 0 {
        print("임의의 수 : \(randomNumber[0]) \(randomNumber[1]) \(randomNumber[2])")
        let tempNumber: [Int] = creatRandomNumber()
        compareThreeNumber(a: randomNumber, b: tempNumber)
    }
    
}


