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

func makePlayerRandomNumber() {
    playerRandomNumbers = makeDeduplicatedRandomNumbers()
}

func printPlayerRandomNumber() {
    print("임의의 수 : ", terminator: "")
    for number in playerRandomNumbers {
        print("\(number) ", terminator: "")
    }
    print("\n", terminator: "")
}

func checkSameNumbers(computerNumbers: [Int], with playerNumbers: [Int]) -> [Int] {
    let computerNumbersWithoutOrder: Set<Int> = Set(computerNumbers)
    let playerNumbersWithoutOrder: Set<Int> = Set(playerNumbers)
    let sameNumbers: [Int] = computerNumbersWithoutOrder.intersection(playerNumbersWithoutOrder).sorted()
    
    return sameNumbers
}

func checkSameOrder(computerNumbers: [Int], with playerNumbers: [Int]) {
    let sameNumbers: [Int] = checkSameNumbers(computerNumbers: computerNumbers, with: playerNumbers)
    
    for sameNumber in sameNumbers {
        
        if let indexOfComputerNumber = computerNumbers.firstIndex(of: sameNumber),
           let indexOfPlayerNumber = playerNumbers.firstIndex(of: sameNumber) {
            if indexOfComputerNumber == indexOfPlayerNumber {
                strike += 1
                continue
            }
            ball += 1
        }
        
    }
}
