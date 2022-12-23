//
//  NumberBaseball - main.swift
//  Created by sehong, Harry on 2022/12/22.
//  Copyright © yagom academy. All rights reserved.
// 

func createRandomNumbers() -> [Int] {
    var randomNumbers = Set<Int>()
    
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    
    return Array(randomNumbers)
}

func readUserNumbers() -> String {
    print("""
    숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
    중복 숫자는 허용하지 않습니다.
    """)
    print("입력 : ", terminator: "")
    guard let input = readLine() else { return String() }
    
    return input
}

func printErrorInputMessage() {
    print("입력이 잘못되었습니다.")
}

func checkNumbers() -> [Int] {
    while true {
        let input = readUserNumbers()
        if input == "" {
            printErrorInputMessage()
            continue
        }
        
        let numberArray = input.split(separator: " ").map{ Int($0) ?? 0 }
        let filteredNumbers = numberArray.filter{ $0 > 0 && $0 < 10 }
        
        if Set(filteredNumbers).count != 3 {
            printErrorInputMessage()
            continue
        }
        
        return filteredNumbers
    }
}

func checkStrike(computerNumbers: [Int], userNumbers: [Int]) -> (Int, Int) {
    var strike = 0
    var ball = 0
    
    for index in 0..<3 {
        if computerNumbers[index] == userNumbers[index] {
            strike += 1
        } else if computerNumbers.contains(userNumbers[index]){
            ball += 1
        }
    }
    
    return (strike, ball)
}

func startGame() {
    let computerNumbers = createRandomNumbers()
    var chance = 9
    
    while chance > 0 {
        
        let userNumbers = checkNumbers()
        let (strike, ball) = checkStrike(computerNumbers: computerNumbers, userNumbers: userNumbers)
        
        chance -= 1
        
        print("\(strike) 스트라이크, \(ball) 볼")
        
        if strike == 3 {
            print("사용자 승리...!")
            break
        } else if chance == 0 {
            print("컴퓨터 승리...!")
            break
        }
        print("남은 기회 : \(chance)")
    }
}

func printMenuList() {
    print("""
          1. 게임시작
          2. 게임종료
          """)
    print("원하는 기능을 선택해주세요 : ", terminator: "")
}

func isSelectedMenu() -> Bool {
    printMenuList()
    
    guard let selectedMenu = readLine() else {
        printErrorInputMessage()
        return isSelectedMenu()
    }
    
    switch Int(selectedMenu) {
    case 1:
        return true
    case 2:
        return false
    default:
        printErrorInputMessage()
        return isSelectedMenu()
    }
}

while isSelectedMenu() {
    startGame()
}
