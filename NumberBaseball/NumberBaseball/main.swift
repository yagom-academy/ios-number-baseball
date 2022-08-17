import Foundation

let randomNumbers = Array((1...9).shuffled()[..<3])
var tryCount = 9

func generateNumbers() -> [Int] {
    return Array((1...9).shuffled()[..<3])
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
    while tryCount >= 1 {
        var (strike, ball) = (0, 0)
        let myNumbers = generateNumbers()
        
        tryCount -= 1
        
        print("임의의 수 :\(myNumbers.reduce("") { "\(String($0)) \(String($1))" })")
        print("\(strike) 스트라이크, \(ball) 볼")
        (strike, ball) = judge(myNumbers)
        
        if strike == 3 {
            print("사용자 승리!")
            return
        } else {
            tryCount != 0 ? print("남은 기회 : \(tryCount)") : print("컴퓨터 승리...!")
        }
    }
}

showResult()
