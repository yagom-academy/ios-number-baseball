//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

// 숫자야구를 위한 조건
// <변수>
// a. 임의의 정수 3개를 담아둘 전역변수
// b. 남은 시도를 담아 둘 전역변수 *초기값은 9
// <함수>
// a. 1~9 사이의 세 개의 임의의 정수를 생성하여 반환하는 함수 *3개의 숫자는 중복이 없어야 함
// b. 세 개의 정수를 전달받아 [1-a]의 수와 비교하여 볼과 스트라이크 결과를 반환하는 함수
// c. 게임시작 함수
// d. 사용자 메뉴를 출력하고 메뉴를 입력받는 함수 (게임시작, 게임종료)
// e. 게임 숫자를 입력받는 함수
// <추가 조건>
// a. 게임 메뉴 및 사용자가 입력하는 세 개의 숫자의 유효성을 검증하는 과정을 구현합니다
// b. 사용자가 입력한 수와 임의로 생성한 정수를 비교하는 게임을 진행하도록 구현합니다



import Foundation



class NumberBaseBall {
    // <전역변수>
    var g_arrayNum: [Int] = []   // STEP1 변수 - a. 임의의 수 저장을 위한 빈 배열 선언
    var g_chance = 9                  // STEP1 변수 - b. 남은 시도 횟수


    // <함수>
    // STEP1 함수 - a. 1~9 사이의 임의의 수 생성 함수
    func createRandomThreeNum() -> [Int] {
        var randomThreeNum: [Int] = []
        while randomThreeNum.count < 3 {
            let randomNum = Int.random(in: 1...9)
            if !randomThreeNum.contains(randomNum) { // 중복 체크
                randomThreeNum.append(randomNum)
            }
        }
        
        return randomThreeNum
    }
    
    // STEP1 함수 - b. 스트라이크 볼 체크 함수
    func checkStrikeBall(standardArray: [Int], compareArray: [Int]) -> [Int] {
        var strike = 0
        var ball = 0
        var result: [Int] = []
        
        for i in 0...2 {
            if standardArray[i] == compareArray[i] {
                strike += 1
            } else if g_arrayNum.contains(compareArray[i]) {
                ball += 1
            }
        }
        
        result.append(strike)
        result.append(ball)
        
        return result
    }

    // STEP1 함수 - c. 게임 스타트 함수
    func startGame() {
        var chance = g_chance
        g_arrayNum = createRandomThreeNum()
        
        print("exit를 입력하면 게임 메뉴로 돌아갑니다.")
        
        while chance > 0 {

            // 사용자 입력 함수 실행
            let userInput = setInputNum()
            if userInput[0] == 0 {
                print("메뉴로 돌아갑니다.")
                break
            }
            
            // 스트라이크 볼 체크 함수 실행 *인덱스 0: 스트라이크, 1: 볼
            let checkedSB = checkStrikeBall(standardArray: g_arrayNum, compareArray: userInput)
            
            print("\(chance)남은 기회 \(checkedSB[0])스트라이크, \(checkedSB[1])볼")
            
            // 지정된 숫자와 사용자 입력 숫자가 같을 시
            if checkedSB[0] == 3 {
                print("사용자 승리!")
                break
            }
            
            chance -= 1
            
            if chance == 0 {
                print("컴퓨터 승리!")
                break
            }
        }
    }

    // STEP2 함수 - a. 사용자 메뉴를 출력하고 메뉴를 입력받는 함수 (게임 시작, 종료)
    func gameMenu() {
        var gameMenuStatus = true
        
        while gameMenuStatus {
            print("1. 게임시작\n2. 게임 종료")
            print("원하는 기능을 입력해주세요 : ", terminator: "")
        
            let userChoiceMenu = readLine()
            switch userChoiceMenu {
            case "1":
                startGame()

            case "2":
                print("게임을 종료합니다")
                gameMenuStatus = false
            default:
                print("입력이 잘못되었습니다")
            }
            
        }
    }
    
    // STEP2 함수 - b. 게임숫자를 입력받는 함수
    // *사용자 입력 함수 입력한 값을 정수의 배열로 변환 #1 2 3 -> [1, 2, 3]
    func setInputNum() -> [Int] {
        let warningMessege = "숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다."

        while true {
            var intArrayNum: [Int] = []
            
            print(warningMessege)
            print("입력 : ", terminator: "")
            let inputNum = readLine()!
            let stringArrayNum: [String] = inputNum.components(separatedBy: " ")
            
            // 만약 중단 입력시 중단 리턴
            if stringArrayNum.contains("exit") {
                return [0]
            }
            
            if stringArrayNum.count == 3 {
                for i in stringArrayNum {
                    guard let num: Int = Int(i) else { continue }
                    
                    if !intArrayNum.contains(num) { // 중복 체크
                        intArrayNum.append(num)
                    } else {
                        continue // 중복이므로 다시
                    }
                }
            } else {
                continue // 3개가 아니므로 다시
            }
            
            if intArrayNum.count == 3 {
                return intArrayNum
            }
        }
    }
    
    
}


var testGame = NumberBaseBall()

testGame.gameMenu()
