private var computerAnswer: [Int] = []
private var tryCount: Int = 0
private var strikeCount: Int = 0
private var ballCount: Int = 0
private var isPlayerWin: Bool {
	return strikeCount == 3
}

private func generateRandomNumbers() -> [Int] {
	var numbers: Set<Int> = []
	
	while numbers.count < 3 {
		numbers.insert(Int.random(in: 1...9))
	}
	
	return Array(numbers)
}

private func checkRoundResultOf(playerAnswer: [Int]) {
	playerAnswer.enumerated().forEach { index, playerNumber in
        checkBallStrikeAt(index: index, playerNumber: playerNumber)
	}
}

private func checkBallStrikeAt(index: Int, playerNumber: Int) {
    let isBall = computerAnswer.contains(playerNumber)
    if isBall, computerAnswer[index] == playerNumber {
        strikeCount += 1
    } else if isBall {
        ballCount += 1
    }
}

private func playRound() {
	strikeCount = 0
	ballCount = 0
	
	let playerAnswer = generateRandomNumbers()
	print("임의의 수 : " + playerAnswer.generateDescription())
	
	checkRoundResultOf(playerAnswer: playerAnswer)
	print("\(strikeCount) 스트라이크, \(ballCount) 볼")
	tryCount -= 1
}

private func printTryCountResult() {
	if tryCount != 0 && !isPlayerWin {
		print("남은 기회 : \(tryCount)")
	}
}

func startGame() {
	tryCount = 9
	computerAnswer = generateRandomNumbers()
	debugPrint("Computer Answer : \(computerAnswer)")
	while tryCount > 0 && !isPlayerWin {
		playRound()
		printTryCountResult()
	}
	
	print(isPlayerWin ? "사용자 승리":"컴퓨터 승리...!")
}
