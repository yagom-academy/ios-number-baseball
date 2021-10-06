//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: Array<Int> = generatedRandomNumbers()
var tryCount: Int = 9

func generatedRandomNumbers() -> Array<Int>{
    var numbers: Set<Int> = Set<Int>()
    while numbers.count < 3{
        numbers.insert(Int.random(in: 1...9))
    }
    return Array(numbers)
}

//print(generatedRandomNumbers())

func returnResult(of numbers: [Int]) -> String{
    var result: String = " "
    var strikeCount: Int
    var ballCount: Int

    
    
    return result
}


/*
func input(){
    print("입력 : ", terminator: " ")
    guard let input = readLine() else{
        return
    }
    
    let splitedInput = input.filter{$0 != " "}
}
*/
