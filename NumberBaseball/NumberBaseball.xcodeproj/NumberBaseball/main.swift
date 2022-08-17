//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

func compareStikeBall(randomNumber: Array<Int>, userNumber: Array<Int>)-> Bool {
    var strike = 0
    var ball = 0

    userNumber.forEach {
        if randomNumber.contains($0) { ball += 1 }
    }
    strike = zip(randomNumber, userNumber).compactMap {
        $0.0 == $0.1 ? true : nil
    }.count
    ball -= strike

    print("\(strike) 스트라이크, \(ball) 볼")
    return strike == 3 ? true : false
}

func gameStart() {
    let randomNumber = createRandomNumber()
    var round = 0

    while round < 9 {
        let userNumber = createUserNumber()

        if userNumber.count == 3 {
            if compareStikeBall(randomNumber: randomNumber, userNumber: userNumber) {
                print("사용자 승리")
            }
            round += 1
            print("남은 기회 : \(9-round)")
        }
    }
    print("컴퓨터 승리...!")
}

func createRandomNumber()-> Array<Int> {
    var randomNumber = Set<Int>()

    while randomNumber.count < 3 {
        randomNumber.insert(Int.random(in: 1...9))
    }
    return Array(randomNumber)
}

func createUserNumber()-> Array<Int> {
    print("숫자 3개를 띄어쓰기로 구분해주세요.\n중복숫자는 허용하지 않습니다")
    print("입력 : ", terminator: "")
    var userNumbers = [Int]()

    if let userNumber = readLine()?.split(separator: " "){
        if userNumber.count == 3{
            if let userNumber1 = Int(userNumber[0]){
                if userNumber1 > 0 && userNumber1 < 10 {
                    userNumbers.append(userNumber1)
                }
            }

            if let userNumber2 = Int(userNumber[1]){
                if userNumber2 > 0 && userNumber2 < 10 {
                    userNumbers.append(userNumber2)
                }
            }


            if let userNumber3 = Int(userNumber[2]){
                if userNumber3 > 0 && userNumber3 < 10 {
                    userNumbers.append(userNumber3)
                }
            }
        }
    }
    if Set(userNumbers).count != 3{
        userNumbers.removeAll()
    }
    if userNumbers.count != 3 {
        print("입력이 잘못되었습니다.")
    }

    return userNumbers
}

func selectMenu() {
    while true {
        print("1. 게임시작"); print("2. 게임종료")
        print("원하는 기능을 선택해주세요 : ", terminator: "")

        if let menuNumber = readLine(){
            if menuNumber == "1" {
                gameStart()

            }else if menuNumber == "2"{
                break
            }else{
                print("입력이 잘못되었습니다.")
            }

        }
    }
}

selectMenu()
