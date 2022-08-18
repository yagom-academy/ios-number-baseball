//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var comNumArray: Array<Int> = []
var tempNumArray: Array<Int> = []
var tryCount: Int = 9
var menuNum: Int
var strikeCount: Int = 0
var ballCount: Int = 0
var flag: Bool = false

func createRandomNumbers() -> [Int] {
    var numbersSet: Set<Int> = []
    
    while numbersSet.count < 3 {
        numbersSet.insert(Int.random(in: 1...9))
    }

    return Array(numbersSet)
}

func containNumber(i: Int) -> Bool {
    flag = comNumArray.contains(tempNumArray[i])
    return flag
}

func equalIndexNumber(tempNumArray: Array<Any>) {
    for (index, number) in array.enumerated() {

    }
}


/*-------------------------------------*/

comNumArray = createRandomNumbers()

while tryCount > 0 {
    strikeCount = 0
    ballCount = 0
    tempNumArray = createRandomNumbers()
    print("기준 숫자 : \(comNumArray)")
    print("비교 숫자 : \(tempNumArray)")
    
    for num in 0...2 {        //비교할 숫자 3개 각각 확인하기
        if containNumber(i: num) {
            equalIndexNumber(i: num)
        } else {
            print("꽝")
        }
    }
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    if strikeCount == 3 {
        print("사용자 승리...!")
        break
    }
    tryCount -= 1
    print("남은 기회 : \(tryCount) \n")
}

if strikeCount != 3 {
    print("컴퓨터 승리...!")
}


