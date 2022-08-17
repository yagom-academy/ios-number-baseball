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

func checkBall(a: [Int], b: [Int]) -> Int {
    var count: Int = 0
    
    for element in b {
        if a.contains(element) {
            count += 1
        }
    }
    return count
}

func checkStrike(a: [Int], b: [Int]) -> Int {
    var count: Int = 0
    
    for (index, value) in a.enumerated() {
        if a[index] == b[index] {
            count += 1
        }
    }
    return count
}

func startNumberBaseBall() {
    let randomNumber: [Int] = creatRandomNumber()
    var count: Int = 9
    
    while count == 0 {
        print("임의의 수 : \(randomNumber[0]) \(randomNumber[1]) \(randomNumber[2])")
        let tempNumber: [Int] = creatRandomNumber()
        let ballCount: Int = checkBall(a: randomNumber, b: tempNumber)
        let strikeCount: Int = checkStrike(a: randomNumber, b: tempNumber)
        if strikeCount == 3 {
            print("사용자 승리!")
            break
        }
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    }
    
}


