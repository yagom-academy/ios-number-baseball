//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


var extractedForComputer: Array<Int> = Array<Int>()
var remainingChance = 9

func getRandomNumbersForComputer() {
    var initialComputerInput: Set<Int> = Set<Int>()
    while initialComputerInput.count < 3 {
        let number: Int = Int.random(in: 1...9)
        initialComputerInput.insert(number)
    }
    extractedForComputer = Array(initialComputerInput)
}

func getRandomNumbersForUser() -> Array<Int> {
    var initialUserInput: Set<Int> = Set<Int>()
    while initialUserInput.count < 3 {
        let number: Int = Int.random(in: 1...9)
        initialUserInput.insert(number)
    }
    return Array(initialUserInput)
}

func isStrikeBall(extractedForUser: Array<Int>) -> Bool {
    var isThreeStrike = false
    var strikeCount = 0
    var ballCount = 0
    for index in 0...2 {
        if extractedForComputer[index] == extractedForUser[index] {
            strikeCount += 1
        } else if extractedForUser.contains(extractedForComputer[index]) {
            ballCount += 1
        }
    }
    isThreeStrike = checkThreeStrikes(strikeCount: strikeCount, ballCount: ballCount)
    return isThreeStrike
    
}

func checkThreeStrikes(strikeCount: Int, ballCount: Int) -> Bool {
    var checkThreeStrike = false
    if strikeCount == 3 {
        print("\(strikeCount) 스트라이크, \(ballCount) 볼 - 사용자 승리!")
        checkThreeStrike = true
    } else {
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    }
    return checkThreeStrike
}

func printingRandomNumbers(myArray: Array<Int>) {
    print("임의의 수 : \(myArray[0]) \(myArray[1]) \(myArray[2])")
}

func subtractingRemainingChance(remaining: inout Int){
    remaining -= 1
}

func countingRemainingChance(remaining: inout Int){
    print("남은 기회 : \(remaining)")
    if remaining == 0 {
        print("컴퓨터 승리...!")
    }
}
func startGame() {
    getRandomNumbersForComputer()
    while remainingChance != 0 {
        let extractedForUser = getRandomNumbersForUser()
        printingRandomNumbers(myArray: extractedForUser)
        
        remainingChance -= 1
        print("남은 기회 : \(remainingChance)")
        if remainingChance == 0 {
            print("컴퓨터 승리...!")
        }
    }
}

startGame()
