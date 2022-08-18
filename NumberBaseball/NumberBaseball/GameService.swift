private var computerAnswer: [Int] = []
private var tryCount: Int = 0
private var strikeCount: Int = 0
private var ballCount: Int = 0
private var isPlayerWin: Bool {
	return strikeCount == 3
}

private func createRandomNumbers() -> [Int] {
	var numbers: Set<Int> = []
	
	while numbers.count < 3 {
		numbers.insert(Int.random(in: 1...9))
	}
	
	return Array(numbers)
}

private func decideBallStrike(playerNumbers: [Int]) {
	playerNumbers.enumerated().forEach { index, playerNumber in
		if computerAnswer.contains(playerNumber), computerAnswer[index] == playerNumber {
			strikeCount += 1
		} else if computerAnswer.contains(playerNumber) {
			ballCount += 1
		}
	}
}

private func playGameOneTime() {
	strikeCount = 0
	ballCount = 0
	
	let playerAnswer = createRandomNumbers()
	print("임의의 수 : " + playerAnswer.generateDescription())
	
	decideBallStrike(playerNumbers: playerAnswer)
	print("\(strikeCount) 스트라이크, \(ballCount) 볼")
}

private func decreaseAndPrintResult() {
	tryCount -= 1
	
	if tryCount != 0 && !isPlayerWin {
		print("남은 기회 : \(tryCount)")
	}
}

func startGame() {
	tryCount = 9
	computerAnswer = createRandomNumbers()
    
	while tryCount > 0 && !isPlayerWin {
		playGameOneTime()
		decreaseAndPrintResult()
	}
	
	print(isPlayerWin ? "사용자 승리":"컴퓨터 승리...!")
}
