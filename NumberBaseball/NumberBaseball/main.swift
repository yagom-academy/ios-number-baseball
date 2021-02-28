enum GameError: Error {
    case invalidMenu
    case invalidInput
    case exitInput
    case unknownError
}
var answer: [Int] = [0] + Array(repeating: 0, count: 3)
var remainingChallengeOpportunity: Int = 9

func makeRandomNumber() throws -> [Int] {
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
    
    for i in 1...3 {
        if userInput[i] == answer[i] {
            strikeCount += 1
        } else if answer.contains(userInput[i]) {
            ballCount += 1
        }
    }
    return (strikeCount, ballCount)
}

func initialize() {
    remainingChallengeOpportunity = 9
    do {
        try answer = [0] + makeRandomNumber()
    }
    catch {
        print("알 수 없는 오류")
    }
}

func playGame() {
    while true {
        var userInput = Array<Int>()
        do {
            userInput = try getUserInput()
        }
        catch {
            print("입력이 잘못되었습니다.")
            continue
        }
        
        let result = judge(of: userInput)
        remainingChallengeOpportunity -= 1
        
        print("\(result.strikeCount) 스트라이크, \(result.ballCount) 볼")
        
        print("남은 기회 : \(remainingChallengeOpportunity)")
        
        if result.strikeCount == 3 {
            print("사용자 승리!")
        } else if remainingChallengeOpportunity == 0 {
            print("컴퓨터 승리...!")
        }
        
        if remainingChallengeOpportunity == 0 || result.strikeCount == 3 {
            return
        }
    }
}

func startGame() {
    while true {
        initialize()
        do {
            try selectGameStartOrEnd()
            playGame()
        } catch {
            switch error {
            case GameError.exitInput:
                return
            default:
                print("입력이 잘못되었습니다.")
            }
        }
    }
}

func selectGameStartOrEnd() throws {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    
    let userInput = readLine()
    guard let menuInput = userInput else {
        throw GameError.invalidMenu
    }
    
    switch menuInput {
    case "1":
        return
    case "2":
        throw GameError.exitInput
    default:
        throw GameError.invalidMenu
    }
}

func getUserInput() throws -> [Int] {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    
    let userInputArray = readLine()?.split(separator: " ")
    guard let inputArray = userInputArray else {
        throw GameError.unknownError
    }
    
    let arrayInRangeOneToNine: [Int] = try inputArray.map {
        guard let input = Int($0) else {
            throw GameError.invalidInput
        }
        if input > 9 || input < 1 {
            throw GameError.invalidInput
        }
        return input
    }
    
    if arrayInRangeOneToNine.count != 3 {
        throw GameError.invalidInput
    }
    
    if arrayInRangeOneToNine.count != Set(arrayInRangeOneToNine).count {
        throw GameError.invalidInput
    }

    return [0] + arrayInRangeOneToNine
}

startGame()
