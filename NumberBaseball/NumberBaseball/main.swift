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
	case 2: return nil
	default: return false
	}
}

private func actCorrectMenu(isCorrectMenu: Bool) {
	if isCorrectMenu {
		startGame()
	} else {
		print("입력이 잘못되었습니다")
	}
}

consoleLoop: while true {
	printMenu()
	switch validateInput(getPlayerInput()) {
	case .some(let isCorrectMenu):
		actCorrectMenu(isCorrectMenu: isCorrectMenu)
	case .none:
		break consoleLoop
	}
}

