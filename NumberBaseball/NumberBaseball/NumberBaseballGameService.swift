private var computerAnswer: [Int] = []
private var tryCount: Int = 0
private var strikeCount: Int = 0
private var ballCount: Int = 0
private var isPlayerWin: Bool {
	return strikeCount == 3
}

// MARK: 3. 사용자 숫자 입력 받기 & 오류 처리
    // TODO: 사용자 입력과 답을 비교 0
    // TODO: 오류 처리 *
// MARK: 4. 사용자/컴퓨터 승리 시 메뉴 선택으로 이동

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

private func getPlayerNumbers() -> [Int]? {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력", terminator: " : ")
    let playerInput = readLine()
    let playerNumbers = validatePlayerNumbers(playerNumbers: playerInput)
    
    return playerNumbers
}

// 검증만 할지? 아니면 [Int] 반환까지 할지?
private func validatePlayerNumbers(playerNumbers: String?) -> [Int]? {
    if let playerNumbers = playerNumbers {
        let validPlayerNumbers = playerNumbers.split(separator: " ").compactMap { Int($0) }
        return validPlayerNumbers.isEmpty ? nil : validPlayerNumbers
    } else {
        return nil
    }
}

private func playRound() {
	strikeCount = 0
	ballCount = 0
	
    if let playerAnswer = getPlayerNumbers() {
        print("임의의 수 : " + playerAnswer.generateDescription())
        
        checkRoundResultOf(playerAnswer: playerAnswer)
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        tryCount -= 1
    } else {
        print("오류")
    }
	
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
	
	print(isPlayerWin ? "사용자 승리" : "컴퓨터 승리...!")
}
