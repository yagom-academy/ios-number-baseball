//최신
import Foundation

enum GameError: Error {
    case invalidMenu
    case invalidInput
}
var answer:[Int] = [0] + Array(repeating: 0, count: 3)
var remainingChallengeOpportunity: Int = 9

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
    
    guard let menuInput = readLine() else {
        throw GameError.invalidMenu
    }
    
    guard let menuNumber = Int(menuInput) else{
        throw GameError.invalidMenu
    }
    
    if menuNumber == 1 {
        
    }
    else if menuNumber == 2 {
        exit(0)
    }
    else {
        throw GameError.invalidMenu
    }
}

func playGame() {
    while true {
        remainingChallengeOpportunity -= 1
        let userInput = getUserInput()
        let result = judge(of: userInput)
                
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
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    
    guard let input = readLine() else {
        return []
    }
    
    let inputArray = input.split(separator: " ")
    let userInput: [Int] = inputArray.map{
        guard let input = Int($0) else {
            return 0
        }
        return input
    }
    
    return [0] + userInput
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



