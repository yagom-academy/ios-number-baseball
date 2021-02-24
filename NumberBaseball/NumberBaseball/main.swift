var answer:[Int] = [0] + Array(repeating: 0, count: 3)
var remainingChallengeOpportunity: Int = 9

func startGame() {
    answer = [0] + makeRandomNumber()
    playGame()
}

func playGame() {
    
}

func getUserInput() -> [Int] {
    let userInput:[Int] = [0] + makeRandomNumber()
    return userInput
}

func makeRandomNumber() -> [Int] {
    var pool = Set<Int>(1...9)
    guard let first = pool.randomElement() else {
        return []
    }
    pool.remove(first)
    
    guard let second = pool.randomElement() else {
        return []
    }
    pool.remove(second)
    
    guard let third = pool.randomElement() else {
        return []
    }
    pool.remove(third)
    
    let randomArray = [first, second, third]
    return randomArray
}

func judge(of userInput: [Int]) -> (strikeCount: Int, ballCount: Int) {
    return (0, 0)
}

func printResult(_ result :(strikeCount: Int, ballCount: Int)) {
    
}

startGame()



