import Foundation

private var answer: [Int] = []
private var tryCount: Int = 9
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
		if answer.contains(playerNumber), answer[index] == playerNumber {
			strikeCount += 1
		} else if answer.contains(playerNumber) {
			ballCount += 1
		}
	}
}

private func startGame() {
	answer = createRandomNumbers()
	while tryCount > 0 {
		strikeCount = 0
		ballCount = 0
		
		let trial = createRandomNumbers()
		print("임의의 수 : " + trial.description)
		
		decideBallStrike(playerNumbers: trial)
		
		print("\(strikeCount) 스트라이크, \(ballCount) 볼")
		if isPlayerWin {
			print("사용자 승리!")
			break
		}
		tryCount -= 1
		
		if tryCount != 0 {
			print("남은 기회 : \(tryCount)")
		}
	}
	print("컴퓨터 승리...!")
}

private extension Array where Element == Int {
	func generateDescription() -> String {
		return self.map { String($0) }.joined(separator: " ")
	}
}

startGame()
