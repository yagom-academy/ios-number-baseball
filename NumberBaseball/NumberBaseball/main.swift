//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func generateRandomNumber() -> Int {
    Int.random(in: (1...9))
}

func generateExtractedNumbers() -> [Int] {
    var extractedNumbers: Set<Int> = []
    
    while extractedNumbers.count != 3 {
        extractedNumbers.insert(generateRandomNumber())
    }
    return extractedNumbers.map{$0}
}

func startGame() {
    let randomNumbers = generateExtractedNumbers()
}
