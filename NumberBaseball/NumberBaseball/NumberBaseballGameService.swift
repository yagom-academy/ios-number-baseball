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
	playerAnswer.enumerated().forEach(checkBallStrikeAt)
}

private func checkBallStrikeAt(index: Int, playerNumber: Int) {
    let isBall = computerAnswer.contains(playerNumber)
    if isBall, computerAnswer[index] == playerNumber {
        strikeCount += 1
    } else if isBall {
        ballCount += 1
    }
}

private func convert(_ playerInput: String?) -> [Int] {
	guard let playerInput = playerInput else {
		return []
	}
	return playerInput.split(separator: " ").compactMap { Int($0) }
}

// 3. 중복된 숫자가 있는 경우 -> false
private func isUnique(_ playerInput: [Int]) -> Bool {
	let uniqueNumbers = Set(playerInput)
	guard uniqueNumbers.count == 3 else {
		return false
	}
	
	return true
}

// 2. 1~9에 포함되지 않는 경우 -> false
private func isContainNine(_ playerInput: [Int]) -> Bool {
	let filteredValues = playerInput.filter { $0 > 0 && $0 < 10 }
	guard filteredValues.count == 3 else {
		return false
	}
	
	return true
}

// 1. 3개 이상의 값이 들어왔을 경우 -> false
private func isThree(_ playerInput: [Int]) -> Bool {
	guard playerInput.count == 3 else {
		return false
	}
	
	return true
}

private func checkValidty(_ playerInput: [Int]) -> Bool {
	let isUnique = isUnique(playerInput)
	let isContainNine = isContainNine(playerInput)
	let isThree = isThree(playerInput)
	return isUnique && isContainNine && isThree
}

private func receivePlayerNumbers() -> [Int]? {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력", terminator: " : ")
	
    let playerInput = readLine()
	
    let convertedPlayerNumbers = convert(playerInput)

	return checkValidty(convertedPlayerNumbers) ? convertedPlayerNumbers : nil
}

private func printTryCountResult() {
	if tryCount != 0 && !isPlayerWin {
		print("남은 기회 : \(tryCount)")
	}
}

private func clearCount() {
	strikeCount = 0
	ballCount = 0
}

private func playRound() {
	clearCount()
    if let playerAnswer = receivePlayerNumbers() {
        checkRoundResultOf(playerAnswer: playerAnswer)
		
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        tryCount -= 1
		printTryCountResult()
    } else {
        print("입력이 잘못되었습니다")
	}
}

func startGame() {
	tryCount = 9
	computerAnswer = generateRandomNumbers()
	clearCount()
	
	while tryCount > 0 && !isPlayerWin {
		playRound()
	}
	
	print(isPlayerWin ? "사용자 승리" : "컴퓨터 승리...!")
}
