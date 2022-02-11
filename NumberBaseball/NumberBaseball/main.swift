//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

var computerRandomNumbers:[Int] = [0, 0, 0]
var tryCount: Int = 9

func chooseMenu() {
    var userInputNumber: String?
    while userInputNumber != "2" {
        print("1. 게임시작")
        print("2. 게임종료")
        print("원하는 기능을 선택해주세요 :", terminator: " ")
        userInputNumber = readLine()
        if let number = userInputNumber {
            checkUserChoice(userInput: number)
        }
    }
}

func checkUserChoice(userInput: String) {
    if userInput == "1" {
        startGame()
    } else if userInput == "2" {
        return
    } else {
        print("입력이 잘못 되었습니다.")
    }
}

func startGame() {
    var userStrikeCount: Int = 0
    var userBallCount: Int = 0
    computerRandomNumbers = makeThreeRandomNumbers()
    tryCount = 9
    while tryCount > 0 && userStrikeCount < 3 {
        print(computerRandomNumbers)
        let validUserInput = startUserInput()
        userStrikeCount = 0
        userBallCount = 0
        (userStrikeCount, userBallCount) = checkBall(notStrikeNumbers: checkStrike(userStrikeCount: userStrikeCount, userNumbers: validUserInput), userBallCount: userBallCount)
        tryCount -= 1
        printResult(userStrikeCount: userStrikeCount, userBallCount: userBallCount)
    }
}

func startUserInput() -> [Int] {
    var isVaild:Bool = true
    var validNumber: [Int] = []
    while isVaild == true {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
        print("중복 숫자는 허용하지 않습니다.")
        print("입력 ", terminator: "")
        let userInput = convertUserInput()
        validNumber = checkUserNumberFormat(userInput: userInput)
        if validNumber != [] {
            isVaild = false
        }
    }
    return validNumber
}

func makeThreeRandomNumbers() -> [Int] {
    var randomNumbers: Set<Int> = []
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomNumbers)
}

func convertUserInput() -> [String] {
    var userThreeNumbers: [String] = []
    guard let userInput = readLine() else {
        return []
    }
    for character in userInput {
        userThreeNumbers.append(String(character))
    }
    return userThreeNumbers
}

func checkUserNumberFormat(userInput: [String]) -> [Int] {
    if isStringFormat(userInput: userInput),
        isThreeDigits(userInput: userInput),
        isSameCharacter(userInput: userInput) {
        return makeIntArry(userInput: userInput)
    }
    return []
}

func isStringFormat(userInput: [String]) -> Bool {
    if userInput.isEmpty {
        return false
    }
    if userInput.count != 5 {
        return false
    }
    if userInput[1] != " " || userInput[3] != " " {
        return false
    }
    return true
}

func isThreeDigits(userInput: [String]) -> Bool {
    let noSpaceInput: String = userInput.filter{ $0 != " " }.reduce("") { $0 + String($1) }
    if noSpaceInput.count != 3 || noSpaceInput.contains("0") {
        return false
    }
    guard let _ = Int(noSpaceInput) else {
        return false
    }
    return true
}

func isSameCharacter(userInput: [String]) -> Bool {
    if Set(userInput).count != 4 {
        return false
    }
    return true
}

func makeIntArry(userInput: [String]) -> [Int] {
    var result: [Int] = []
    for character in userInput {
        if character == " " {
            continue
        }
        if let number = Int(String(character)) {
            result.append(number)
        } else {
            return []
        }
    }
    return result
}

func checkStrike(userStrikeCount: Int, userNumbers: [Int]) -> ([Int], Int) {
    var notStrikeNumbers: [Int] = []
    var currentStrikeCount = userStrikeCount
    for (userIndex, userNumber) in userNumbers.enumerated() {
        if let (notStrikeNumber, strikeCount) = countStrike(userNumber: userNumber, userIndex: userIndex, userStrikeCount: currentStrikeCount) {
            currentStrikeCount = strikeCount
            notStrikeNumbers.append(removeOptional(notStrikeNumber: notStrikeNumber))
        }
    }
    return (notStrikeNumbers, currentStrikeCount)
}

func countStrike(userNumber: Int, userIndex: Int, userStrikeCount: Int) -> (Int?, Int)? {
    var strikeCount = userStrikeCount
    for (computerIndex, computerNumber) in computerRandomNumbers.enumerated() {
        if computerNumber == userNumber && computerIndex == userIndex {
            strikeCount += 1
            return (nil, strikeCount)
        }
    }
    return (userNumber, strikeCount)
}

func removeOptional(notStrikeNumber: Int?) -> Int {
    if let number = notStrikeNumber {
        return number
    }
    return 0
}

func checkBall(notStrikeNumbers: ([Int], Int), userBallCount: Int) -> (Int, Int) {
    var ballCount = userBallCount
    let strikeCount = notStrikeNumbers.1
    for checkingNumber in notStrikeNumbers.0 {
        ballCount = countBall(userNumber: checkingNumber, userBallCount: ballCount)
    }
    return (strikeCount, ballCount)
}

func countBall(userNumber: Int, userBallCount: Int) -> Int {
    var ballCount = userBallCount
    for computerNumber in computerRandomNumbers {
        if userNumber == computerNumber {
            ballCount += 1
        }
    }
    return ballCount
}

func printResult(userStrikeCount: Int, userBallCount: Int) {
    print("\(userStrikeCount) 스트라이크, \(userBallCount) 볼")
    print("남은 기회 : \(tryCount)")
    if userStrikeCount == 3 {
        print("사용자 승리...!")
    }
    if tryCount == 0 {
        print("컴퓨터 승리...!")
    }
}

chooseMenu()
