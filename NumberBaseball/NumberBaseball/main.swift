var answer:[Int] = [0] + Array(repeating: 0, count: 3)
var remainingChallengeOpportunity: Int = 9

func startGame() {
    answer = [0] + makeRandomNumber()
    playGame()
}

func playGame() {
    while true {
        remainingChallengeOpportunity -= 1
        let userInput = getUserInput()
        let result = judge(of: userInput)
        
        print("임의의 수 : \(userInput[1]) \(userInput[2]) \(userInput[3])")
        
        if result.strikeCount == 3 {
            print("사용자 승리!")
        }
        else if remainingChallengeOpportunity == 0 {
            print("컴퓨터 승리...!")
        }
        
        print("\(result.strikeCount) 스트라이크, \(result.ballCount) 볼")
        
        print("남은 기회 : \(remainingChallengeOpportunity)")
        
        if remainingChallengeOpportunity == 0 || result.strikeCount == 3 {
            break
        }
    }
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
    var strikeCount = 0
    var ballCount = 0
    outer: for i in 1...3{
        inner: for j in 1...3{
            if userInput[i] == answer[i] {
                strikeCount += 1
                break inner
            }
            else if userInput[i] == answer[j] {
                ballCount += 1
            }
        }
    }
    return (strikeCount, ballCount)
}

startGame()



