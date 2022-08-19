//
//  NumberBaseball - main.swift
//  Created by 애종,LJ.
//  Copyright © yagom academy. All rights reserved.
//

var computerNumberArray: Array<Int> = []
var tryCount: Int = 9


func playGame() {
    computerNumberArray = createRandomNumbers()
    while tryCount > 0 {
        let randomNumberArray = createRandomNumbers()   //
        printRandomNumbers(randomNumberArray)
        
        let strikeAndBall = checkStrikeAndBall(with: randomNumberArray)
        
        print("\n\(strikeAndBall[0]) 스트라이크, \(strikeAndBall[1]) 볼")
        
        tryCount -= 1
        judgeVictory(by: strikeAndBall[0])
        printRemainTryCount(strikeCount: strikeAndBall[0])
    }
}

func createRandomNumbers() -> Array<Int> {
    var numbersSet: Set<Int> = []
    
    while numbersSet.count < 3 {
        numbersSet.insert(Int.random(in: 1...9))
    }
    return Array(numbersSet)
}

func judgeVictory(by strikeCount: Int){
    if strikeCount == 3 {
        print("사용자 승리...!")
    } else if tryCount == 0 {
        print("컴퓨터 승리...!")
    }
}

func printRemainTryCount(strikeCount: Int) {
    if strikeCount != 3 && tryCount > 0 {
        print("남은 기회 : \(tryCount) \n")
    }
}

func checkStrikeAndBall(with numbers: Array<Int>) -> Array<Int> {
    var strikeCount = 0
    var ballCount = 0
    
    for (index,number) in numbers.enumerated() {
        guard computerNumberArray.contains(number) else { continue }
        
        if computerNumberArray[index] == number {
            strikeCount += 1
        } else {
            ballCount += 1
        }
    }
    
    return [strikeCount, ballCount]
}

func printRandomNumbers(_ numbers: Array<Int>) {
    print("임의의 수 : ", terminator: "")
    for index in 0...2 {
        print("\(numbers[index])", terminator: " ")
    }
}

func showMenu() {
    print("1. 게임 시작")
    print("2. 게임 종료")
    print("원하는 기능을 선택해주세요. : ", terminator: "")
}

func selectMenu() -> String {
    showMenu()
    if let input = readLine() {
        return input
    }
    
    return "3"
}

func startGame() {
    var selectedMenu: String
    repeat {
        selectedMenu = selectMenu()
        switch selectedMenu {
            case "1":
                playGame()
            case "2":
                break
            default:
                print("입력이 잘못되었습니다.\n")
        }
    } while selectedMenu != "2"
}


startGame()
