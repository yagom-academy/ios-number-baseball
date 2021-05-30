//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let ruleLiteral = """
    숫자 3개로 띄어쓰기를 구분하여 입력해주세요.
    중복 숫자는 허용하지 않습니다.
    입력 :\(" ")
    """

func endGame() {
    return;
}

func selectOption() -> String? {
    
    let optionList = """
        1. 게임시작
        2. 게임종료
        원하는 기능을 선택해 주세요 :\(" ")
        """
        
    print(optionList, terminator: "")
    
    let selectedNum = readLine()
    
    return selectedNum
}


func generateAnswer() -> [Int] {
    
    var answer = Set<Int>()

    while answer.count < 3 {
        
    let randomNumber = Int.random(in: 1...9)
    answer.insert(randomNumber)
        
    }
    
    let answers = Array(answer)
    
    return answers
}


func filterUserInput(num : String?) -> [Int] {
    
    if let userNums = num {
        var userNumSet = userNums.split(separator: " ").compactMap { Int($0) }
        userNumSet.removeAll(where: {$0 < 1 || $0 > 9})
        
        switch userNumSet.count {
        case 3:
            return userNumSet
        default:
            print("입력이 잘못되었습니다.")
            print(ruleLiteral, terminator: "")
            return filterUserInput(num: readLine())
        }
    }
    
    return [0]
}



func judgeAnswer(answer: [Int], number: [Int]) -> String {
    var strike = 0
    var ball = 0
    let numRange = 0...2

    for index in numRange {
        if number[index] == answer[index] {
            strike += 1
        } else if number.contains(answer[index]) {
            ball += 1
        }
    }

    if strike == 3 {
        return "사용자 승리...!"
    }
    
    return "\(strike) 스트라이크, \(ball) 볼"
}


func startGame() {
    
    let comanswer = generateAnswer()
    
    let totalChance = 9

    for i in 1...totalChance {
        let userInput = readLine()
        let userNum = filterUserInput(num: userInput)
        let judgeAnswer = judgeAnswer(answer: comanswer, number: userNum)
        print(judgeAnswer)
        
        switch judgeAnswer {
        case "사용자 승리...!":
            selectOption()
            
        default:
            print("남은 기회 : \(totalChance - i)")
        }
    }
    1
    print("컴퓨터의 승리...!")
    
    selectOption()
}


func writeNumber(option num: String?) {
    switch num {
    case "1" :
        print(ruleLiteral, terminator: "")
        startGame()
        
    case "2" :
        endGame()
        
    default :
        print("입력이 잘못되었습니다.")
        writeNumber(option: selectOption())
    }
}


let userScreen = selectOption()
let numBaseball = writeNumber(option: userScreen)

print(numBaseball)


