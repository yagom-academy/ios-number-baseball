//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum ChoiceMenuType: String {
    case gameStart = "1"
    case gameEnd = "2"
}

class NumberBaseBall {
    var nonoverlapRandomNums: [Int] = []
    var chance: Int = 9

    // 게임 메뉴실행
    func startGame() {
        var gameMenuStatus: Bool = true
        
        while gameMenuStatus {
            print("1. 게임 시작")
            print("2. 게임 종료")
            print("원하는 기능을 입력해주세요 : ", terminator: "")
        
            let userChoiceMenu = ChoiceMenuType(rawValue: readLine() ?? "")
                
            switch userChoiceMenu {
            case .gameStart:
                playGame()
            case .gameEnd:
                print("게임을 종료합니다")
                gameMenuStatus = false
            default:
                print("입력이 잘못되었습니다")
            }
        }
    }
    
    // 게임 실행
    private func playGame() {
        var remainingChance: Int = chance
        nonoverlapRandomNums = createRandomNums()
        
        while remainingChance > 0 {
            remainingChance -= 1
            
            // 사용자 입력
            guard let userInputs = setInputNums(),
                  userInputs[0] != 0
            else {
                print("메뉴로 돌아갑니다.")
                break
            }
            
            // 게임 결과
            let chkStrikeBall: Dictionary<String, Int> = checkStrikeBall(
                standardNums: nonoverlapRandomNums,
                compareNums: userInputs)
            
            print("\(chkStrikeBall["strike"]!) 스트라이크, \(chkStrikeBall["ball"]!) 볼")
            print("남은 기회 : \(remainingChance)")
            
            if chkStrikeBall["strike"] == 3 {
                print("사용자 승리!")
                break
            }
            
            if remainingChance == 0 {
                print("컴퓨터 승리!")
                break
            }
        }
    }
    
    // 1~9 임의의 수 생성
    private func createRandomNums() -> [Int] {
        var randomNums: [Int] = []
        
        while randomNums.count < 3 {
            let randomNum = Int.random(in: 1...9)
            
            // 중복체크
            if !randomNums.contains(randomNum) {
                randomNums.append(randomNum)
            }
        }
         
        return randomNums
    }
    
    // 숫자 입력
    private func setInputNums() -> [Int]? {
        while true {
            print("9 이하의 숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
            print("중복 숫자는 허용하지 않습니다.")
            print("exit을 입력하면 게임 메뉴로 돌아갑니다.")
            print("입력 : ", terminator: "")
            
            guard let stringNums = readLine()?.components(separatedBy: " "),
                  !stringNums.contains("exit")
            else {
                return [0]
            }
        
            guard let intNum = convertStringtoInt(stringNums),
                  intNum.count == 3
            else {
                continue
            }
            
            return intNum
        }
    }
    
    // 정수로 형변환
    private func convertStringtoInt(_ stringNums: [String]) -> [Int]? {
        var intNums: [Int] = []
        
        for i in stringNums {
            // 중복체크
            guard let num = Int(i),
                  num < 10,
                  !intNums.contains(num)
            else {
                continue
            }
            
            intNums.append(num)
        }
        
        return intNums
    }
    
    // 스트라이크&볼 체크
    private func checkStrikeBall(
        standardNums: [Int],
        compareNums: [Int]
    ) -> Dictionary<String, Int> {
        var gameResult = ["strike": 0, "ball": 0]
        
        for i in 0...2 {
            if standardNums[i] == compareNums[i] {
                gameResult["strike"]! += 1
            } else if standardNums.contains(compareNums[i]) {
                gameResult["ball"]! += 1
            }
        }
        
        return gameResult
    }
}

var testGame = NumberBaseBall()

testGame.startGame()
