let targetNumbers: [Int] = generateThreeRandomNumbers()
showManual()

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

    return (strike, ball)
}

func isThreeStrike() -> Bool {
    let myNumbers: [Int] = getThreeGameNumbers()
    let convertedMyNumber: String = myNumbers.reduce("") { String($0) + " " + String($1) }
    let (strike, ball) = countStrikeOrBall(with: myNumbers)
    
    print("임의의 수 :\(convertedMyNumber)" )
    print("\(strike) 스트라이크, \(ball) 볼")
    
    if strike == 3 {
        return true
    }
    return false
}

func showResult() {
    var tryCount = 9

    while tryCount >= 1 {
        if isThreeStrike() {
            print("사용자 승리!")
            break
        }
        
        tryCount -= 1
        
        tryCount != 0 ? print("남은 기회 : \(tryCount)") : print("컴퓨터 승리...!")
    }
}

func showManual() {
    while true {
        print("""
               1. 게임시작
               2. 게임종료
               원하는 기능을 선택해주세요 :
               """, terminator: " ")
        if let input = readLine(), let menuInput = Int(input) {
            switch menuInput {
            case 1:
                showResult()
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
        
        if userInput.count != 3 {
            print("입력이 잘못되었습니다.")
            continue
        }
        
        for number in userInput {
            if number.count == 1, let convertedNumber = Int(number) {
                threeNumbers.append(convertedNumber)
            } else {
                print("입력이 잘못되었습니다.")
                break
            }
        }
        
        if threeNumbers.count == 3 {
            break
        }
        
        threeNumbers.removeAll()
    }
    return threeNumbers
}
