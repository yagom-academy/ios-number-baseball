//
//  NumberBaseball - game.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

func startNumberGame() {
    var userNumbers = [Int]()
    
    while remainCount > 0 {
        userNumbers = inputUserNumbers()
        if isInvalid(self: userNumbers) {
            print("입력이 잘못되었습니다.")
            continue
        }
        
        printInformation(of: userNumbers)

        let (strikeCount, ballCount) = decideStrikeCountAndBallCount(about: userNumbers)
        printDecision(about: strikeCount, and: ballCount)
        
        if isStrikeOut(strikeCount) {
            print("사용자 승리!")
            break
        }
        
        remainCount -= 1
        if isGameOver() {
            print("컴퓨터 승리...!")
        } else {
            print("남은 기회 : \(remainCount)")
        }
    }
}

func inputUserNumbers() -> [Int] {
    printInputUserNumbersNotice()
    let data = inputData()
    let userNumbers = convertToUserNumbers(self: data)
    return userNumbers
}

func printInputUserNumbersNotice() {
    let inputUserNumbersNotice = """
        숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
        중복 숫자는 허용하지 않습니다.
        입력 :
        """
    print(inputUserNumbersNotice, terminator: " ")
}

func convertToUserNumbers(self: String) -> [Int] {
    let userNumbers = self.components(separatedBy: " ")
        .map(){ (element: String) -> Int in
            return Int(element) ?? -1
        }
    return userNumbers
}

func isInvalid(self: [Int]) -> Bool {
    if self.contains(-1) {
        return true
    }
    
    let filteredData = self.filter( { number in
        return 0 < number && number < 10
    })
    
    if filteredData.count != 3 {
        return true
    }
     
    return false
}

func printInformation(of userNumbers: [Int]) {
    let numbers = userNumbers.map(){ (number: Int) -> String in
        return String(number)
    }.joined(separator: " ")
    let information = "임의의 수 : \(numbers)"
    print(information)
}

func decideStrikeCountAndBallCount(about userNumbers: [Int]) -> (Int, Int) {
    var strikeCount = 0
    var ballCount = 0
    
    for index in 0...2 {
        if userNumbers[index] == answer[index] {
            strikeCount += 1
        } else if answer.contains(userNumbers[index]) {
            ballCount += 1
        }
    }
    return (strikeCount, ballCount)
}

func printDecision(about strikeCount: Int, and ballCount: Int) {
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
}

func isStrikeOut(_ strikeCount: Int) -> Bool {
    if strikeCount == 3 {
        return true
    } else {
        return false
    }
}

func isGameOver() -> Bool {
    if remainCount == 0 {
        return true
    } else {
        return false
    }
}
