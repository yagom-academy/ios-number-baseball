//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

var randomArray: Array<Int> = []
var inputArray: Array<Int> = []

var remainingChances: Int = 9
var strikeCount: Int = 0
var ballCount: Int = 0


func generateRandomNumber() -> Array<Int> {
    var randomSet: Set<Int> = []
    
    while randomSet.count != 3 {
        randomSet.insert(Int.random(in: 1...9))
    }
    
    return Array(randomSet)
}

func inputUserNumber() {
    let userNumber = readLine()?.split(separator: " ").map {Int($0) ?? 0}
    
    if let unwrappedUserNumber: Array<Int> = userNumber {
        inputArray = unwrappedUserNumber
    }
}

func compareNumber() {
    while strikeCount < 3 && remainingChances > 0 {
        strikeCount = 0
        remainingChances -= 1
        inputArray = generateRandomNumber()
        print("임의의 수 : \(inputArray[0]) \(inputArray[1]) \(inputArray[2])")
        
        checkStrike()
        checkBall()
        
        if strikeCount == 3 {
            print("사용자 승리...!")
        } else if remainingChances == 0 {
            print("컴퓨터 승리...!")
        }
        
        print("\(strikeCount) 스트라이크, \(ballCount) 볼", "남은 기회 : \(remainingChances)", separator: "\n")
    }
}

func startGame() {
    randomArray = generateRandomNumber()
    compareNumber()
}

func checkStrike() {
    for number in 0...2 {
        let sameDigitNumber = (randomArray[number] - inputArray[number] == 0) ? 1 : 0
        strikeCount += sameDigitNumber
        }
    }

func checkBall() {
    let intersectionOfArrays = Set(randomArray).intersection(inputArray)
    ballCount = intersectionOfArrays.count - strikeCount
}

startGame()
