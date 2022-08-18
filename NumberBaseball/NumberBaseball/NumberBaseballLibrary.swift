//  Created by zhilly and som on 2022/08/17.

class NumberBaseballLibrary {
    private var computerRandomNumberArray: [Int] = []
    private var numberOfAttempts = 9
    private var otherComputerRandomNumberArray: [Int] = []
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
    }

    private func putTestNumberInArray() {
        otherComputerRandomNumberArray = generateRandomNumber()
    }

    private func matchIndex(_ x: Int, _ y: Int) -> Bool {
        return ( x == y )
    }

    private func matchNumberArray(_ computerArray: [Int], _ otherComputerArray: [Int]) -> (Int, Int) {
        for i in 0...2 {
            if matchIndex(Int(computerArray[i]), Int(otherComputerArray[i])) == true {
                strike += 1
            } else if computerArray.contains(otherComputerArray[i]) {
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
            return
        } else {
            resetStrikeAndBall()
            numberOfAttempts -= 1
        }
    }
    
    private func confirmNumberOfAttempts() {
        if numberOfAttempts != 0 {
            print("남은 기회 : \(numberOfAttempts)")
        }
    }
    
    private func judgeWinCondition() {
        if numberOfAttempts > 0 {
            print("임의의 수 승리!")
        } else {
            print("컴퓨터 승리...!")
        }
    }
    
    private func displayGameStatement() {
        let (outputStrike,outputBall) = matchNumberArray(
            computerRandomNumberArray,
            otherComputerRandomNumberArray
        )
        let messeage = otherComputerRandomNumberArray.map { String($0) }.joined(separator: " ")
        print("임의의 수 : \(messeage)")
        print("\(outputStrike) 스트라이크, \(outputBall) 볼")
    }
}

extension NumberBaseballLibrary: NumberBaseballLibraryProtocol {
    func playNumberBaseball() {
        putNumberInArray()
        
        while numberOfAttempts > 0 {
            putTestNumberInArray()
            displayGameStatement()
            isThreeStrike()
            confirmNumberOfAttempts()
        }
        
        judgeWinCondition()
    }
}
