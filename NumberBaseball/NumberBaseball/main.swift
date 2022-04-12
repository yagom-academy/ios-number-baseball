//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var challenge: Int = 9
var isEnd: Bool = false
var randomNumberAnswer: Array<Int> = {
    var result = Set<Int>()
    while result.count < 3{
        result.insert(Int.random(in: 1...9))
    }
    return Array(result)
}()

func checkStrikeAndBall(_ userStringInput: Array<String>) -> [Int]{
    var countList: [Int] = [0,0]
    var userInput = userStringInput.map({Int($0)})
    for index in 0...2{
        if userInput[index] == randomNumberAnswer[index]{
            countList[0] += 1
            userInput[index] = 0
        }
    }
    
    for index in 0...2{
        if randomNumberAnswer.contains(userInput[index] ?? 0){
            countList[1] += 1
        }
    }
    
    return countList
}

while !isEnd{
    print("임의의 수 :", terminator: " ")
    guard var userInput = readLine()?.components(separatedBy: " ") else{
        break
    }
    let countList: [Int] = checkStrikeAndBall(userInput)
    if countList[0] == 3 {
        print("유저 승리..!")
        isEnd = true
    }else{
        
    }
    //출력코드
    break
    
}


