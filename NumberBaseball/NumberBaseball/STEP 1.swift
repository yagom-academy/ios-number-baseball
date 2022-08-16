//
//  STEP 1.swift
//  NumberBaseball
//
//  Created by 이준영 on 2022/08/16.
//

import Foundation

var baseballRandomNumbers: Array<Int> = []

var remainCount: Int = 9

func makeThreeRandomNumbers() -> Array<Int> {
    let randomNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffled()
    var baseballGameNumbers: Array<Int> = []
    for number in 0...2 {
        baseballGameNumbers.append(randomNumbers[number])
    }
    return baseballGameNumbers
}
