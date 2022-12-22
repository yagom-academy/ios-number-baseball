//  numberBaseball.swift

func startGame() {
    let computerNumberArray: [Int] = makeRandomNumberArray()
    var numberOfTry: Int = 9

    while numberOfTry > 0 {
        let userInputNumber: [String] = inputNumber()
        var userNumberArray: [Int] = [Int]()

        if isValidInput(userInput: userInputNumber) {
            userNumberArray = convertToInt(stringArray: userInputNumber)
        } else {
            print("입력이 잘못되었습니다")
            continue
        }
        
        let result: (Int, Int) = countStrikeBall(baseArray: computerNumberArray,
                                                 compareArray: userNumberArray)
        let numberOfStrike: Int = result.0
        let numberOfBall: Int = result.1

        printNumberOfStrikeBall(strike: numberOfStrike, ball: numberOfBall)

        if numberOfStrike == 3 {
            break
        } else {
            numberOfTry -= 1
            print("남은기회 \(numberOfTry)")
        }
    }
    printWinner(remainingTry: numberOfTry)
}

func printNumberOfStrikeBall(strike: Int, ball: Int) {
    print("\(strike) 스트라이크, \(ball) 볼")
}

func makeRandomNumberArray() -> [Int] {
    var randomSetNumber: Set<Int> = Set<Int>()
    
    while randomSetNumber.count < 3 {
        randomSetNumber.insert(Int.random(in: 1...9))
    }
    
    return Array(randomSetNumber)
}

func countStrikeBall(baseArray: [Int], compareArray: [Int]) -> (Int, Int) {
    var numberOfStrike: Int = 0
    var numberOfBall: Int = 0
    
    for currentIndex in 0..<3 {
        guard let findIndex = compareArray.firstIndex(of: baseArray[currentIndex]) else {
            continue
        }
        if currentIndex == findIndex {
            numberOfStrike += 1
        } else {
            numberOfBall += 1
        }
    }
    return (numberOfStrike, numberOfBall)
}

func printWinner(remainingTry: Int) {
    if remainingTry == 0 {
        print("컴퓨터 승리...")
    } else {
        print("유저 승리!")
    }
}

func runProgram() {
    while switchOn {
        selectMenu(gameSwitch: switchOn)
    }
}

var switchOn: Bool = true

func selectMenu(gameSwitch: Bool) {
    print("1. 게임시작\n2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    let selectInput: String? = readLine()
    
    switch selectInput {
    case "1" :
        startGame()
    case "2" :
        endGame()
    default :
        print("입력이 잘못되었습니다.")
    }
}

func endGame() {
    switchOn = false
}

func inputNumber() -> [String] {
    var stringArray: [String] = [String]()
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    if let userInput = readLine() {
        stringArray = userInput.split(separator: " ").map{String($0)}
    }
    return stringArray
}

func convertToInt(stringArray: [String]) -> [Int] {
    var intArray: [Int] = [Int]()
    for stringNumber in stringArray {
        if let number = Int(stringNumber) {
            intArray.append(number)
        }
    }
    return intArray
}

func isValidInput(userInput: [String]) -> Bool {
    if Set(userInput).count != 3 {
        return false
    }
    for stringNumber in userInput {
        guard let number = Int(stringNumber) else {
            return false
        }
        if number < 1 || number > 9 {
            return false
        }
    }
    return true
}
