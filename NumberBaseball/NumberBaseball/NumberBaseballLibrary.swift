//  Created by zhilly and som on 2022/08/17.

class NumberBaseballLibrary {
    private var computerRandomNumberArray: [Int] = []
    private var userThreeNumberArray: [Int] = []
    private var numberOfAttempts = 9
    private var strike: Int = 0
    private var ball: Int = 0

    private func generateRandomNumber() -> [Int] {
        var randomNumArray: [Int] = []
        while randomNumArray.count < 3 {
            randomNumArray.append(Int.random(in: 1...9))
            randomNumArray = Array(Set(randomNumArray))
        }
        return randomNumArray
    }

    private func putNumberInArray() {
        computerRandomNumberArray = generateRandomNumber()
        print(computerRandomNumberArray)
    }

    private func matchIndex(_ x: Int, _ y: Int) -> Bool {
        return ( x == y )
    }

    private func matchNumberArray(
        _ computerArray: [Int],
        _ userThreeNumberArray: [Int]
    ) -> (Int, Int)
    {
        for i in 0...2 {
            if matchIndex(Int(computerArray[i]), Int(userThreeNumberArray[i])) == true {
                strike += 1
            } else if computerArray.contains(userThreeNumberArray[i]) {
                ball += 1
            }
        }
        return (strike, ball)
    }

    private func resetStrikeAndBall() {
        strike = 0
        ball = 0
    }
    
    private func isThreeStrike() {
        if strike == 3 {
            numberOfAttempts = -1
            return
        } else {
            resetStrikeAndBall()
            numberOfAttempts -= 1
        }
    }
    
    private func confirmNumberOfAttempts() {
        if numberOfAttempts > 0 {
            print("남은 기회 : \(numberOfAttempts)")
        }
    }
    
    private func judgeWinCondition() {
        if numberOfAttempts == 0 {
            print("컴퓨터 승리...!")
        } else if numberOfAttempts == -1 {
            print("사용자 승리!")
        }
    }
    
    private func displayGameStatement() {
        let (outputStrike,outputBall) = matchNumberArray(
            computerRandomNumberArray,
            userThreeNumberArray
        )
        print("\(outputStrike) 스트라이크, \(outputBall) 볼")
    }
    
    private func playNumberBaseball() {
        putNumberInArray()
        
        while numberOfAttempts > 0 {
            inputUserThreeNumber()
            displayGameStatement()
            isThreeStrike()
            confirmNumberOfAttempts()
        }
        
        judgeWinCondition()
    }
}

extension NumberBaseballLibrary: NumberBaseballLibraryProtocol {
    func userMenu() {
        var flag = true
        while flag {
            flag = displayUserMenu()
        }
    }
    
    func displayUserMenu() -> Bool {
        print("1. 게임시작")
        print("2. 게임종료")
        
        let userSelectNumber = inputUserMenuSelect()
        switch userSelectNumber {
        case 1:
            playNumberBaseball()
            return true
        case 2:
            return false
        default:
            print("입력이 잘못 되었습니다.")
            return true
        }
    }
    
    func inputUserMenuSelect() -> Int {
        print("원하는 기능을 선택해주세요 : ", terminator: "")
        guard let inputMenuNumber = readLine() else { return 0 }
        let inputMenuNumberToInt = Int(inputMenuNumber)
        switch inputMenuNumberToInt {
        case 1:
            return 1
        case 2:
            return 2
        default:
            return 0
        }
    }
    
    func inputUserThreeNumber() {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
        print("중복 숫자는 허용하지 않습니다.")
        print("입력 : ", terminator: "")
        
        
        
        guard let inputThreeNumber = readLine() else { return inputUserThreeNumber() }
        
        var numberToStringArray: [String] = []
        
        numberToStringArray = inputThreeNumber.split(separator: " ").compactMap { String($0) }
        
        if checkUserInputNumber(numberToStringArray) == true {
            userThreeNumberArray = inputThreeNumber.split(separator: " ").compactMap { Int($0) }
        } else {
            return inputUserThreeNumber()
        }
        
        
    }
    
    func checkUserInputNumber(_ inputArray: [String]) -> Bool {
        var tempArray: [Int] = []
        
        for number in inputArray {
            if let numberToString = Int(number) {
                tempArray.append(numberToString)
            } else {
                return false
            }
        }
        
        if inputArray.count != 3 {
            return false
        }
        
        let arrayMaxData = tempArray.max() ?? 10
        let arrayMinData = tempArray.min() ?? 0
        
        if arrayMaxData > 9 || arrayMinData < 1 {
            return false
        }
        
        return true
    }
}
