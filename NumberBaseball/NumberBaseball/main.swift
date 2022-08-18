import Foundation

func generateThreeRandomNumbers() -> [Int] {
    let shuffledNumbers = (1...9).shuffled()
    let threeNumbers = Array(shuffledNumbers.prefix(3))
    return threeNumbers
}

func judge(_ myNumbers: [Int]) -> (Int, Int) {
    var (strike, ball) = (0, 0)

    for (number, myNumber) in zip(randomNumbers, myNumbers) {
        if number == myNumber {
            strike += 1
        } else if randomNumbers.contains(myNumber) {
            ball += 1
        }
    }

    return (strike, ball)
}

func showResult() {
    var tryCount = 9

    while tryCount >= 1 {
        var (strike, ball) = (0, 0)
        let myNumbers = generateNumbers()

        tryCount -= 1

        (strike, ball) = judge(myNumbers)
        print("임의의 수 :\(myNumbers.reduce("") { "\(String($0)) \(String($1))" })" )
        print("\(strike) 스트라이크, \(ball) 볼")

        if strike == 3 {
            print("사용자 승리!")
            return
        } else {
            tryCount != 0 ? print("남은 기회 : \(tryCount)") : print("컴퓨터 승리...!")
        }
    }
}

showResult()
