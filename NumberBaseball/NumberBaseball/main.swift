//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: Set<Int> = Set<Int>()
var tryCount: Int = 9

func generatedRandomNumbers() -> Array<Int>{
    while computerNumbers.count < 3{
        computerNumbers.insert(Int.random(in: 1...9))
    }
    return Array(computerNumbers)
}

print(generatedRandomNumbers())



/*
func input(){
    print("입력 : ", terminator: " ")
    guard let input = readLine() else{
        return
    }
    
    let splitedInput = input.filter{$0 != " "}
}
*/
