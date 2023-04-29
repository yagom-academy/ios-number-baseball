//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//


var computerRandomNumbers: Set<Int> = []
var randomNumbers: Set<Int> = []

func createRandomNumbers() -> (userRandomNumbers: [Int], computerRandomNumbers: [Int]) {
    randomNumbers.removeAll()
    while randomNumbers.count != 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
	while computerRandomNumbers.count != 3 {
		computerRandomNumbers.insert(Int.random(in: 1...9))
	}
	let randomNumbers = Array(randomNumbers)
	let computerRandomNumbers = Array(computerRandomNumbers)
	let returnValue: ([Int], [Int]) = (randomNumbers, computerRandomNumbers)
	
    return returnValue
}

func judgeStrikeAndBall(_ computerRandomNumbers: [Int],_ randomNumbers: [Int]) -> (strike: Int, ball: Int) {
	var strikeAndBall: (strike: Int, ball: Int) = (0, 0)
    for i in 0...2 {
        if computerRandomNumbers[i] == randomNumbers[i] {
			strikeAndBall.strike += 1
        } else if computerRandomNumbers[i] != randomNumbers[i] && randomNumbers.contains(computerRandomNumbers[i]) {
			strikeAndBall.ball += 1
        }
    }
    return strikeAndBall
}

func startGame() {
    var remainCount: Int = 9
	let computerRandomNumbers = createRandomNumbers().computerRandomNumbers

    while remainCount > 0 {
		let randomNumbers = createRandomNumbers().userRandomNumbers
        let judgeResult = judgeStrikeAndBall(computerRandomNumbers, randomNumbers)
		let strike = judgeResult.strike
		let ball = judgeResult.ball
        remainCount -= 1

        print("임의의 수 : \(randomNumbers[0]) \(randomNumbers[1]) \(randomNumbers[2])")
        print("\(strike) 스트라이크, \(ball) 볼")

        if remainCount > 0 && strike < 3 {
            print("남은 기회 : \(remainCount)")
        } else if strike == 3 {
            print("사용자 승리!")
            remainCount = 0
        } else {
            print("컴퓨터 승리...!")
        }
    }
}

