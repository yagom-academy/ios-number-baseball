//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

gameStart()

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
    for round in (0...8).reversed() {
        let userNumber = createUserNumber()
        if compareStikeBall(randomNumber: randomNumber, userNumber: userNumber) {
            print("사용자 승리")
        }
        print("남은 기회 : \(round)")
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
    let userNumber = createRandomNumber()
    print("임의의 수 : \(userNumber[0]) \(userNumber[1]) \(userNumber[2])")
    return userNumber
}
