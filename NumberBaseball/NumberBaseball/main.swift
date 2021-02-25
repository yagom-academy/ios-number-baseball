//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class NumberBaseBall {
    // <전역변수>
    var standardNums: [Int] = []   // STEP1 변수 - a. 임의의 수 저장을 위한 빈 배열 선언
    var chance: Int = 9                 // STEP1 변수 - b. 남은 시도 횟수

    // <함수>
    // STEP1 함수 - a. 1~9 사이의 임의의 수 생성 함수
    func createRandomNums() -> [Int] {
        var randomNums: [Int] = []
        while randomNums.count < 3 {
            let randomNum = Int.random(in: 1...9)
            if !randomNums.contains(randomNum) { // 중복 체크
                randomNums.append(randomNum)
            }
        }
         
        return randomNums
    }
    
    // STEP1 함수 - b. 스트라이크 볼 체크 함수
    func checkStrikeBall(standardArray: [Int], compareArray: [Int]) -> Dictionary<String, Int> {
        var gameResult = ["strike": 0, "ball": 0]
        
        for i in 0...2 {
            if standardArray[i] == compareArray[i] {
                gameResult["strike"]! += 1
            } else if standardNums.contains(compareArray[i]) {
                gameResult["ball"]! += 1
            }
        }
        
        return gameResult
    }

    // STEP1 함수 - c. 게임 스타트 함수
    func startGame() {
        var mChance: Int = chance
        standardNums = createRandomNums()
        
        print("exit를 입력하면 게임 메뉴로 돌아갑니다.")
        
        while mChance > 0 {
            mChance -= 1
            
            // 사용자 입력 함수 실행
            guard let userInputs = setInputNums(),
                  userInputs[0] != 0 else {
                print("메뉴로 돌아갑니다.")
                break
            }
            
            // 스트라이크 볼 체크 함수 실행 *인덱스 0: 스트라이크, 1: 볼
            let chkStrikeBall: Dictionary<String, Int> = checkStrikeBall(standardArray: standardNums, compareArray: userInputs)
            
            print("\(chkStrikeBall["strike"]!) 스트라이크, \(chkStrikeBall["ball"]!) 볼\n남은 기회 : \(mChance)")
            
            // 지정된 숫자와 사용자 입력 숫자가 같을 시
            if chkStrikeBall["strike"] == 3 {
                print("사용자 승리!")
                break
            }
            
            if mChance == 0 {
                print("컴퓨터 승리!")
                break
            }
        }
    }

    // STEP2 함수 - a. 사용자 메뉴를 출력하고 메뉴를 입력받는 함수 (게임 시작, 종료)
    func gameMenu() {
        var gameMenuStatus: Bool = true
        
        while gameMenuStatus {
            print("1. 게임시작\n2. 게임 종료")
            print("원하는 기능을 입력해주세요 : ", terminator: "")
        
            let userChoiceMenu: String = readLine() ?? ""
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
    func setInputNums() -> [Int]? {
        
        // 반복문을 통해 잘못된 입력을 해도 다시 입력문 실행
        while true {
            var intNums: [Int] = []
            
            print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.")
            print("입력 : ", terminator: "")
            
            guard let inputNum = readLine(),
                  inputNum != "exit" else {
                return [0]
            }
            
            // 사용자가 입력한 문자열의 띄어쓰기를 기준으로 문자열 배열로 변환
            let stringNums: [String] = inputNum.components(separatedBy: " ")
            
            // 일단 배열의 원소 갯수가 3개일 경우 for문 실행, 아니라면 continue
            if stringNums.count == 3 {
                for i in stringNums {   // for문을 통해 원소를 정수로 형변환
                    guard let num: Int = Int(i) else { continue }
                    
                    if !intNums.contains(num) { // 중복 체크
                        intNums.append(num)
                    } else {
                        continue // 중복이므로 다시
                    }
                }
            } else {
                continue // 3개가 아니므로 다시
            }
            
            if intNums.count == 3 { // 정상적으로 정수로 바꾼 배열의 원소 갯수가 3일경우 값을 리턴
                return intNums
            }
        }
    }
    
    
}

var testGame = NumberBaseBall()

testGame.gameMenu()
