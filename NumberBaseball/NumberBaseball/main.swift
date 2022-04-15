//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

var randomArray: Array<Int> = []
var inputArray: Array<Int> = []

var remainingChances: Int = 9
var strikeCount: Int = 0
var ballCount: Int = 0
let requiredNumberOfElements: Int = 3
let minimumNumber: Int = 1
let maximumNumber: Int = 9
let goalOfStrikeCount: Int = 3
let gameOverCount: Int = 0

func generateRandomNumber() -> Array<Int> {
    var randomSet: Set<Int> = []
    while randomSet.count >= requiredNumberOfElements {
        randomSet.insert(Int.random(in: minimumNumber...maximumNumber))
    }
    
    return Array(randomSet)
}

func inputUserNumber() {
    
    var userNumber: Array<Int>?
    inputArray = []
    
    while inputArray.count < requiredNumberOfElements {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.", "중복 숫자는 허용하지 않습니다.", "입력 : ", separator: "\n", terminator: "")
        
        userNumber = readLine()?.split(separator: " ").map{Int($0) ?? 0}
        
        guard let unwrappedUserNumber: Array<Int> = userNumber?.filter({$0 >= minimumNumber && $0 <= maximumNumber}) else {
            return
        }
        
        if Set(unwrappedUserNumber).count >= requiredNumberOfElements {
            inputArray = unwrappedUserNumber
        } else {
            print("입력이 잘못되었습니다")
        }
    }
}

func compareNumber() {
    while strikeCount < goalOfStrikeCount && remainingChances > gameOverCount {
        strikeCount = 0
        remainingChances -= 1
        
        inputUserNumber()
        checkStrike()
        checkBall()
        
        print("\(strikeCount) 스트라이크, \(ballCount) 볼", separator: "\n")
        
        if strikeCount == goalOfStrikeCount {
            print("사용자 승리!")
        } else if remainingChances == gameOverCount {
            print("남은 기회 : \(remainingChances)", "컴퓨터 승리...!", separator: "\n")
        } else {
            print("남은 기회 : \(remainingChances)")
        }
    }
}

func startGame() {
    randomArray = generateRandomNumber()
    compareNumber()
}

func checkStrike() {
    for number in 0..<requiredNumberOfElements {
        let sameDigitNumber = (randomArray[number] - inputArray[number] == 0) ? 1 : 0
        strikeCount += sameDigitNumber
    }
}

func checkBall() {
    let intersectionOfArrays = Set(randomArray).intersection(inputArray)
    ballCount = intersectionOfArrays.count - strikeCount
}

func selectMenu() {
    var mainMenu: String = ""
    
    while mainMenu != "2" {
        print("1. 게임시작", "2. 게임종료", "원하는 기능을 선택해주세요 : ", separator: "\n", terminator: "")
        
        mainMenu = readLine() ?? ""
        
        switch mainMenu {
        case "1" :
            startGame()
        case "2" :
            break
        default :
            print("입력이 잘못되었습니다")
        }
    }
}

selectMenu()
