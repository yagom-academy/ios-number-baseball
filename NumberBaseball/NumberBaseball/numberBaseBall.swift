
import Foundation

let threeAnswerNumbers = [1, 2, 3]
var randomThreeNumbers: [Int] = []
var attempsNumbers = 9

func generateRandomThreeNumbers() {
    while randomThreeNumbers.count < 3 {
        let randomNumber = Int.random(in:1...9)

        if randomThreeNumbers.contains(randomNumber) == false {
            randomThreeNumbers.append(randomNumber)
        }
    }
    print("임의의 수 : \(randomThreeNumbers.map { String($0) }.joined(separator: " "))")
}

func checkStrikeAndBall() -> Int {
    var strike = 0
    var ball = 0
    
    for number in 0...randomThreeNumbers.count - 1 {
        if randomThreeNumbers[number] == threeAnswerNumbers[number] {
            strike += 1
        } else if threeAnswerNumbers.contains(randomThreeNumbers[number]) {
            ball += 1
        }
    }
    attempsNumbers -= 1
    
    print("""
          \(strike) 스트라이크, \(ball) 볼
          남은 기회 : \(attempsNumbers)
          """)
    
    return strike
}

func playNumberBaseBall() {
    while attempsNumbers > 0 {
        randomThreeNumbers.removeAll()
        generateRandomThreeNumbers()
        
        let strike = checkStrikeAndBall()
        
        if strike == 3 {
            print("사용자 승리!")
            break
        } else if attempsNumbers == 0 {
            print("컴퓨터 승리...!")
        }
    }
}
