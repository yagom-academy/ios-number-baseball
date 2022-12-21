
//  Created by vetto, 무리
//  2022.12.19 ~ 2022.12.23

import Foundation

func startGame() {
    let computerNumberArray: [Int] = makeRandomNumberArray()
    var numberOfTry: Int = 9
    
    while numberOfTry > 0 {
        let randomNumberArray: [Int] = makeRandomNumberArray()
        let result: (Int, Int) = countStrikeBall(computerNumberArray: computerNumberArray, randomNumberArray: randomNumberArray)
        let numberOfStrike: Int = result.0
        let numberOfBall: Int = result.1
        
        print("임의의 수 : ", terminator: "")
        
        print("\(numberOfStrike) 스트라이크, \(numberOfBall) 볼")
        
        if numberOfStrike == 3 {
            break
        } else {
            numberOfTry -= 1
            print("남은기회 \(numberOfTry)")
        }
    }
}

func printRandomNumberArray(randomNumberArray: [Int]) 

func makeRandomNumberArray() -> [Int] {
    var randomSetNumber: Set<Int> = Set<Int>()
    
    while randomSetNumber.count < 3 {
        randomSetNumber.insert(Int.random(in: 1...9))
    }
    
    return Array(randomSetNumber)
}

func countStrikeBall(computerNumberArray: [Int], randomNumberArray: [Int]) -> (Int, Int) {
    var numberOfStrike: Int = 0
    var numberOfBall: Int = 0
    
    for currentIndex in 0..<3 {
        guard let findIndex = randomNumberArray.firstIndex(of: computerNumberArray[currentIndex]) else {
            continue
        }
        if currentIndex == findIndex {
            numberOfStrike += 1
        } else {
            numberOfBall += 1
        }
    }
    
    return (numberOfStrike, numberOfBall)
}

startGame()
