private var targetNumbers: [Int] = []
private var remainingChances: Int = 0
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

private func checkRoundResult(of playerNumbers: [Int]) {
	playerNumbers.enumerated().forEach(checkBallStrikeAt)
}

private func checkBallStrikeAt(index: Int, element: Int) {
    let isBall = targetNumbers.contains(element)
    
    if isBall, targetNumbers[index] == element {
        strikeCount += 1
    } else if isBall {
        ballCount += 1
    }
}

private func convertPlayerInput(_ playerInput: String?) -> [Int] {
	guard let playerInput = playerInput else {
		return []
	}
    
	return playerInput.split(separator: " ").compactMap { Int($0) }
}

private func checkValidty(_ playerInput: [Int]) -> Bool {
    let isUniqueNumbers = playerInput.isUniqueNumbers()
    let isWithinRange = playerInput.isWithinRange()
    let isThree = playerInput.isEqual(to: 3)
    
	return isUniqueNumbers && isWithinRange && isThree
}

private func fetchPlayerNumbers() -> [Int]? {
    print(
        """
        숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
        중복 숫자는 허용하지 않습니다.
        입력
        """,
        terminator: " : ")
	
    let playerInput = readLine()
    
    let convertedPlayerNumbers = convertPlayerInput(playerInput)

	return checkValidty(convertedPlayerNumbers) ? convertedPlayerNumbers : nil
}

private func printRemainingChances() {
	if remainingChances != 0 && !isPlayerWin {
		print("남은 기회 : \(remainingChances)")
	}
}

private func clearCount() {
	strikeCount = 0
	ballCount = 0
}

private func playRound() {
	clearCount()
    
    if let playerAnswer = fetchPlayerNumbers() {
        checkRoundResult(of: playerAnswer)
		
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        
        remainingChances -= 1
		printRemainingChances()
    } else {
        print("입력이 잘못되었습니다")
	}
}

func startGame() {
    clearCount()
	remainingChances = 9
    
	targetNumbers = generateRandomNumbers()
	
	while remainingChances > 0 && !isPlayerWin {
		playRound()
	}
	
	print(isPlayerWin ? "사용자 승리" : "컴퓨터 승리...!")
}
