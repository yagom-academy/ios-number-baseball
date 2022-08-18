//
//  NumberBaseball - main.swift
//  Created by Dragon, Aaron.
//  Copyright © yagom academy. All rights reserved.
//

func compareStikeBall(randomNumber: Array<Int>, userNumber: Array<Int>) -> Bool {
    var strike = 0
    var ball = 0

    userNumber.forEach {
        if randomNumber.contains($0) {
            ball += 1
        }
    }
    strike = zip(randomNumber, userNumber).compactMap {
        $0.0 == $0.1 ? true : nil
    }.count
    ball -= strike

    print("\(strike) 스트라이크, \(ball) 볼")
    return strike == 3 ? true : false
}

func gameStart() {
    let randomNumber = getRandomNumber()

    for round in (0...8).reversed() {
        let userNumber = getUserNumber()

        if compareStikeBall(randomNumber: randomNumber, userNumber: userNumber) {
            print("사용자 승리")
            return
        }
        print("남은 기회 : \(round)")
    }
    print("컴퓨터 승리...!")
}

func getRandomNumber() -> Array<Int> {
    var randomNumber = Set<Int>()

    while randomNumber.count < 3 {
        randomNumber.insert(Int.random(in: 1...9))
    }
    return Array(randomNumber)
}

// 3개를 반환하도록 유효성검사
func getUserNumber() -> Array<Int> {
    var userNumber = Array<Int>()
    while true {
        print("숫자 3개를 띄어쓰기로 구분해주세요.\n중복숫자는 허용하지 않습니다")
        print("입력 : ", terminator: "")
        let userInput = readLine()

        userNumber = checkNumber(userInput: userInput) ?? {continue}
        break
    }
    return userNumber
}


func checkNumber(userInput: String?) -> Array<Int>? {
    guard let userInput = userInput else { return nil }
    
    let userInputArr = userInput.split(separator: " ")
    if userInputArr.count != 3 { return nil }
    
    let userNumber = userInputArr.compactMap{ Int($0) }
    if userNumber.count != 3 { return nil }
    
    return userNumber
}

func selectMenu() {
    while true {
        print("1. 게임시작"); print("2. 게임종료")
        print("원하는 기능을 선택해주세요 : ", terminator: "")

        let menuNumber = readLine()
        if menuNumber == "1" {
            gameStart()
        } else if menuNumber == "2" {
            return
        } else {
            print("입력이 잘못되었습니다.")
        }
    }
}

selectMenu()

