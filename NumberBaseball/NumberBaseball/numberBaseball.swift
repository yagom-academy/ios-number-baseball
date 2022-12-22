func startGame() {
    let computerNumberArray: [Int] = makeRandomNumberArray()
    var numberOfTry: Int = 9
    
    while numberOfTry > 0 {
        let userNumberArray: [Int] = inputNumber()
        if isValidInput(userNumber: userNumberArray) == false {
            break
        }
        let result: (Int, Int) = countStrikeBall(baseArray: computerNumberArray,
                                                 compareArray: userNumberArray)
        let numberOfStrike: Int = result.0
        let numberOfBall: Int = result.1
        
        printNumberArray(numberArray: userNumberArray)
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

func printNumberArray(numberArray: [Int]) {
    print("임의의 수 : ", terminator: "")
    for number in numberArray {
        print(number, terminator: " ")
    }
}

func printNumberOfStrikeBall(strike: Int, ball: Int) {
    print("\n\(strike) 스트라이크, \(ball) 볼")
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
//    var isRun: Bool = true
    inputNumber()
    while isRun {
        selectMenu(onOff: isRun)
    }
}

var isRun: Bool = true

func selectMenu(onOff: Bool) {
    print("1. 게임시작\n2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    let selectInput: String? = readLine()
    
    switch selectInput {
    case "1" :
        startGame()
    case "2" :
//        endGame(onOff: false)
        isRun = false
    default :
        print("입력이 잘못되었습니다.")
    }
}

func endGame(onOff: Bool) {
//    onOff = false
    print("endgame")
}

func inputNumber() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    guard let userInput = readLine() else { return
        print("입력이 잘못되었습니다.")
    }
    
    print(userInput)
}

func isValidInput(userNumber:[Int]) -> Bool {
    if Set(userNumbers).count != 3 {
        return false
    }
    for number in userNumber {
        if number < 1, number > 9 {
            return false
        }
    }
    
    return false
}
