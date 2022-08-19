private func fetchPlayerInput() -> Int? {
	print("원하는 기능을 선택해주세요", terminator: " : ")
    
	guard let input = readLine(),
		  let playerInputValue = Int(input) else {
		return nil
	}
	
	return playerInputValue
}

private func identifyPlayerInput(_ playerInput: Int) {
	if playerInput == 1 {
		startGame()
	} else if playerInput > 2 || playerInput < 1 {
		errorAction()
	}
}

private func errorAction() {
	print("입력이 잘못되었습니다")
	showMenu()
}

private func showMenu() {
	print("1. 게임시작")
	print("2. 게임종료")
	
	guard let value = fetchPlayerInput() else {
		errorAction()
		return
	}
	
	identifyPlayerInput(value)
}

showMenu()
