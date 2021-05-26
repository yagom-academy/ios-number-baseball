//
//  NumberBaseball - main.swift
//  Created by shapiro,yun
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var computerNumbers: Array<UInt> = []
var numberOfTry: UInt = 9
var ballCount: UInt = 0
var strikeCount: UInt = 0
var randomNumber: UInt = 0
var isUserWin: Bool = false
var isComputerWin: Bool = false

func makeRandomNumber() {
    randomNumber = UInt.random(in: 1...9)
}

func printUserNumbers(userNumbers: Array<UInt>) {
    let convertedNumber = userNumbers.map{"\($0)"}.reduce("") {
        return $0 + " " + $1
    }
    print("임의의 수 : \(convertedNumber)")
}
