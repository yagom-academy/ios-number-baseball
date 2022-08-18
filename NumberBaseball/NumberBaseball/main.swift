// MARK: 1. 메뉴 구현 - 우선 클리어
// MARK: 2. 메뉴 입력 받기 & 오류 처리 - 우선 클리어
// MARK: 3. 사용자 숫자 입력 받기 - 우선 클리어
	// TODO: - 오류 처리

// MARK: 4. 사용자/컴퓨터 승리 시 메뉴 선택으로 이동

private func printMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
}

private func getPlayerInput() -> Int? {
    print("원하는 기능을 선택해주세요", terminator: " : ")
	guard let input = readLine() else {
		return nil
	}
	
    return Int(input)
}

private func validateInput(_ playerInput: Int?) -> Bool? {
    switch playerInput {
    case 1: return true
    case 2: return false
    default: return nil
    }
}



while true {
	printMenu()
	
	if let isCorrectInput = validateInput(getPlayerInput()) {
		if isCorrectInput {
			startGame()
		} else {
			break
		}
	} else {
		print("입력이 잘못되었습니다.")
	}
}

