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

func isValidInput(_ userInput: [String]) -> Bool {
    guard areElementsInteger(in: userInput) else { return false }
    return true
}
