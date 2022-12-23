//  NumberBaseball-NumberBaseball.swift
//  Created by vetto, 무리 on 2022.12.22

func startGame() {
    let strikeToWin: Int = 3
    let computerNumberArray: [Int] = makeRandomNumberArray()
    var numberOfTry: Int = 9
    
    while numberOfTry > 0 {
        let userInputNumber: [String] = inputToStringArray()
        var userNumberArray: [Int]

        if validInput(userInput: userInputNumber) {
            userNumberArray = convertToIntArray(stringArray: userInputNumber)
        } else {
            print("입력이 잘못되었습니다")
            continue
        }
        
        let result: (Int, Int) = countStrikeAndBall(baseArray: computerNumberArray,
                                                 compareArray: userNumberArray)
        let numberOfStrike: Int = result.0
        let numberOfBall: Int = result.1

        printNumberOfStrikeAndBall(strike: numberOfStrike, ball: numberOfBall)

        if numberOfStrike == strikeToWin {
            break
        } else {
            numberOfTry -= 1
            print("남은기회 \(numberOfTry)")
        }
    }
    
    printWinner(remainingTry: numberOfTry)
}

func printNumberOfStrikeAndBall(strike: Int, ball: Int) {
    print("\(strike) 스트라이크, \(ball) 볼")
}

func makeRandomNumberArray() -> [Int] {
    let maxLengthOfArray: Int = 3

    var randomSetNumber: Set<Int> = Set<Int>()
    
    while randomSetNumber.count < maxLengthOfArray {
        randomSetNumber.insert(Int.random(in: 1...9))
    }
    
    return Array(randomSetNumber)
}

func countStrikeAndBall(baseArray: [Int], compareArray: [Int]) -> (Int, Int) {
    var numberOfStrike: Int = 0
    var numberOfBall: Int = 0
    
    for currentIndex in 0..<baseArray.count {
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
    remainingTry == 0 ? print("컴퓨터 승리...") : print("사용자 승리!")
}

func runProgram() {
    var switchOn: Bool = true
    
    while switchOn {
        selectMenu(gameSwitch: &switchOn)
    }
}

func selectMenu(gameSwitch: inout Bool) {
    let numberOfGameStart: String = "1"
    let numberOfGameEnd: String = "2"
    
    print("1. 게임시작\n2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    
    let selectInput: String? = readLine()
    
    switch selectInput {
    case numberOfGameStart :
        startGame()
    case numberOfGameEnd :
        endGame(switchOn: &gameSwitch)
    default :
        print("입력이 잘못되었습니다.")
    }
}

func endGame(switchOn: inout Bool) {
    switchOn = false
}

func inputToStringArray() -> [String] {
    var stringArray: [String] = [String]()
    
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    
    if let userInput = readLine() {
        stringArray = userInput.split(separator: " ").map{String($0)}
    }
    
    return stringArray
}

func convertToIntArray(stringArray: [String]) -> [Int] {
    var intArray: [Int] = [Int]()
    
    for stringNumber in stringArray {
        if let number = Int(stringNumber) {
            intArray.append(number)
        }
    }
    
    return intArray
}

func validInput(userInput: [String]) -> Bool {
    if Set(userInput).count != 3 || userInput.count != 3 {
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
