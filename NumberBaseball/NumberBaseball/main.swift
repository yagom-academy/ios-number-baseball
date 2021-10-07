//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


func makingRandomNumber() -> Array<Int> {
    var randomNumberSet = Set<Int>()
    
    repeat {
        randomNumberSet.insert(Int.random(in: 1...9))
    } while randomNumberSet.count < 3
    
    let randomNumberArray = Array(randomNumberSet)
    
    return randomNumberArray
}

func compareNumbers(_ randomNumbers: Array<Int>, _ userNumbers: Array<Int>) {
    var strikeCounts = 0
    var ballCounts = 0
    
    for numberIndex in 0...2 {
        if randomNumbers[numberIndex] == userNumbers[numberIndex] {
            strikeCounts += 1
        } else if randomNumbers.contains(userNumbers[numberIndex]){
            ballCounts += 1
        }
    }
    
    print("\(strikeCounts) 스트라이크, \(ballCounts) 볼")
}

func printNumbers(_ radomArray: Array<Int>) {
    print("임의의 수: \(radomArray[0]) \(radomArray[1]) \(radomArray[2])")
}

func launchBaseBall() {
    let randomNumbers: Array<Int> = makingRandomNumber()
    var userNumbers: Array<Int> = Array<Int>()
    var gameCount: Int = 9

    while gameCount > 0 {
        userNumbers = makingRandomNumber()
        printNumbers(userNumbers)
        compareNumbers(randomNumbers, userNumbers)

        if randomNumbers == userNumbers {
            break
        }

        gameCount -= 1
        print("남은 기회 : (gameCount)")
    }

    if gameCount == 0 {
        print("컴퓨터 승리...!")
    } else {
        print("사용자 승리!")
    }
}

launchBaseBall()
