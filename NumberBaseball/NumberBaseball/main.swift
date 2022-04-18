//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

private var remainingNumber: Int = 9

private var randomNumbers: [Int] = []
private var clarifiedNumbers: Set<Int> = []

private var strikeCount : Int = 0
private var ballCount : Int = 0

func run() {
    switch classifyInputString("1. 게임시작\n2. 게임종료\n원하는 기능을 선택해주세요 : ")  {
    case "1":
        start()
        
    case "2":
        break
        
    default:
        print("입력이 잘못되었습니다.")
        run()
    }
}

private func classifyInputString(_ quote: String) -> String? {
    print(quote, terminator: " ")
    
    return readLine()?.replacingOccurrences(of: " ", with: "")
}

private func classifyInputArray(_ quote: String) -> [Int]? {
    print(quote, terminator: " ")
    
    return readLine()?
        .split(separator: " ")
        .map{ Int($0) ?? 0 }
}

private func start() {
    let computerNumber = Array(create(to: &randomNumbers, for: &clarifiedNumbers))
    
    repeat {
        strikeCount = 0
        ballCount = 0
        
        print("숫자 3개를 띄어쓰기로 구분해서 입력해주세요.\n중복숫자는 허용하지 않습니다.")
        
        guard let userNumber = classifyInputArray("입력: "),
              checkValidation(of: userNumber) else {
            print("입력이 잘못되었습니다.")
            
            continue
        }
        
        remainingNumber -= 1
        
        for index in computerNumber.indices {
            comparison(of: userNumber, and: computerNumber, at: index)
        }
        
        notifyContent()
        
    } while strikeCount != 3 || remainingNumber != 0
}

private func checkValidation(of value: [Int]) -> Bool{
    if !value.contains(0),
       value.count == 3,
       value.allSatisfy({ $0 < 10 }) {
        return true
    } else {
        return false
    }
}

private func notifyContent() {
    print("\(strikeCount) 스트라이크, \(ballCount) 볼 ")
    print("남은 기회 : \(remainingNumber)")
    
    if strikeCount == 3 {
        print("사용자 승리!")
    } else if remainingNumber == 0 {
        print("컴퓨터 승리!")
    }
}

private func comparison(of computer: [Int], and user: [Int], at index:Int) {
    if computer[index] == user[index] {
        strikeCount += 1
    } else if computer.contains(user[index]) {
        ballCount += 1
    }
}

private func create(to numbers: inout [Int], for numberSet: inout Set<Int>) -> Set<Int> {
    repeat {
        numbers.append(Int.random(in: 1...9))
        numberSet = Set(numbers)
    } while numberSet.count < 3
    return numberSet
}

run()
