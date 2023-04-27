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

func showMenu() {
    while true {
        print("1. 게임시작 \n2. 게임종료 \n원하는 기능을 선택해주세요 : ", terminator: "")
        guard let menuChoice = readLine() else { continue }
        let startOption = "1"
        let endOption = "2"
        
        if menuChoice == startOption {
            inputUserGameNumber()
        } else if menuChoice == endOption {
            break
        } else {
            print("입력이 잘못되었습니다.")
        }
    }
}

func decreaseCount() {
    count -= 1
}

func checkNumbers(for userInput: String) -> [Int]? {
    let invaildInput = -1
    let vaildNumberLength = 1
    let vaildNumberCount = 3
    let separatedInput = userInput.split(separator: " ")
                                  .map { Int($0) ?? invaildInput }
                                  .filter { $0 != 0 }
    
    if separatedInput.contains(invaildInput)
        || Set(separatedInput.filter({ String($0).count == vaildNumberLength })).count != vaildNumberCount {
        return nil
    }
    return separatedInput
}

func inputUserGameNumber() {
    var isGameDone = true
    while isGameDone {
        print("\n숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.\n입력 : ", terminator: "")
        
        guard let userInput = readLine(), let validNumber = checkNumbers(for: userInput) else {
            print("입력이 잘못되었습니다. \n")
            continue
        }
        let strikeCount = getBallAndStrikeResult(of: validNumber).1
        
        decreaseCount()
        showBallAndStrikeResult(with: validNumber)
    }
}

func showBallAndStrikeResult(with validNumber: [Int]) {
    let (ballCount, strikeCount) = getBallAndStrikeResult(of: validNumber)
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
}

var computerNumbers = makeUniqueRandomNumbers()
var count = 9

showMenu()
