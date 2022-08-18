import Foundation

func generateThreeRandomNumbers() -> [Int] {
    let shuffledNumbers = (1...9).shuffled()
    let threeNumbers = Array(shuffledNumbers.prefix(3))
    return threeNumbers
}

func countStrikeOrBall(with myNumbers: [Int]) -> (Int, Int) {
    var (strike, ball) = (0, 0)

    for (number, myNumber) in zip(targetNumbers, myNumbers) {
        if number == myNumber {
            strike += 1
        } else if targetNumbers.contains(myNumber) {
            ball += 1
        }
    }

    return (strike, ball)
}

func isThreeStrike() -> Bool {
    let myNumbers: [Int] = generateThreeRandomNumbers()
    let convertedMyNumber: String = myNumbers.reduce("") { String($0) + " " + String($1) }
    let (strike, ball) = countStrikeOrBall(with: myNumbers)
    
    print("임의의 수 :\(convertedMyNumber)" )
    print("\(strike) 스트라이크, \(ball) 볼")
    
    if strike == 3 {
        return true
    }
    return false
}

func showResult() {
    var tryCount = 9

    while tryCount >= 1 {
        if isThreeStrike() {
            print("사용자 승리!")
            break
        }
        
        tryCount -= 1
        
        tryCount != 0 ? print("남은 기회 : \(tryCount)") : print("컴퓨터 승리...!")
    }
}

let targetNumbers: [Int] = generateThreeRandomNumbers()
showResult()
