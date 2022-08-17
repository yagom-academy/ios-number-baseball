//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

func creatRandomNumber() -> [Int] {
    var randomNumber: [Int] = []
    var count: Int = 0
    
    while count < 3 {
        let temp: Int = Int.random(in: 1...9)
        
        if !randomNumber.contains(temp) {
            randomNumber.append(temp)
            count += 1
        }
    }
    return randomNumber
}

func checkBall(from a: [Int], to b: [Int]) -> Int {
    var ballCount: Int = 0
    
    for (index, value)  in b.enumerated() {
        if a.contains(value) && b[index] != a[index] {
            ballCount += 1
        }
    }
    
    return ballCount
}

func checkStrike(from a: [Int], to b: [Int]) -> Int {
    var strikeCount: Int = 0
    
    for (index, _) in a.enumerated() {
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
        let userInputNumber: [Int] = creatRandomNumber()
        print("임의의 수 : \(userInputNumber[0]) \(userInputNumber[1]) \(userInputNumber[2])")
        let strikeCount: Int = checkStrike(from: randomNumber, to: userInputNumber)
        if strikeCount == 3 {
            print("사용자 승리!")
            break
        }
        
        let ballCount: Int = checkBall(from: randomNumber, to: userInputNumber)
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        lifeCount -= 1
    }
    if lifeCount == 0 {
        print("컴퓨터 승리...!")
    }
}

startNumberBaseBall()
