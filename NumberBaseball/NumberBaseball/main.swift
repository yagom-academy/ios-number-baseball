import Foundation

var computerThreeRandomNumber: [Int] = []
var remainingTime: Int = 9

func createThreeRamdomNumber() -> [Int] {
    var threeRandomNumber: Set<Int> = []
    
    while threeRandomNumber.count < 3 {
        threeRandomNumber.insert(Int.random(in: 1...9))
    }
    return Array(threeRandomNumber)
}

