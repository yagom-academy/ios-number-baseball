//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//



/*
 1. 주석은 옆이아닌 위에 작성해야 합니다.
 2. 한 줄은 최대 99자를 넘지 않아야 합니다. Xcode의 Preferences → Text Editing → Display의 'Page guide at column' 옵션을 활성화하고 99자로 설정하면 편리합니다.
 3. 함수 정의가 최대 길이(99자)를 초과하는 경우에는  줄바꿈합니다.
 4. `guard let` 구문이 길 경우에는 줄바꿈하고 한 칸 들여씁니다. `else`는 `guard`와 같은 들여쓰기를 적용합니다.
 5. `print()`함수의 줄바꿈은 `\n`을 쓰기보다, `print()`함수를 한번 더 써줍니다.
 6. “첫번째 문장을 띄운 함수도 있고, 아닌 함수도 있네요 ? 줄바꿈의 규칙이 필요해보여요.” -> 첫번째 문장은 안띄우는걸로 통일 했습니다.
 7. 여러 중첩 조건문들로 인해 코드의 깊이가 깊어지고 있네요, 개선의 필요성이 있어보입니다. 함수로 분리하는 것도 방법입니다.


 * Reference
     https://awesomeopensource.com/project/StyleShare/swift-style-guide#줄바꿈
 */




import Foundation

class NumberBaseBall {
    var standardNums: [Int] = []
    var chance: Int = 9

    // 게임 메뉴실행
    func startGame() {
        var gameMenuStatus: Bool = true
        
        while gameMenuStatus {
            print("1. 게임 시작")
            print("2. 게임 종료")
            print("원하는 기능을 입력해주세요 : ", terminator: "")
        
            let userChoiceMenu: String = readLine() ?? ""
            switch userChoiceMenu {
            case "1":
                playGame()
            case "2":
                print("게임을 종료합니다")
                gameMenuStatus = false
            default:
                print("입력이 잘못되었습니다")
            }
        }
    }
    
    // 게임 실행
    private func playGame() {
        var mChance: Int = chance
        standardNums = createRandomNums()
        
        while mChance > 0 {
            mChance -= 1
            
            // 사용자 입력
            guard let userInputs = setInputNums(),
                  userInputs[0] != 0
            else {
                print("메뉴로 돌아갑니다.")
                break
            }
            
            // 게임 결과
            let chkStrikeBall: Dictionary<String, Int> = checkStrikeBall(
                standardNums: standardNums,
                compareNums: userInputs)
            
            print("\(chkStrikeBall["strike"]!) 스트라이크, \(chkStrikeBall["ball"]!) 볼")
            print("남은 기회 : \(mChance)")
            
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
            print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
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
                  !intNums.contains(num)
            else {
                continue
            }
            
            intNums.append(num)
        }
//        print(intNums)
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
