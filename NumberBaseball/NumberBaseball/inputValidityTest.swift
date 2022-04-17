//
//  test.swift
//  NumberBaseball
//
//  Created by dhoney96 on 2022/04/17.
//

import Foundation

func areElementsInteger(in array: [String]) -> Bool {
    for element in array {
        guard element != " " else { continue }
        guard Int(element) != nil else { return false }
    }
    return true
}

func areWhiteSpacesValid(in userInputNumbers: [String]) -> Bool {
    for index in stride(from: 1, to: userInputNumbers.endIndex, by: 2) {
        guard isOdd(index) && isWhiteSpace(userInputNumbers[index]) else { return false }
        continue
    }
    
    for index in 0..<userInputNumbers.endIndex {
        guard userInputNumbers[index] == " " && userInputNumbers[index] == userInputNumbers[index + 1] else { return false }
    }
    return true
}

func isOdd(_ number: Int) -> Bool {
    guard number % 2 == 1 else { return false }
    return true
}

func isWhiteSpace(_ char: String) -> Bool {
    guard char == " " else { return false }
    return true
}

func areThereDuplicatedNumbers(in array: [Int]) -> Bool {
    guard array.count == Set(array).count else { return false }
    return true
}

func isNumbersQuantity(in userInputNumbers: [Int], theSameAs gameNumbersQuantity: Int) -> Bool {
    guard userInputNumbers.count == gameNumbersQuantity else { return false }
    return true
}

func isValidInput(_ userInput: [String]) -> Bool {
    guard areElementsInteger(in: userInput)
            && areWhiteSpacesValid(in: userInput) else { return false }
    
    let numbers = convertToIntArray(from: userInput)
    
    guard areThereDuplicatedNumbers(in: numbers)
            && isNumbersQuantity(in: numbers, theSameAs: totalAnswerNumbers) else { return false }
    return true
}

