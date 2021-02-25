enum GameError: Error {
    case invalidMenu
    case invalidInput
    case exitInput
    case unknownError
}
var answer: [Int] = [0] + Array(repeating: 0, count: 3)    //1-a
var remainingChallengeOpportunity: Int = 9          //1-b

func makeRandomNumber() throws -> [Int] {      //2-a
    var pool = Set<Int>(1...9)
    guard let first = pool.randomElement() else {
        throw GameError.unknownError
    }
    pool.remove(first)
    
    guard let second = pool.randomElement() else {
        throw GameError.unknownError
    }
    pool.remove(second)
    
    guard let third = pool.randomElement() else {
        throw GameError.unknownError
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

func playGame() {
    while true {
        do {
            let userInput = try getUserInput()
            let result = judge(of: userInput)
            remainingChallengeOpportunity -= 1
            
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
        catch {
            switch error {
            case GameError.invalidInput:
                print("입력이 잘못되었습니다.")
            default:
                print("입력이 잘못되었습니다.")
            }
        }
    }
}

func startGame() {
    while true {
        do {
            try printMenu()
            try answer = [0] + makeRandomNumber()
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

func getUserInput() throws -> [Int] {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    
    guard let input = readLine() else {
        return []
    }
    
    let inputArray = input.split(separator: " ")
    let userInput: [Int] = try inputArray.map{
        guard let input = Int($0) else {
            throw GameError.invalidInput
        }
        return input
    }
    
    if userInput.count != 3 {
        throw GameError.invalidInput
    }
    
    for i in 0..<3 {
        if userInput[i] > 9 || userInput[i] < 1 {
            throw GameError.invalidInput
        }
    }
    return [0] + userInput
}

startGame()
