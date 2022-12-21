func startGame() {
    let computerNumberArray: [Int] = makeRandomNumberArray()
    var numberOfTry: Int = 9
    
    while numberOfTry > 0 {
        let randomNumberArray: [Int] = makeRandomNumberArray()
        let result: (Int, Int) =
            countStrikeBall(baseArray: computerNumberArray, compareArray: randomNumberArray)
        let numberOfStrike: Int = result.0
        let numberOfBall: Int = result.1
        
        printNumberArray(numberArray: randomNumberArray)
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
