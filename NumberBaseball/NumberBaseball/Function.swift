//
//  Function.swift
//  NumberBaseball
//
//  Created by 천승현 on 2022/12/23.
//

import Foundation

func isAllNumber(inputArray: [String]) -> Bool {
    for input in inputArray {
        if Int(input) == nil {
            return false
        }
    }
    return true
}

func isThreeCount(array: [String]) -> Bool {
    return array.count == 3 ? true : false
}

func hasDuplicateNumber(numbers: [String]) -> Bool {
    let deduplicateInput = Set(numbers)
    return numbers.count == deduplicateInput.count ? true : false
}

func isNumberFromOneToNine(numbers: [String]) -> Bool {
    let deduplicateNumbers = numbers.compactMap{ Int($0) }
    let numbersFromOneToNine = deduplicateNumbers.filter{ (1...9) ~= $0 }
    return numbers.count == numbersFromOneToNine.count ? true : false
}


func initializeGame() {
    leftCount = 9
    isUserWin = false
    computerNumbers = makeThreeNumbers()
}

func printMenu() {
    print("""
          1. 게임시작
          2. 게임종료
          원하는 기능을 선택해주세요 :
          """, terminator:" ")
}
