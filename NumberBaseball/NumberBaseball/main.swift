//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func makeRandomNumber() -> Int {
    var randomNumber: Int = 0
    
    randomNumber = Int.random(in: 1...9)
    
    return randomNumber
}

func makeRandomNumberSet() -> Array<Int> {
    var randomNumberSet = Set<Int>()
    
    repeat {
        randomNumberSet.insert(makeRandomNumber())
    } while randomNumberSet.count < 3
    
    let randomNumberArray = Array(randomNumberSet)
    
    return randomNumberArray
}

func judgeBall(_ randomNumbers: Array<Int>, _ userNumber: Int) -> Int {
    if randomNumbers.contains(userNumber) {
        return 1
    } else {
        return 0
    }
}

func compareNumbers(_ randomNumbers: Array<Int>, _ userNumbers: Array<Int>) {
    var strikeCounts = 0
    var ballCounts = 0
    
    if randomNumbers[0] == userNumbers[0] {
        strikeCounts += 1
    } else {
        ballCounts += judgeBall(randomNumbers, userNumbers[0])
    }
    
    if randomNumbers[1] == userNumbers[1] {
        strikeCounts += 1
    } else {
        ballCounts += judgeBall(randomNumbers, userNumbers[1])
    }
    
    if randomNumbers[2] == userNumbers[2] {
        strikeCounts += 1
    } else {
        ballCounts += judgeBall(randomNumbers, userNumbers[2])
    }
    
    print("\(strikeCounts) 스트라이크, \(ballCounts) 볼")
}

func printNumbers(_ radomArray: Array<Int>) {
    print("임의의 수: \(radomArray[0]) \(radomArray[1]) \(radomArray[2])")
}

func launchBaseBall() {
    let randomNumbers: Array<Int> = makeRandomNumberSet()
    var userNumbers: Array<Int> = makeRandomNumberSet()
    var gameCount: Int = 9
    
    while gameCount > 0, randomNumbers != userNumbers {
        
        printNumbers(userNumbers)
        compareNumbers(randomNumbers, userNumbers)
        
        gameCount -= 1
        print("남은 기회 : \(gameCount)")
        
        userNumbers = makeRandomNumberSet()
    }
    
    if gameCount == 0 {
        print("컴퓨터 승리...!")
    } else {
        printNumbers(userNumbers)
        compareNumbers(randomNumbers, userNumbers)
        print("사용자 승리!")
    }
}

launchBaseBall()
