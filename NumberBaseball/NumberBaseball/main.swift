import Foundation

var computerRandomNumbers: [Int] = []
var playerRandomNumbers: [Int] = []
var trialCount: Int = 9
var strike: Int = 0
var ball: Int = 0
var isGameOver: Bool = false

func makeDeduplicatedRandomNumbers() -> [Int] {
    var deduplicatedNumbers: Set<Int> = []
    
    while deduplicatedNumbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        deduplicatedNumbers.insert(randomNumber)
    }
    return Array(deduplicatedNumbers)
}

func makeComputerRandomNumber() {
    computerRandomNumbers = makeDeduplicatedRandomNumbers()
    print("(과제 확인용 출력) 컴퓨터 : \(computerRandomNumbers)")
}
