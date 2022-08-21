func runNumberBaseballGame() {
    printMenuList()
    
    guard let menuNumber = readLine() else { return }
    
    switch menuNumber {
    case "1":
        manageNumberBaseballGame()
        runNumberBaseballGame()
    case "2":
        return
    default:
        print("입력이 잘못되었습니다.")
        runNumberBaseballGame()
    }
}

func printMenuList() {
    print("""
          1. 게임시작
          2. 게임종료
          원하는 기능을 선택해주세요 :
          """, terminator: " ")
}

func manageNumberBaseballGame() {
    for leftTryCount in (0..<9).reversed() {
        let userNumbers: [Int] = getThreeGameNumbers()
        if isThreeStrike(in: userNumbers) {
            print("사용자 승리!")
            break
        }
        
        print(leftTryCount != 0 ? "남은 기회: \(leftTryCount)" : "컴퓨터 승리...!")
    }
}

func getThreeGameNumbers() -> [Int] {
    while true {
        printNumberInputRule()
        let userInput: [String] = getStringInput()
        guard let threeNumbers = convertToIntArray(userInput: userInput) else {
            printWrongInputMessage()
            continue
        }
        
        return threeNumbers
    }
}

func printNumberInputRule() {
    print("""
           숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
           중복 숫자는 허용하지 않습니다.
           입력 :
           """, terminator: " ")
}

func printWrongInputMessage() {
    print("입력이 잘못됐습니다.")
}

func getStringInput() -> [String] {
    let convertedInput = readLine()?.split(separator: " ").map({ String($0) })
    
    return convertedInput ?? []
}

func convertToIntArray(userInput: [String]) -> [Int]? {
    var convertedArray = [Int]()
    
    if isValid(userInput) {
        convertedArray = userInput.compactMap({ Int($0 )})
        return convertedArray
    }
    
    return nil
}

func isValid(_ userInput: [String]) -> Bool {
    if userInput.count != 3 {
        return false
    }
    
    for number in userInput {
        if number.count == 1, let convertedNumber = Int(number), convertedNumber != 0 {
            continue
        } else {
            return false
        }
    }
    
    return true
}

func isThreeStrike(in userNumber : [Int]) -> Bool {
    let strike: Int = countStrikeOrBall(with: userNumber).strike
    
    if strike == 3 {
        return true
    }
    
    return false
}

func countStrikeOrBall(with myNumbers: [Int]) -> (strike: Int, ball: Int) {
    var (strike, ball) = (0, 0)

    for (number, myNumber) in zip(targetNumbers, myNumbers) {
        if number == myNumber {
            strike += 1
        } else if targetNumbers.contains(myNumber) {
            ball += 1
        }
    }

    print("\(strike) 스트라이크, \(ball) 볼")
    return (strike, ball)
}

func generateThreeRandomNumbers() -> [Int] {
    let shuffledNumbers = (1...9).shuffled()
    let threeNumbers = Array(shuffledNumbers.prefix(3))
    return threeNumbers
}
