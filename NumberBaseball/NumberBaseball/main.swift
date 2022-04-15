//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

// MARK: - Menu

func menuManager() {
    
    printMenu()
    
    guard let userInput = readLine() else {
        print("\n⚠️ 입력에 오류가 있습니다. 🤬 ⚠️")
        return
    }
    
    selectMenu(userInput)
}

func printMenu() {
    
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
}

func selectMenu(_ input: String) {
    
    switch input {
    case "1":
        startGame()
    case "2":
        return
    default:
        print("입력이 잘못되었습니다.")
    }
    
    menuManager()
}

//MARK: - startGame

func startGame() {
    
    var givenChance: Int = 9
    var computerThreeNumbers: [Int]
    var userThreeNumbers: [Int]
    var resultOfStrikeAndBall: [Int]
    var strikeScore: Int
    var ballScore: Int
    var isSuccess: Bool = false
    
    computerThreeNumbers = generatedRandomNumbers()
    
    while isSuccess == false && givenChance > 0 {
        
        printRequestInput()
        
        userThreeNumbers = inputValidCheck()
        
        resultOfStrikeAndBall = calculateResult(computerNumbers: computerThreeNumbers, userNumbers: userThreeNumbers)
        strikeScore = resultOfStrikeAndBall[0]
        ballScore = resultOfStrikeAndBall[1]
        
        print("\(strikeScore) 스트라이크, \(ballScore) 볼")
        
        isSuccess = checkStrike(strikeScore)
        givenChance -= 1
        
        printWinner(isSuccess: isSuccess, givenChance: givenChance)
    }
}

func inputValidCheck() -> [Int] {
    
    let userInputCount: Int = 3
    var inputNumbers: [Int]
    
    inputNumbers = receiveInput()
    
    while Set(inputNumbers).count != userInputCount || inputNumbers.contains(0) == true {
        
        print("입력이 잘못되었습니다.")
        printRequestInput()
        inputNumbers = receiveInput()
    }
    
    return inputNumbers
}

func receiveInput() -> [Int] {
    
    guard let userThreeNumbers = readLine()?.split(separator: " ").map({ (Str: String.SubSequence) in
        Int(Str) ?? 0
    }) else {
        fatalError("\n⚠️ 입력에 오류가 있습니다. 🤬 ⚠️")
    }
    
    return userThreeNumbers
}

func printRequestInput() {
    
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
}

func printWinner(isSuccess: Bool, givenChance: Int) {
    
    if isSuccess {
        print("사용자 승리...!")
        return
    }
    
    print("남은 기회 : \(givenChance)")
    
    if givenChance == .zero {
        print("컴퓨터 승리...!")
    }
}

func generatedRandomNumbers(range: ClosedRange<Int> = 1...9, count: Int = 3) -> [Int] {
    
    var list: [Int] = []
    
    while list.count != count {
        
        list.append(Int.random(in: range))
        list = Array(Set(list))
    }
    
    return list
}

func checkStrike(_ strike: Int, _ strikeCount: Int = 3) -> Bool {
    
    if strike == strikeCount {
        return true
    } else {
        return false
    }
}

func calculateResult(computerNumbers: [Int], userNumbers: [Int]) -> [Int] {
    
    var resultStrikeAndBall: [Int] = [0, 0]
    
    for userIndex in 0...(userNumbers.count - 1) {
        
        guard let computerIndex = computerNumbers.firstIndex(of: userNumbers[userIndex]) else { continue }
        
        addScore(to: &resultStrikeAndBall, computerIndex: computerIndex, userIndex: userIndex)
    }
    
    return resultStrikeAndBall
}

func addScore(to resultStrikeAndBall: inout [Int], computerIndex: Int, userIndex: Int) {
    
    if computerIndex == userIndex {
        resultStrikeAndBall[0] += 1
    } else {
        resultStrikeAndBall[1] += 1
    }
}

menuManager()
