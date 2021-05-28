//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

//func numGenerator() -> [Int] {
//    var randomNumbers = [Int]()
//    while randomNumbers.count < 3 {
//        let randomNumber = Int.random(in: 1...9)
//        if !randomNumbers.contains(randomNumber) {
//            randomNumbers.append(randomNumber)
//        }
//    }
//    return randomNumbers
//}
//
//var answer = numGenerator()
//var query = numGenerator()
//var leftCount = 9
//
//func answerJudge(attempt: [Int]) -> String {
//    var strike = 0
//    var ball = 0
//
//    for index in 0...2 {
//        if answer[index] == attempt[index] {
//            strike += 1
//        } else if answer.contains(attempt[index]) {
//            ball += 1
//        }
//    }
//
//    if strike == 3 {
//        return "사용자 승리...!"
//    }
//
//    return "\(strike) 스트라이크, \(ball) 볼"
//
//}
//
//func gameStart() {
//    while leftCount > 0 {
//        leftCount -= 1
//        print("임의의 수 : \(query[0]) \(query[1]) \(query[2])")
//
//        if leftCount == 0 && answer != query {
//            print("컴퓨터 승리...!")
//        }
//
//        print(answerJudge(attempt: query))
//        print("남은 기회 : \(leftCount)")
//        query = numGenerator()
//    }
//}
//
//gameStart()





































































































































































































































































































let ruleLiteral = """
    숫자 3개로 띄어쓰기를 구분하여 입력해주세요.
    중복 숫자는 허용하지 않습니다.
    입력 :\(" ")
    """

func endGame() {
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





func filterUserInput(num : String?) -> [Int?] {
    
    if let userNums = num {
        let userNumSet: Set = Set(userNums.split(separator: " ", maxSplits: 2).map { Int($0) })
        let basicNum: Set = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        
        let userNumLast = userNumSet.intersection(basicNum).map { $0 }
        
        switch userNumLast.count {
        case 3:
            return userNumLast
        default:
            print("입력이 잘못되었습니다.")
            print(ruleLiteral, terminator: "")
            
        }
    }
    return [0]
}



func judgeAnswer(user num: [Int?]) -> String {
    var strike = 0
    var ball = 0
    let numRange = 0...2

    for index in numRange {
        if num[index] == num[index] {
            strike += 1
        } else if num.contains(num[index] ?? 0) {
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

    for _ in 1...leftchance {
        let userInput = readLine()
        let userNum = filterUserInput(num: userInput)
        let judgeAnswer = judgeAnswer(user: userNum)
        
        switch judgeAnswer {
        case "사용자 승리...!":
            return selectOption()

        default:
            print("남은 기회 : \(leftchance - 1)", terminator: "")
            leftchance -= 1
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
        selectOption()
    }
    return 0
}


let doyi = selectOption()
let b = writeNumber(option: doyi)

print(b)
