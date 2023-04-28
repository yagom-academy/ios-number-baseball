//
//  NumberBaseball - main.swift
//  Created by myungsun, yyss99.
//  Copyright © yagom academy. All rights reserved.
//

func makeUniqueRandomNumbers() -> [Int] {
    var randomNumbers = Set<Int>()
    
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    
    return Array(randomNumbers)
}

func showMenu() {
    let startOption = "1"
    let endOption = "2"
    var isMenuChoiceOn = true
    
    while isMenuChoiceOn {
        print("1. 게임시작 \n2. 게임종료 \n원하는 기능을 선택해주세요 : ", terminator: "")
        guard let menuChoice = readLine() else { continue }
        
        switch menuChoice {
        case startOption:
            startGame()
        case endOption:
            isMenuChoiceOn = false
        default:
            print("입력이 잘못되었습니다.")
            continue
        }
    }
}

func startGame() {
    var isGameOn = true
    while isGameOn {
        print("\n숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.\n입력 : ", terminator: "")
        
        guard let userInput = readLine(),
              let validNumber = checkNumbers(for: userInput) else {
            print("입력이 잘못되었습니다. \n")
            continue
        }
        let (ballCount, strikeCount) = getBallAndStrikeResult(of: validNumber)
        
        decreaseCount()
        showBallAndStrikeResultWith(ballCount, strikeCount)
        isGameOn = getGameResult(with: strikeCount)
    }
    resetGame()
}

func checkNumbers(for userInput: String) -> [Int]? {
    let invaildInput = -1
    let validNumberLength = 1
    let validNumberCount = 3
    let separatedInput = userInput.split(separator: " ")
                                  .map { Int($0) ?? invaildInput }
                                  .filter { $0 != 0 }
    
    if hasInvalidInput(in: separatedInput, invaildInput) ||
        hasInvalidNumberCount(in: separatedInput, validNumberCount, validNumberLength) {
        return nil
    }
    return separatedInput
}

func hasInvalidInput(in separatedInput: [Int], _ invalidInput: Int) -> Bool {
    return separatedInput.contains(invalidInput) ? true : false
}

func getValidLengthNumbers(in separatedInput: [Int], _ validNumberLength: Int) -> [Int] {
    return separatedInput.filter { String($0).count == validNumberLength }
}

func hasInvalidNumberCount(in separatedInput: [Int], _ validNumberCount: Int, _ validNumberLength: Int) -> Bool {
    let validLengthNumbers = getValidLengthNumbers(in: separatedInput, validNumberLength)
    return Set(validLengthNumbers).count != validNumberCount ? true : false
}

func getBallAndStrikeResult(of userNumbers: [Int]) -> (Int, Int) {
    let sameNumbers = computerNumbers.filter { userNumbers.contains($0) }
    var ballCount = 0
    var strikeCount = 0
    
    for number in sameNumbers {
        if computerNumbers.firstIndex(of: number) == userNumbers.firstIndex(of: number) {
            strikeCount += 1
        }
    }
    ballCount = sameNumbers.count - strikeCount
    
    return (ballCount, strikeCount)
}

func decreaseCount() {
    count -= 1
}

func showBallAndStrikeResultWith(_ ballCount: Int, _ strikeCount: Int) {
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
}

func getGameResult(with strikeCount: Int) -> Bool {
    if strikeCount == 3 {
        print("사용자 승리!\n")
        return false
    } else {
        print("남은 기회 : \(count)\n")
    }
    
    if count == 0 {
        print("컴퓨터 승리...!\n")
        return false
    }
    
    return true
}

func resetGame() {
    computerNumbers = makeUniqueRandomNumbers()
    count = 9
}

var computerNumbers = makeUniqueRandomNumbers()
var count = 9

showMenu()
