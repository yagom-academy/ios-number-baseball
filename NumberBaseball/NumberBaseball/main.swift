let targetNumbers: [Int] = generateThreeRandomNumbers()
runNumberBaseballGame()

func generateThreeRandomNumbers() -> [Int] {
    let shuffledNumbers = (1...9).shuffled()
    let threeNumbers = Array(shuffledNumbers.prefix(3))
    return threeNumbers
}

func countStrikeOrBall(with myNumbers: [Int]) -> (Int, Int) {
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

func isThreeStrike(in userNumber : [Int]) -> Bool {
    let strike: Int = countStrikeOrBall(with: userNumber).0
    
    if strike == 3 {
        return true
    }
    
    return false
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

func runNumberBaseballGame() {
    while true {
        print("""
               1. 게임시작
               2. 게임종료
               원하는 기능을 선택해주세요 :
               """, terminator: " ")
        if let input = readLine(), let menuInput = Int(input) {
            switch menuInput {
            case 1:
                manageNumberBaseballGame()
            case 2:
                return
            default:
                print("입력이 잘못되었습니다.")
            }
        }
    }
}

func getThreeGameNumbers() -> [Int] {
    var threeNumbers = [Int]()
    
    while true {
        print("""
               숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
               중복 숫자는 허용하지 않습니다.
               입력 :
               """, terminator: " ")
        guard let userInput = readLine()?.split(separator: " ").map({ String($0) }) else {
            continue
        }
        
        threeNumbers = checkValid(userInput)
        
        if !threeNumbers.isEmpty {
            break
        }
        
        print("입력이 잘못됐습니다.")
    }
    
    return threeNumbers
}

func checkValid(_ userInput: [String]) -> [Int] {
    var validNumbers = [Int]()
    
    if userInput.count != 3 {
        return []
    }
    
    for number in userInput {
        if number.count == 1, let convertedNumber = Int(number), convertedNumber != 0 {
            validNumbers.append(convertedNumber)
        } else {
            return []
        }
    }
    
    return validNumbers
}

