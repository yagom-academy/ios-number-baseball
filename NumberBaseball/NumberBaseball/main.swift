enum GameError: Error {
    case invalidMenu
    case invalidInput
    case exitInput
}
var answer: [Int] = [0] + Array(repeating: 0, count: 3)    //1-a
var remainingChallengeOpportunity: Int = 9          //1-b

func makeRandomNumber() -> [Int] {      //2-a
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

func printResult(_ result :(strikeCount: Int, ballCount: Int)) {
    print("\(result.strikeCount) 스트라이크, \(result.ballCount) 볼")
}

func getUserInput() -> [Int] {
    let userInput:[Int] = [0] + makeRandomNumber()
    return userInput
}
func playGame() {
    while  true {
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
        
        printResult(result)
        
        print("남은 기회 : \(remainingChallengeOpportunity)")
        
        if remainingChallengeOpportunity == 0 || result.strikeCount == 3 {
            break
        }
    }
}

func startGame() {
    while true {
        do {
            try printMenu()
            answer = [0] + makeRandomNumber()
            playGame()
        }
        catch {
            switch error {
            case GameError.invalidMenu:
                print("입력이 잘못되었습니다.")
            case GameError.exitInput:
                return
            default :
                print("입력이 잘못되었습니다.")
            }
        }
    }
}

func printMenu() throws {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    let userInput = readLine()
    
    guard let menuInput = userInput else {
        throw GameError.invalidMenu
    }
    
    if menuInput == "1" {
        
    }
    else if menuInput == "2" {
        throw GameError.exitInput
    }
    else {
        throw GameError.invalidMenu
    }
}
startGame()
