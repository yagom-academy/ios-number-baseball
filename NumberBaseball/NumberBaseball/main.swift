//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: Array<Int> = generatedRandomNumbers()
var tryCount: Int = 9
var strikeCount: Int = 0
var ballCount: Int = 0

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
    
    for index in 0...2{
        judgeStrikeOrBall(of: numbers[index], at: index)
    }
    result = "\(strikeCount)스트라이크, \(ballCount)볼"
    
    return result
}

func judgeStrikeOrBall(of number: Int, at index: Int){
    if number == computerNumbers[index]{
        strikeCount += 1
    }else if computerNumbers.contains(number) {
        ballCount += 1
    }
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
