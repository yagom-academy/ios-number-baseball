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
    var ballCount: Int = 0
    
    for (index, value)  in b.enumerated() {
        if a.contains(value) && b[index] != a[index] {
            ballCount += 1
        }
    }
    return ballCount
}

func checkStrike(a: [Int], b: [Int]) -> Int {
    var strikeCount: Int = 0
    
    for (index, value) in a.enumerated() {
        if a[index] == b[index] {
            strikeCount += 1
        }
    }
    return strikeCount
}

func startNumberBaseBall() {
    let randomNumber: [Int] = creatRandomNumber()
    var lifeCount: Int = 9
    
    while lifeCount != 0 {
        let tempNumber: [Int] = creatRandomNumber()
        print("임의의 수 : \(tempNumber[0]) \(tempNumber[1]) \(tempNumber[2])")
        let strikeCount: Int = checkStrike(a: randomNumber, b: tempNumber)
        if strikeCount == 3 {
            print("사용자 승리!")
            break
        }
        
        let ballCount: Int = checkBall(a: randomNumber, b: tempNumber)
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        lifeCount -= 1
    }
    if lifeCount == 0 {
        print("컴퓨터 승리...!")
    }
}

startNumberBaseBall()
