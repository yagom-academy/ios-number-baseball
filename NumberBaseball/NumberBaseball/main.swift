//
//  NumberBaseball - main.swift
//  Created by 애종,LJ.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

var computerNumberArray: Array<Int> = []
var tryCount: Int = 9

func startGame() {
    var selectedMenu: String
    repeat {
        selectedMenu = selectMenu()
        
        switch selectedMenu {
            case "1":
                playGame()
                tryCount = 9
            case "2":
                break
            default:
                print("입력이 잘못되었습니다.")
        }
    } while selectedMenu != "2"
}

func selectMenu() -> String {
    showMenu()
    guard let input = readLine() else {
       return ""
    }

    return input
}

func showMenu() {
    print("1. 게임 시작")
    print("2. 게임 종료")
    print("원하는 기능을 선택해주세요. : ", terminator: "")
}

func playGame() {
    computerNumberArray = createRandomNumbers()
    while tryCount > 0 {
        printInputCondition()
        let inputNumbers: String? = getInputNumbers()
        guard let intNumbers: Array<Int> = checkError(with: inputNumbers) else { continue }
        
        let strikeAndBall = checkStrikeAndBall(with: intNumbers)
        print("\(strikeAndBall[0]) 스트라이크, \(strikeAndBall[1]) 볼")
        
        tryCount -= 1
        judgeVictory(by: strikeAndBall[0])
        printRemainTryCount(strikeCount: strikeAndBall[0])
    }
}

func createRandomNumbers() -> Array<Int> {
    var numbersSet: Set<Int> = []
    while numbersSet.count < 3 {
        numbersSet.insert(Int.random(in: 1...9))
    }
    
    return Array(numbersSet)
}

func printInputCondition() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.\n입력 : ", terminator: "")
}

func getInputNumbers() -> String? {
    guard let input: String = readLine() else {
        return nil
    }
    return input
}

func checkError(with input: String?) -> Array<Int>? {
    guard let input = input else {
        return nil
    }
    let inputArray: Array<String> = input.components(separatedBy: " ")
    let convertToNumbers: Array<Int> = inputArray.map { Int($0) }.compactMap { $0 }
    let convertToSetNumbers = Set(convertToNumbers)
    guard convertToSetNumbers.count == 3,
          convertToSetNumbers.filter({ 1...9 ~= $0 }).count == 3 else {
        print("입력이 잘못되었습니다.")
        return nil
    }
    
    return convertToNumbers
}

func checkStrikeAndBall(with numbers: Array<Int>) -> Array<Int> {
    var strikeCount = 0
    var ballCount = 0

    for (index,number) in numbers.enumerated() {
        guard computerNumberArray.contains(number) else { continue }
        
        if computerNumberArray[index] == number {
            strikeCount += 1
        } else {
            ballCount += 1
        }
    }
    
    return [strikeCount, ballCount]
}

func printRemainTryCount(strikeCount: Int) {
    if strikeCount != 3 && tryCount > 0 {
        print("남은 기회 : \(tryCount)")
    } else {
        tryCount = 0
    }
}

func judgeVictory(by strikeCount: Int) {
    if strikeCount == 3 {
        print("사용자 승리...!")
    } else if tryCount == 0 {
        print("컴퓨터 승리...!")
    }
}

startGame()
