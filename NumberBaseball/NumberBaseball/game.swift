//
//  NumberBaseball - game.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

func startGame() {
    var userNumbers = [Int]()
    
    while remainCount > 0 {
        userNumbers = inputUserNumbers()
        if isValid(self: userNumbers) == false {
            print("입력이 잘못되었습니다.")
            continue
        }
        remainCount -= 1
        
        printInformation(of: userNumbers)

        let (strikeCount, ballCount) = countStrikeAndBall(in: userNumbers)
        printResultOf(strikeCount, ballCount)
        
        if isStrikeOut(strikeCount) {
            print("사용자 승리!")
            break
        }
        
        if isGameOver() {
            print("컴퓨터 승리...!")
        } else {
            print("남은 기회 : \(remainCount)")
        }
    }
}

func inputUserNumbers() -> [Int] {
    let data: String
    let userNumbers: [Int]
    
    printUserNumbersGuideline()
    data = inputData()
    userNumbers = convertToUserNumbers(self: data)
    
    return userNumbers
}

func printUserNumbersGuideline() {
    let guideline = """
        숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
        중복 숫자는 허용하지 않습니다.
        입력 :
        """
    print(guideline, terminator: " ")
}

func convertToUserNumbers(self: String) -> [Int] {
    let userNumbers = self.components(separatedBy: " ")
        .map(){ (element: String) -> Int in
            if let certainNumber = Int(element) {
                return certainNumber
            } else {
                return 0
            }
        }
    return userNumbers
}

func isValid(self: [Int]) -> Bool {
    if self.count != 3 {
        return false
    }
    
    let filteredData = Set(self).filter( { (element: Int) -> Bool in
        return 0 < element && element < 10
    })
    
    if filteredData.count != 3 {
        return false
    }
     
    return true
}

func printInformation(of userNumbers: [Int]) {
    let numbers = userNumbers.map(){ (number: Int) -> String in
        return String(number)
    }.joined(separator: " ")
    let information = "임의의 수 : \(numbers)"
    print(information)
}

func countStrikeAndBall(in userNumbers: [Int]) -> (Int, Int) {
    var strikeCount = 0
    var ballCount = 0
    
    for counter in 0...2 {
        if userNumbers[counter] == answer[counter] {
            strikeCount += 1
        } else if answer.contains(userNumbers[counter]) {
            ballCount += 1
        }
    }
    return (strikeCount, ballCount)
}

func printResultOf(_ strikeCount: Int, _ ballCount: Int) {
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
