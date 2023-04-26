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

let computerRandomNumbersArray = createComputerRandomNumbers()
var randomNumbersArray = createRandomNumbers()


func judgeResult(randomNumbers: [Int]) -> [Int] {
    var ball: Int = 0
    var strike: Int = 0
	var resultOfStrikeAndBall: [Int] = []
    
	for i in 0...2 {
		if computerRandomNumbersArray[i] == randomNumbersArray[i] {
			strike += 1
		} else if computerRandomNumbersArray[i] != randomNumbersArray[i] && randomNumbersArray.contains(computerRandomNumbersArray[i]) {
			ball += 1
		}
	}
	remainCount -= 1
	print("임의의 수 : \(randomNumbersArray)")
	print("\(strike) 스트라이크, \(ball) 볼")
	print("남은 기회 : \(remainCount)")
	resultOfStrikeAndBall.append(strike)
	resultOfStrikeAndBall.append(ball)
    return resultOfStrikeAndBall
}

