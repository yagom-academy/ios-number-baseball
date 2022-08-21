
import Foundation

var chance: Int = 9
let gameNumbers: [Int] = makeRandomThreeNumbers()

func makeRandomThreeNumbers() -> [Int] {
    var randomGameNumbers: Set<Int> = []
    
    while randomGameNumbers.count < 3 {
        randomGameNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomGameNumbers)
}

func compareNumber(userGameNumber: [Int]) -> [Int] {
    var strikeCount = 0
    var ballCount = 0
    
    for index in 0...2 {
        if gameNumbers[index] == userGameNumber[index] {
            strikeCount += 1
        } else if gameNumbers.contains(userGameNumber[index]) {
            ballCount += 1
        }
    }
    return [strikeCount, ballCount]
}

func playNumberBaseballGame() {
    while 0 != chance {
        print("숫자를 3개를 띄어쓰기로 구분하여 입력해주세요. \n중복 숫자는 허용하지 않습니다. \n입력 :", terminator: "")
        let userGameNumbers : [Int] = inputUserNumber()
        let strikeAndBallCounts = compareNumber(userGameNumber: userGameNumbers)
        let gameStrikeCount = strikeAndBallCounts[0]
        let gameBallCount = strikeAndBallCounts[1]
        print("\(gameStrikeCount) 스트라이크, \(gameBallCount) 볼")
        chance -= 1
        
        let stopMessage : Bool = true
        switch stopMessage {
        case chance == 0 :
            print("컴퓨터 승리...!")
            inputUserMenu()
            break
        case strikeAndBallCounts[0] == 3 :
            print("사용자 승리")
            inputUserMenu()
            break
        default :
            print("남은기회 : \(chance)\n")
        }
    }
}

func inputUserMenu() {
    print("1. 게임시작\n2. 게임종료\n원하는 기능을 선택해주세요 :", terminator: "")
    while let inputMenu = readLine() {
        switch inputMenu {
        case "1" :
            playNumberBaseballGame()
 
        case "2" :
            return

        default :
            print("입력이 잘못되었습니다")
            print("1. 게임시작\n2. 게임종료\n원하는 기능을 선택해주세요 :", terminator: "")
        }
    }
}


func inputUserNumber() -> [Int] {
    guard let inputNumbers = readLine()?.components(separatedBy: " ") else {
        print("nil")
        return inputUserNumber()
    }
    
    var intInputNumbers : [Int] = []
    if let firstNum = Int(inputNumbers[0]) {
        intInputNumbers.append(firstNum)
    }
    if let secondNum = Int(inputNumbers[1]) {
        intInputNumbers.append(secondNum)
    }
    if let thirdNum = Int(inputNumbers[2]) {
        intInputNumbers.append(thirdNum)
    }

    let a : Bool = true
    switch a {
    case inputNumbers.isEmpty :
        print("빈값- 입력이 잘못되었습니다")
    case inputNumbers.count != Set(inputNumbers).count :
        print("중복- 입력이 잘못되었습니다")
    case Int(inputNumbers.joined()) == nil :
        print("문자- 입력이 잘못되었습니다")
    default :
        break
    }
    return intInputNumbers
}

inputUserMenu()