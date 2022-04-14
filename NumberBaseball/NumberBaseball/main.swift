//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//func makeRandomThreeNumbers() -> [Int] {
//    var randomNumbers: Set<Int> = []
//    while randomNumbers.count < 3 {
//        let randomNumber = Int.random(in: 1...9)
//        randomNumbers.insert(randomNumber)
//    }
//    return Array(randomNumbers)
//}
//
//func printMenu() {
//    print("1. 게임시작")
//    print("2. 게임종료")
//    print("원하는 기능을 선택해주세요:",terminator: " ")
//
//}
//
//func choiceMenu() {
//    let choiceMenuNumber = readLine()
//    if let number = choiceMenuNumber {
//        selectMenu(menuNumber: number)
//    }
//}
//
//func selectMenu(menuNumber: String) -> () {
//    switch menuNumber {
//    case "1":
//        break
//    case "2":
//        break
//    default: print("입력이 잘못되었습니다")
//    }
//}

func inputUserNumbers() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요")
    print("중복숫자는 허용하지 않습니다")
    print("입력:",terminator: " ")
    let userinputNumbers = readLine()?.components(separatedBy: " ")
    if let userNumbers = userinputNumbers {
        print(checkCommonNumbers(userInput: userNumbers))
    }
}
inputUserNumbers()
func checkCommonNumbers(userInput: [String]) -> Bool {
    let checkedNumbers: Set<String> = Set(userInput)
    guard checkedNumbers.count == 3 else { return false }
    return true
}

//func mapNumbers(input: [String]) -> [Int] {
//    let result: [Int] = input.compactMap {
//        Int(String($0))
//    }
//    return result
//}
