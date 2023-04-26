//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

enum InputError: Error {
    case wrongComponentCount
    case duplicatedNumber
}

var inning = 9

func generateRandomNumberList() -> [Int] {
    var randomIntegerList: Set<Int> = []
    
    while randomIntegerList.count != 3 {
        randomIntegerList.insert(Int.random(in: 1...9))
    }
    
    return Array(randomIntegerList)
}

func checkStrikeAndBall(_ computerNumberList: [Int], _ randomNumberList: [Int]) -> (strike: Int, ball: Int) {
    var strikeCount = 0
    var ballCount = 0

    for index in 0..<3 {
        strikeCount += computerNumberList[index] == randomNumberList[index] ? 1 : 0
        ballCount += computerNumberList.contains(randomNumberList[index]) ? 1 : 0
    }
    
    ballCount -= strikeCount
    return (strikeCount, ballCount)
}

func isGameOver(_ strikeCount: Int, _ turnCount: Int) -> Bool {
    if strikeCount == 3 {
        print("사용자 승리!")
        return true
    }
    
    if turnCount == 0 {
        print("컴퓨터 승리...!")
        return true
    }
    
    print("남은 기회 : \(turnCount)")
    return false
}

func insertUserNumberList() {
    do {
        let inputNumberList = readLine()
        
        guard let userNumberList = inputNumberList?.components(separatedBy: .whitespace), userNumberList.count == 3 else {
            throw InputError.wrongComponentCount
        }
        
        guard Set(userNumberList).count == 3 else {
            throw InputError.duplicatedNumber
        }
    } catch {
        
    }
}

func startNumberBaseball() {
    let computerNumberList = generateRandomNumberList()

    while inning != 0 {
        let randomNumberList = generateRandomNumberList()
        let strikeAndBallCount = checkStrikeAndBall(computerNumberList, randomNumberList)

        inning -= 1
        print("""
              임의의 수 : \(randomNumberList[0]) \(randomNumberList[1]) \(randomNumberList[2])
              \(strikeAndBallCount.strike) 스트라이크, \(strikeAndBallCount.ball) 볼
              """)
        

        if isGameOver(strikeAndBallCount.strike, inning) {
            break
        }
    }
}

func start() {
    while true {
        print("1. 게임시작\n2. 게임종료\n원하는 기능을 선택해주세요", terminator: " : ")
        let inputMenu = readLine()

        switch inputMenu {
        case "1":
            startNumberBaseball()
        case "2":
            return
        default:
            print("입력이 잘못되었습니다.")
        }
    }
}

start()
