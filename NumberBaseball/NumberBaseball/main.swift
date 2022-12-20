//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let numbers = Array(1...9)
let initialNumbers = makeRandomNumbers()

func makeRandomNumbers() -> [Int] {
    var resultnumbers: Set<Int> = []

    while resultnumbers.count < 3 {
        guard let randomElement = numbers.randomElement() else{
            return []
        }
        resultnumbers.insert(randomElement)
    }

    return Array(resultnumbers)
}

func playGame() {
    var temp = 9
    var result : [Int] = []

    while temp > 0 {
        let randomNumbers = makeRandomNumbers()
        result = checkNumbers(numbers: randomNumbers)
        let strike = result[0]
        let ball = result[1]

        if strike == 3 {
            print("정답 입니다!")
            return
        }

        temp -= 1

        print("임의의 수 : \(randomNumbers[0]), \(randomNumbers[1]), \(randomNumbers[2])")
        print("\(strike) 스트라이크, \(ball) 볼")
        print("남은 기회 : \(temp)")
    }

    print("컴퓨터의 승리입니다.")

}

func checkNumbers(numbers: [Int]) -> [Int] {
    var strike = 0
    var ball = 0


    for number in numbers {
        if initialNumbers.contains(number){
            ball += 1
        }
    }
    for index in 0...2{
        if initialNumbers[index] == numbers[index]{
            strike += 1
            ball -= 1
        }
    }
    return [strike,ball]
}


playGame()
