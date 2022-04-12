//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

var randomArray: Array<Int>
var count: Int = 9

func insertRandomNumber() -> Set<Int> {
    
    var randomSet: Set<Int> = []
    
    while randomSet.count != 3 {
        randomSet.insert(Int.random(in: 1...9))
    }
    
    return randomSet
}

randomArray = Array(insertRandomNumber())

var strike: Int = 0
var ball: Int = 0

var inputArray: Array<Int> = []
var userNumber: Array<Int?> = []

func numberBaseball() {
    let userNumber = readLine()?.split(separator: " ").map {Int($0) ?? 0}
    if let unwrappedUserNumber: Array<Int> = userNumber {
        inputArray = unwrappedUserNumber
    }
}

func compareNumber() {
    
    while strike != 3 && count != 0 {
        
        strike = 0
        count -= 1
        print("임의의 수 : ", terminator: "")
        numberBaseball()
        
        for number in 0...2 {
            if randomArray[number] == inputArray[number] {
                strike += 1
            }
        }
        
        let intersectionOfArrays = Set(randomArray).intersection(inputArray)
        ball = intersectionOfArrays.count - strike
        
        if strike == 3 {
            print("사용자 승리...!")
        } else if count == 0 {
            print("컴퓨터 승리...!")
        }
        
        print("\(strike) 스트라이크, \(ball) 볼")
        print("남은 기회 : \(count)")
        
    }
}

