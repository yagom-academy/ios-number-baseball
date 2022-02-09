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

func transformMatchScore(_ strikeCount: Int, _ ballCount: Int) -> String {
    return "\(strikeCount) 스트라이크, \(ballCount - strikeCount) 볼"
}

func matchStrikeNums() -> Int {
    var strikeCount: Int = 0
    for (playerNum, computerNum) in zip(playerNums, computerNums) {
        if playerNum == computerNum {
            strikeCount += 1
        }
    }
    return strikeCount
}

func matchBallNums() -> Int {
    return computerNums.intersection(playerNums).count
}

func setToString(of value: Set<Int>) -> String {
    return value.map { return "\($0)" }.joined(separator: " ")
}

func playGame() {
    computerNums = generateRandomThreeNums()
    
    while matchCount > 0 {
        print("임의의 수 : ", terminator: "")
        
        playerNums = generateRandomThreeNums()
        print(setToString(of: playerNums))
        
        let strikeCount = matchStrikeNums()
        let ballCount = matchBallNums()
        
        if strikeCount == 3 {
            print("사용자 승리!")
            break
        } else if matchCount == 1 {
            print("컴퓨터 승리...!")
        }
        
        print(transformMatchScore(strikeCount, ballCount))
        matchCount -= 1
        
        print("남은 기회 : \(matchCount)")
    }
}

func main() {
    playGame()
}

main()
