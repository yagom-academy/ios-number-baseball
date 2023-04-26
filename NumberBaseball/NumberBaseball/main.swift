//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

func generateRandomNumberList() -> [Int] {
    var randomIntegerList: Set<Int> = []
    
    while randomIntegerList.count != 3 {
        randomIntegerList.insert(Int.random(in: 1...9))
    }
    
    return Array(randomIntegerList)
}

func checkStrikeAndBall(_ computerNumberList: [Int], _ randomNumberList: [Int]) -> (strike: Int, ball: Int) {
    var strikeCount = 0
    var ballCount = 0

    for index in 0..<3 {
        strikeCount += computerNumberList[index] == randomNumberList[index] ? 1 : 0
        ballCount += computerNumberList.contains(randomNumberList[index]) ? 1 : 0
    }
    
    ballCount -= strikeCount
    return (strikeCount, ballCount)
}

func isGameOver(_ strikeCount: Int, _ turnCount: Int) -> Bool {
    if strikeCount == 3 {
        print("사용자 승리!")
        return true
    }
    
    if turnCount == 0 {
        print("컴퓨터 승리...!")
        return true
    }
    
    print("남은 기회 : \(turnCount)")
    return false
}

func startNumberBaseball() {
    var inning = 9
    let computerNumberList = generateRandomNumberList()

    while inning != 0 {
        let randomNumberList = generateRandomNumberList()
        let strikeAndBallCount = checkStrikeAndBall(computerNumberList, randomNumberList)

        inning -= 1
        print("""
              임의의 수 : \(randomNumberList[0]) \(randomNumberList[1]) \(randomNumberList[2])
              \(strikeAndBallCount.strike) 스트라이크, \(strikeAndBallCount.ball) 볼
              """)
        

        if isGameOver(strikeAndBallCount.strike, inning) {
            break
        }
    }
}

startNumberBaseball()

