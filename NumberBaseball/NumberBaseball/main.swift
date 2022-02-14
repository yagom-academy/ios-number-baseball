//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

typealias Score = (strike: Int, ball: Int)

enum GameRule {
    static let threeStrike = 3
    static let arrayLengthLimit = 3
    static let userTrialLimit = 9
}

enum GamePrint {
    static let menuDisplay = "1. 게임시작 \n2. 게임종료 \n원하는 기능을 선택해주세요 : "
    static let notificationMessage = """
                                    숫자 세개를 띄어쓰기로 구분해 입력해주세요.
                                    중복 숫자는 허용하지 않습니다.
                                    입력 :
                                    """
    static let inputErrorMessage = "입력이 잘못되었습니다."
}

enum Menu: String {
    case gameStart = "1", gameEnd = "2"
}

func createThreeRandomNumbers() -> [Int] {
    var returnNumbers: [Int] = []
    
    while returnNumbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if returnNumbers.contains(randomNumber) == false {
            returnNumbers.append(randomNumber)
        }
    }
    return returnNumbers
}


func getScore(answerNumbers: Array<Int>, guessNumbers: Array<Int>) -> Score {
    var strike = 0
    var ball = 0
    var gameScore: Score
    
    for guessIndex in 0..<guessNumbers.count {
        if answerNumbers[guessIndex] == guessNumbers[guessIndex] {
            strike += 1
        } else if answerNumbers.contains(guessNumbers[guessIndex]) {
            ball += 1
        }
    }
    gameScore = (strike, ball)
    return gameScore
}

func playGame() {
    let answerNumbers = createThreeRandomNumbers()
    var trialCount = GameRule.userTrialLimit
    
    while trialCount != 0 {
        let guessNumbers = getUserThreeNumbers()
        let score = getScore(answerNumbers: answerNumbers, guessNumbers: guessNumbers)
        
        print("""
         \(score.strike) 스트라이크, \(score.ball) 볼
         임의의 수 : \(guessNumbers[0]) \(guessNumbers[1]) \(guessNumbers[2])
         """)
        trialCount -= 1
        if score.strike == GameRule.threeStrike {
            print("사용자의 승리...!")
            break
        } else if trialCount == 0 {
            print("컴퓨터의 승리...!")
        }
        print("남은 기회 : \(trialCount)")
    }
}

func chooseMenu() -> String {
    print(GamePrint.menuDisplay, terminator: "")
    let enteredNumber = readLine()
    guard let userMenu = enteredNumber else {
        print(GamePrint.inputErrorMessage)
        return chooseMenu()
    }
    if userMenu == Menu.gameStart.rawValue || userMenu == Menu.gameEnd.rawValue {
        return userMenu
    }
    print(GamePrint.inputErrorMessage)
    return chooseMenu()
}

func getUserThreeNumbers() -> [Int] {
    print(GamePrint.notificationMessage, terminator: "")
    let userInput = readLine()
    guard let checkInput = userInput,
         let intArray = checkUserInput(checkInput: checkInput) else {
        print(GamePrint.inputErrorMessage)
        return getUserThreeNumbers()
    }
    return intArray
}

func checkUserInput(checkInput: String) -> [Int]? {
    let checkArray = checkInput.components(separatedBy: " ")
    var returnArray = [Int]()
    if checkArray.count != 3 {
        return nil
    }
    for arrayString in checkArray {
        guard let arrayInt = Int(arrayString),
                 arrayInt < 10, arrayInt > 0,
                 returnArray.contains(arrayInt) == false else {
            return nil
        }
        returnArray.append(arrayInt)
    }
    return returnArray
}

func startProgram() {
    var menu: String
    repeat {
        menu = chooseMenu()
        if menu == Menu.gameStart.rawValue {
            playGame()
        }
    } while menu != Menu.gameEnd.rawValue
}

startProgram()
