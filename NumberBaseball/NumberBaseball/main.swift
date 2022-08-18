//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: Array<Int> = [1, 2, 3]
var gameCounter: Int = 9
//var userNumbers: Array<Int> = []

func makeThreeNumbers() -> Array<Int> {
    var generatedNumbers: Set<Int> = []
    while generatedNumbers.count < 3 {
        generatedNumbers.update(with: Int.random(in: 1...9))
    }
    return generatedNumbers.map{ $0 }
}

func checkStrikeAndBall(numbers: [Int]) -> [Int] {
    var strikeCounter: Int = 0
    var ballCounter: Int = 0
    computerNumbers.enumerated().forEach{ (index, computerNumber) in
        if numbers[index] == computerNumber {
            strikeCounter += 1
        } else if numbers.contains(computerNumber) {
            ballCounter += 1
        }
    }
    return [strikeCounter, ballCounter]
}

func playGame() {
//    computerNumbers = makeThreeNumbers()
    while gameCounter > 0 {
        guard let userNumbers = reciveNumbers() else {
            print("입력이 잘못되었습니다")
            continue
        }
        let gameResult = checkStrikeAndBall(numbers: userNumbers)
        gameCounter -= 1
        print("임의의 수 : \(userNumbers.map{ String($0) }.joined(separator: " "))")
        print("\(gameResult[0]) 스트라이크, \(gameResult[1]) 볼")
        if gameResult[0] == 3 {
            print("유저 승리...!")
            gameCounter = 9
            break
        } else if gameCounter <= 0 {
            print("컴퓨터 승리...!")
            gameCounter = 9
            break
        } else {
            print("남은 기회 : \(gameCounter)")
        }
    }
}

func gameMenuSelect(){
    var isGame = true
    while isGame{
        print("1. 게임시작", "2. 게임종료", "원하는 기능을 선택해주세요 : ", separator: "\n", terminator: "")
        guard let inputedMenuValue = readLine() else { return }
        switch Int(inputedMenuValue) {
        case 1:
            playGame()
        case 2:
            isGame = false
        default:
            print("입력이 잘못되었습니다")
        }
    }
}

func reciveNumbers() -> [Int]? {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.", "중복 숫자는 허용하지 않습니다.", "입력 : ", separator: "\n" , terminator: "")
    guard let recivedValue = readLine(), !recivedValue.isEmpty else { return nil }
    let recivedNumbers = Set(recivedValue.components(separatedBy: " ")).compactMap({ Int($0) })
    guard recivedNumbers.count == 3, recivedNumbers.filter({ $0 < 10 }).count == 3 else { return nil }
    return recivedValue.components(separatedBy: " ").compactMap({ Int($0) })
}

gameMenuSelect()
