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

func areWhiteSpacesValid(array: [String]) -> Bool { // trim 필요함
    for index in stride(from: 1 , to: array.endIndex, by: 2) {
        guard isOdd(index) && isWhiteSpace(array[index]) else { return false }
        continue
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

func areThereDuplicatedNumbers(array: [Int]) -> Bool {
    guard array.count == Set(array).count else { return false }
    return true
}

func isNumbersQuantity(in array: [Int], theSameAs gameNumbersQuantity: Int) -> Bool {
    guard array.count == gameNumbersQuantity else { return false }
    return true
}

func isValidInput(_ userInput: [String]) -> Bool {
    guard areElementsInteger(in: userInput) else { return false }
    guard areWhiteSpacesValid(array: userInput) else { return false }
    
    let numbers = convertToIntArray(from: userInput)
    
    guard areThereDuplicatedNumbers(array: numbers) else { return false }
    guard isNumbersQuantity(in: numbers, theSameAs: totalAnswerNumbers) else { return false }
    return true
}

