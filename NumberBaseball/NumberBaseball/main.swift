//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

func creatRandomNumber() -> [Int] {
    var randNumber: [Int] = []
    var count: Int = 0
    
    while count < 3 {
        var temp: Int = Int.random(in: 1...9)
        
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

func numberBaseBall() {
    
}


