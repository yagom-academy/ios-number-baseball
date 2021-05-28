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
        //let userNumSet: Set = Set(userNums.split(separator: " ").compactMap { Int($0) })
        var userNumSet = userNums.split(separator: " ").compactMap { Int($0) }
        
        //let userNumLast = userNumSet.intersection(basicNum).map { $0 }
        
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



func judgeAnswer(ans: [Int], num: [Int]) -> String {
    var strike = 0
    var ball = 0
    let numRange = 0...2

    for index in numRange {
        if num[index] == ans[index] {
            strike += 1
        } else if num.contains(ans[index]) {
            ball += 1
        }
    }

    if strike == 3 {
        return "사용자 승리...!"
    }
    
    return "\(strike) 스트라이크, \(ball) 볼"
}


func startGame() -> Any {
    
    let comanswer = generateAnswer()
    
    var leftchance = 9

    for i in 1...leftchance {
        let userInput = readLine()
        let userNum = filterUserInput(num: userInput)
        let judgeAnswer = judgeAnswer(ans: comanswer, num: userNum)
        print(judgeAnswer)
        
        switch judgeAnswer {
        case "사용자 승리...!":
            return selectOption()
        default:
            print("남은 기회 : \(leftchance - i)")
        }
    }
    print("컴퓨터의 승리...!")
    
    return selectOption()
}


func writeNumber(option num: String?) -> Any {
    switch num {
    case "1" :
        print(ruleLiteral, terminator: "")
        
        return startGame()
        
    case "2" :
        return endGame()
        
    default :
        print("입력이 잘못되었습니다.")
        writeNumber(option: selectOption())
    }
    return 0
}


let userScreen = selectOption()
let numBaseball = writeNumber(option: userScreen)

print(numBaseball)
