// startGame()

// MARK: 1. 메뉴 구현
// MARK: 2. 메뉴 입력 받기 & 오류 처리
// MARK: 3. 사용자 숫자 입력 받기 & 오류 처리
// MARK: 4. 사용자/컴퓨터 승리 시 메뉴 선택으로 이동

private func printMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
}

private func getPlayerInput() -> Int {
    print("원하는 기능을 선택해주세요", terminator: " : ")
	let input = readLine().map { Int($0) ?? 2 }
    
    return input ?? 2
}

private func validateInput(_ playerInput: Int) -> Bool? {
    switch playerInput {
    case 1: return true
    case 2: return false
    default: return nil
    }
}

private func getPlayerNumbers() -> String? {
	print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
	print("중복 숫자는 허용하지 않습니다.")
	print("입력", terminator: " : ")
	let playerNumbers = readLine()
	return playerNumbers
}

private func validatePlayerNumbers(playerNumbers: String) {
	
}

while true {
    printMenu()
    let playerInput = getPlayerInput()
    guard let isCorrectInput = validateInput(playerInput) else {
        print("입력이 잘못되었습니다.")
        break
    }
    if isCorrectInput {
        startGame()
    } else {
        break
    }
}
