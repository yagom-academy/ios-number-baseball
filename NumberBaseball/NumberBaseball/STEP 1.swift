//
//  STEP 1.swift
//  NumberBaseball
//
//  Created by 이준영 on 2022/08/16.
//

import Foundation

var baseballRandomNumbers: Array<Int> = makeThreeRandomNumbers()
var remainCount: Int = 9

func makeThreeRandomNumbers() -> Array<Int> {
    let randomNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffled()
    var baseballGameNumbers: Array<Int> = []
    for number in 0...2 {
        baseballGameNumbers.append(randomNumbers[number])
    }
    return baseballGameNumbers
}

func compareNumbers(myNumbers: Array<Int>) {
    var strike: Int = 0
    var ball: Int = 0
    
    for number in 0...2 {
        if baseballRandomNumbers[number] == myNumbers[number] {
            strike += 1
        } else if baseballRandomNumbers.contains(myNumbers[number]) {
            ball += 1
        }
    }
    print("\(strike) 스트라이크, \(ball) 볼")
}
