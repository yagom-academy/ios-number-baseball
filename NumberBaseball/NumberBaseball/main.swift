
//  Created by vetto, 무리
//  2022.12.19 ~ 2022.12.23

import Foundation

func startGame() {
    let computerNumberArray: [Int] = makeRandomNumberArray()
    var numberOfTry: Int = 9
    
    while numberOfTry > 0 {
        let randomNumberArray = makeRandomNumberArray()
        print("임의의 수 : \(randomNumberArray)")
    }
}

func makeRandomNumberArray() -> [Int] {
    var randomSetNumber: Set<Int> = Set<Int>()
    
    while randomSetNumber.count < 3 {
        randomSetNumber.insert(Int.random(in: 1...9))
    }
    
    return Array(randomSetNumber)
}

func countBallStrike(computerNumberArray: [Int], randomNumberArray: [Int]) -> (Int, Int) {
    var numberOfStrike: Int = 0
    var numberOfBall: Int = 0
    
    
    
    return (numberOfStrike, numberOfBall)
}
