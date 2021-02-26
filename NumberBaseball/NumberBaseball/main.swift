//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

var randomComputerInput: [Int] = []
var gameCountRemainder = 9

// MARK: - Main Class

class NumberBaseballGame {
    init() {
        randomComputerInput = createRandomNumber()
    }
    
    func startGame() {
        while gameCountRemainder > 0 {
            printInstruction()
            guard let optionalInputNumber = readLine() else {
                return
            }
            let inputNumber = optionalInputNumber.split(separator: " ").map { Int(String($0)) ?? -1 }
            if isCheckedInput(userInput: inputNumber) == false {
                continue
            }
            if isCheckedOverlap(userInput: inputNumber) == false {
                continue
            }
            gameCountRemainder -= 1
            print("임의의 수 : \(inputNumber[0]) \(inputNumber[1]) \(inputNumber[2])")
            let gameResult = checkStrikeOrBall(score: inputNumber)
            let strikeNumber = gameResult[0]
            let ballNumber = gameResult[1]
            if strikeNumber == 3 {
                print("사용자 승리!")
                restartGame()
                return
            } else {
                print("\(strikeNumber) 스트라이크, \(ballNumber) 볼")
                print("남은 기회 : \(gameCountRemainder)")
            }
        }
        print("컴퓨터 승리...!")
    }
}

// MARK: - Extension

extension NumberBaseballGame {
    func createRandomNumber() -> [Int] {
        var randomPitches: Set<Int> = []
        while randomPitches.count != 3 {
            let number = Int.random(in: 1...9)
            randomPitches.insert(number)
        }
        return Array(randomPitches)
    }
    func checkStrikeOrBall(score pitch: [Int]) -> [Int] {
        var strikeBallCount: [Int] = []
        strikeBallCount.append(checkStrike(pitcher: pitch))
        strikeBallCount.append(checkBall(pitcher: pitch))
        return strikeBallCount
    }
    
    // MARK: - Check State
    
    func checkStrike(pitcher user: [Int]) -> Int {
        var strike = 0
        for (computerPickedNumber, userPickedNumber) in zip(randomComputerInput, user) {
            if computerPickedNumber == userPickedNumber {
                strike += 1
            }
        }
        return strike
    }
    func checkBall(pitcher user: [Int]) -> Int {
        var ball = 0
        for index in 0..<randomComputerInput.count {
            if randomComputerInput.contains(user[index]) && (randomComputerInput[index] != user[index]) {
                ball += 1
            }
        }
        return ball
    }
    
    // MARK: - Check
    
    func isCheckedOverlap(userInput: [Int]) -> Bool {
        let nonRepeatingNumbers = Set(userInput)
        if nonRepeatingNumbers.count == 3 {
            return true
        } else {
            return false
        }
    }
    func isCheckedInput(userInput: [Int]) -> Bool {
        if userInput.count == 3 && !userInput.contains(-1) {
            return true
        }
        else {
            printError()
            return false
        }
    }
    
    // MARK: - Print
    
    func printInstruction() {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
        print("중복 숫자는 허용하지 않습니다.")
        print("입력", terminator: ":")
    }
    func printError() {
        print("입력이 잘못되었습니다.")
    }
    
    // MARK: - Init Game
    
    func chooseGame() {
        print("1. 게임시작")
        print("2. 게임 종료")
        print("원하는 기능을 선택해주세요", terminator: ": ")
        if let userInput = readLine() {
            switch userInput {
            case "1":
                startGame()
            case "2":
                print("게임을 종료합니다")
            default:
                print("입력이 잘못되었습니다")
                chooseGame()
            }
        }
    }
    func restartGame() {
        gameCountRemainder = 9
        chooseGame()
    }
}

// MARK: - Create Instance && Start

let numberBaseballGame = NumberBaseballGame()
numberBaseballGame.chooseGame()
