import Foundation

var computerRandomNumber: [Int] = []
var playerRanomNumber: [Int] = []
var remainingTime: Int = 9

func createThreeRamdomNumber() -> [Int] {
    var threeRandomNumber: Set<Int> = []
    
    while threeRandomNumber.count < 3 {
        threeRandomNumber.insert(Int.random(in: 1...9))
    }
    return Array(threeRandomNumber)
}

func compare(computerNumber: [Int], playerNumber: [Int]) -> [Int] {
    var strikeBallStack: [Int] = [0, 0]

    for index in 0..<3 {
        if computerRandomNumber[index] == playerNumber[index] {
            strikeBallStack[0] += 1
        } else if computerRandomNumber.contains(playerNumber[index]) {
            strikeBallStack[1] += 1
        }
    }

    return strikeBallStack
}


