import Foundation


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
	randomNumbers.removeAll()
    while randomNumbers.count != 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
	let randomNumbers = Array(randomNumbers)
    return randomNumbers
}


func judgeResult(computerRandomNumbersArray: [Int] ,randomNumbersArray: [Int]) -> [Int] {
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
    
    
    print("\(strike) 스트라이크, \(ball) 볼")
    
    resultOfStrikeAndBall.append(strike)
    resultOfStrikeAndBall.append(ball)
    return resultOfStrikeAndBall
}

func startGame() {
	var remainCount: Int = 9
    let computerRandomNumbersArray = createComputerRandomNumbers()
	while remainCount != 0 {
		let randomNumbersArray = createRandomNumbers()
		print("임의의 수 : \(randomNumbersArray[0]) \(randomNumbersArray[1]) \(randomNumbersArray[2])")
		let judgeResult = judgeResult(computerRandomNumbersArray: computerRandomNumbersArray, randomNumbersArray: randomNumbersArray)
		remainCount -= 1
		
		if remainCount != 0 {
			print("남은 기회 : \(remainCount)")
		} else {
			print("컴퓨터 승리...!")
		}
	}
}
startGame()
