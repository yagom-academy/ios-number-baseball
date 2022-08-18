//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
var answer = [Int]()
var remainCount = 9

func fetchRandomNumbers() -> [Int] {
    var numberSet = Set<Int>()
    while numberSet.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        numberSet.insert(randomNumber)
    }
    
    let randomNumbers = Array(numberSet)
    return randomNumbers
}

answer = fetchRandomNumbers()

func decideStrikeCountAndBallCount(about userNumbers: [Int]) -> (Int, Int) {
    var strikeCount = 0
    var ballCount = 0
    
    for index in 0...2 {
        if userNumbers[index] == answer[index] {
            strikeCount += 1
        } else if answer.contains(userNumbers[index]) {
            ballCount += 1
        }
    }
    return (strikeCount, ballCount)
}

func startNumberGame() {
    var userNumbers = [Int]()
    
    while remainCount > 0 {
        var guidance = ""
        userNumbers = fetchRandomNumbers()
        
        printInformation(of: userNumbers)

        let (strikeCount, ballCount) = decideStrikeCountAndBallCount(about: userNumbers)
        printDecision(about: strikeCount, and: ballCount)
        
        if isStrikeOut(strikeCount) {
            break
        }
        
        remainCount -= 1
        if remainCount == 0 {
            guidance += "컴퓨터 승리...!"
        } else {
            guidance += "남은 기회 : \(remainCount)"
        }
        print(guidance)
    }
}

func printInformation(of userNumbers: [Int]) {
    let numbers = userNumbers.map(){ (number: Int) -> String in
        return String(number)
    }.joined(separator: " ")
    let information = "임의의 수 : \(numbers)"
    print(information)
}

func printDecision(about strikeCount: Int, and ballCount: Int) {
    print("\(strikeCount) 스트라이크, \(ballCount) 볼\n")
}

func isStrikeOut(_ strikeCount: Int) -> Bool {
    if strikeCount == 3 {
        print("사용자 승리!")
        return true
    } else {
        return false
    }
}

startNumberGame()
