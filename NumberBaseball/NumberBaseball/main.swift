import Foundation

var remainCount: Int = 9
var computerRandomNumbers: Set<Int> = []
var randomNumbers: Set<Int> = []

func createComputerRandomNumbers() -> [Int] {
	while computerRandomNumbers.count != 3 {
        computerRandomNumbers.insert(Int.random(in: 1...9))
	}
    let computerRandomNumbers = Array(computerRandomNumbers)
	return computerRandomNumbers
}

func createRandomNumbers() -> [Int] {
    while randomNumbers.count != 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    let randomNumbers = Array(randomNumbers)
    return randomNumbers
}

func judgeResult(randomNumbers: [Int]) -> [Int] {
    var ball: Int = 0
    var strike: Int = 0
    
    
    return [0]
}
