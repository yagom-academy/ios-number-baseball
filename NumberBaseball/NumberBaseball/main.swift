//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: Array<Int> = generateRandomNumbers()
var tryCount: Int = 9
var strikeCount: Int = 0
var ballCount: Int = 0

func generateRandomNumbers() -> Array<Int> {
    
    var numbers: Set<Int> = Set<Int>()
    
    while numbers.count < 3 {
        numbers.insert(Int.random(in: 1...9))
    }
    
    return Array(numbers)
}

func returnResult(of numbers: [Int]) -> String {
    
    repeatJudgement(with: numbers)
    
    let result = "\(strikeCount) 스트라이크, \(ballCount) 볼"
   
    return result
}

func repeatJudgement(of times: Int = 2, with numbers: [Int] ) {
    
    for index in 0...times {
        judgeStrikeOrBall(of: numbers[index], with: computerNumbers[index])
    }
}

func judgeStrikeOrBall(of userNumber: Int, with computerNumber: Int) {
    
    if userNumber == computerNumber {
        strikeCount += 1
    } else if computerNumbers.contains(userNumber) {
        ballCount += 1
    }
}

func convertArrayToString(from arrayOfNumbers: Array<Int>) -> String {
    
    var stringOfNumbers: String = ""
    
    for number in arrayOfNumbers {
        stringOfNumbers += "\(number) "
    }
    
    return stringOfNumbers
}

func playOneRound() {
    
    let randomNumbers = generateRandomNumbers()
    let randomNumberToString: String = convertArrayToString(from: randomNumbers)
    let resultOfJudgement = returnResult(of: randomNumbers)
    
    tryCount -= 1
    strikeCount = 0
    ballCount = 0
    
    let message = """
    임의의 수 : \(randomNumberToString)
    \(resultOfJudgement)
    남은 기회 : \(tryCount)
    """
    print(message)
}

func startGame() {
    
    while tryCount > 0, strikeCount != 3 {
        playOneRound()
    }
    
    if tryCount == 0, strikeCount != 3 {
        print("컴퓨터 승리..!")
    } else {
        print("사용자 승리!")
    }
}

func selectMenu(){
    
    print("""
    1. 게임시작
    2. 게임종료
    원하는 기능을 선택해주세요 :
    """, terminator: " ")
    
    guard let menu = readLine() else {
        selectMenu()
        return
    }
    
    switch menu {
    case "1":
        startGame()
    case "2":
        return
    default:
        print("입력이 잘못되었습니다")
        selectMenu()
    }
}

func getNumber() -> [Int] {
    
    print("""
    숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
    중복 숫자는 허용하지 않습니다.
    입력 :
    """, terminator: " ")
    
    guard let input = readLine() else {
        print("입력이 잘못되었습니다.")
        return []
    }
    
    let array: [Int] = [1,2,3]
    return array
}

selectMenu()


