//
//  baseballGame.swift
//  NumberBaseball
//
//  Created by 강민수 on 2022/12/20.
//

// 1. startGame while문 함수 만들기
// 2. startGame 안의 readInput do-catch문 만들어주기
// 3. answerBall, chance 현재(전역변수) -> 지역변수
import Foundation

enum InputError: String, Error {
    case wrongMenuInput = "입력이 잘못되었습니다"
    case wrongUserInput
}

var answerBall: Array<Int> = []
var chance = 9

func createRandomNumber() -> Array<Int> {
    var numbers: Array<Int> = []
    
    while numbers.count < 3 {
        let number = Int.random(in: 1...9)
        
        if numbers.contains(number) == false {
            numbers.append(number)
        }
    }
    
    return numbers
}

func compareBall(userBall: Array<Int>, answerBall: Array<Int>) -> (Int, Int) {
    var ball = 0
    var strike = 0
    
    for index in 0..<userBall.count {
        if userBall[index] == answerBall[index] {
            strike += 1
        } else if userBall[index] != answerBall[index], answerBall.contains(userBall[index]) {
            ball += 1
        }
    }
    
    return (ball, strike)
}

func readMenu() throws -> Bool {
    let inputValue = readLine()
    
    guard let menu = inputValue, menu != "" else {
        throw InputError.wrongMenuInput
    }
    
    if menu == "1" {
        return true
    } else if menu == "2" {
        return false
    }
    
    throw InputError.wrongMenuInput
}

func displayMenu() {
    print("""
            1. 게임시작
            2. 게임종료
            원하는 기능을 선택해주세요 :
            """, terminator: "")
    
    do {
        if try readMenu() == true {
            try startGame()
        }
    } catch InputError.wrongMenuInput {
        print(InputError.wrongMenuInput.rawValue)
        displayMenu()
    } catch InputError.wrongUserInput {
        print("입력이 잘못되었습니다")
        //            try self.startGame()
    } catch {
        print(error)
    }
}

func readInput() throws -> [Int] {
    guard let input = readLine(), input != "" else {
        throw InputError.wrongUserInput
    }
    
    let inputArray = input.components(separatedBy: " ")
    
    guard inputArray.count == 3 else {
        throw InputError.wrongUserInput
    }
    
    guard let firstBall = Int(inputArray[0]),
          let secondBall = Int(inputArray[1]),
          let thirdBall = Int(inputArray[2]) else {
        throw InputError.wrongUserInput
    }
    
    return [firstBall, secondBall, thirdBall]
}

func startGame() throws {
    print("""
            숫자 세 개를 띄어쓰기로 구분하여 입력해주세요.
            중복 숫자는 허용하지 않습니다.
            입력 :
            """, terminator: "")
    
    answerBall = createRandomNumber()
    
    while chance > 0 {
        let userBall = try readInput()
        let (ball, strike) = compareBall(userBall: userBall, answerBall: answerBall)
        
        chance -= 1
        print("\(strike) 스트라이크, \(ball) 볼")
        
        if let winner = decideWinner(strike: strike, chance: chance) {
            print("\(winner) 승리...!")
            break
        }
        
        print("남은 기회 : \(chance)")
    }
}

func decideWinner(strike: Int, chance: Int) -> String? {
    var winner: String?
    
    if strike == 3 {
        winner = "사용자"
    } else if chance == 0 {
        winner = "컴퓨터"
    }
    
    return winner
}

