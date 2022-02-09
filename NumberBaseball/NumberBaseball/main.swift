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

func checkBallCount(playerNumber: [Int], computerNumber: [Int]) -> [Int] {
    let computerNumbersWithoutOrder: Set<Int> = Set(computerNumber)
    let userNumbersWithoutOrder: Set<Int> = Set(playerNumber)
    let sameNumbers: Set<Int> = computerNumbersWithoutOrder.intersection(userNumbersWithoutOrder)

    return Array(sameNumbers)
}


