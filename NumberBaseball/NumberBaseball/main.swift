//
//  NumberBaseball - main.swift
//  Created by JusBug, maxhyunm.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

typealias gameResultType = (strike: Int, ball: Int)

var opponentNumbers: Array<Int> = []
var chance: Int = 9

func menuStart() {
    print("1. 게임시작\n2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    
    let optionNumber = readLine()
    
    switch optionNumber {
    case "1":
        menuSelect()
    case "2":
        print("", terminator: "")
    default:
        print("입력이 잘못되었습니다")
    }
}

func makeRandomNumbers() -> Array<Int> {
    var opponentNumbers: Array<Int> = []
    
    while opponentNumbers.count < 3 {
        let randomNumber = Int.random(in:1...9)
        if opponentNumbers.contains(randomNumber) {
            continue
        }
        opponentNumbers.append(randomNumber)
    }
    
    return opponentNumbers
}

func compareNumbers(user userNumbers: Array<Int>, to opponentNumbers: Array<Int>) -> gameResultType {
    let strikes = userNumbers.enumerated()
        .filter { userNumbers[$0.offset] == opponentNumbers[$0.offset] }
        .map { $0.element }
    let balls = userNumbers
        .filter { (strikes.contains($0) == false) && (opponentNumbers.contains($0)) }
    let strike = strikes.count
    let ball = balls.count
    
    return (strike: strike, ball: ball)
}

func menuSelect() {
    opponentNumbers = makeRandomNumbers()
    
    while chance > 0 {
        let userNumbers = inputGameNumbers()
        let result: gameResultType = compareNumbers(user: userNumbers, to: opponentNumbers)
        
        print("\(result.strike) 스트라이크, \(result.ball) 볼")
        
        chance -= 1
        
        if result.strike == 3 {
            print("사용자 승리!")
            break
        } else if chance == 0 {
            print("컴퓨터 승리...!")
            break
        }
        
        print("남은 기회 : \(chance)")
    }
}

func inputGameNumbers() -> Array<Int> {
    
    var isNumberIn = false
    var inputNumbers: Array<Int> = []
    
    while !isNumberIn {
        print("입력 : ", terminator: "")
        
        guard let inputNumber = readLine() else { break }
        inputNumbers = inputNumber.components(separatedBy: " ").compactMap { Int($0) }
        
        guard (inputNumbers.count == 3) && (Set(inputNumbers).count == 3) else {
            print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
            print("중복 숫자는 허용하지 않습니다.")
            
            continue
        }
        isNumberIn = true
    }
    return inputNumbers
}

menuStart()


