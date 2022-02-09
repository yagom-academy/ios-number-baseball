//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var playerNums: Set<Int> = Set()
var computerNums: Set<Int> = Set()
var matchCount: Int = 9

func generateRandomThreeNums() -> Set<Int> {
    var nums: Set<Int> = Set()
    while nums.count < 3 {
        nums.insert(Int.random(in: 1...9))
    }
    return nums
}

func displayMatchScore() -> String {
    let matchStrikeCount = matchStrikeNums()
    let matchBallCount = matchBallNums()
    
    return "\(matchStrikeCount) 스트라이크, \(matchBallCount - matchStrikeCount) 볼"
}

func matchStrikeNums() -> Int {
    var matchStrikeCount: Int = 0
    for (playerNum, computerNum) in zip(playerNums, computerNums) {
        if playerNum == computerNum {
            matchStrikeCount += 1
        }
    }
    return matchStrikeCount
}

func matchBallNums() -> Int {
    let matchBallCount: Int = computerNums.intersection(playerNums).count
    return matchBallCount
}

func setToString(set: Set<Int>) -> String {
    var stringArray: [String] = []
    stringArray = set.map { (number: Int) -> String in
        return "\(number)"
    }
    return stringArray.joined(separator: " ")
}

func playGame() {
    computerNums = generateRandomThreeNums()
    
    while matchCount > 0 {
        print("임의의 수 : ", terminator: "")
        
        playerNums = generateRandomThreeNums()
        print(setToString(set: playerNums))
        
        if matchStrikeNums() == 3 {
            print("사용자 승리!")
            break
        } else if matchCount == 1 {
            print("컴퓨터 승리...!")
        }
        
        print(displayMatchScore())
        matchCount -= 1
        
        print("남은 기회 : \(matchCount)")
    }
}

func main() {
    playGame()
}

main()
