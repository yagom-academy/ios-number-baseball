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

func playBall() {
    var userNumbers = [Int]()
    
    while remainCount > 0 {
        var guidance = ""
        userNumbers = fetchRandomNumbers()
        let numbersToString = userNumbers.map({String($0)}).joined(separator: " ")
        guidance += "임의의 수 : \(numbersToString)\n"

        let (strikeCount, ballCount) = decideStrikeCountAndBallCount(about: userNumbers)
        guidance += "\(strikeCount) 스트라이크, \(ballCount) 볼\n"
        
        if strikeCount == 3 {
            guidance += "사용자 승리!"
            print(guidance)
            break;
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

playBall()
