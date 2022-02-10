import Foundation

var computerNumbers: [Int] = []
var remainingTime: Int = 9

func createDeduplicatedRadnomNumbers() -> [Int] {
    var deduplicatedRandomNumbers: Set<Int> = []
    let numberOfDigits: Int = 3
    let randomOfRange: ClosedRange<Int> = 1...9
    
    while deduplicatedRandomNumbers.count < numberOfDigits {
        deduplicatedRandomNumbers.insert(Int.random(in: randomOfRange))
    }
    return Array(deduplicatedRandomNumbers)
}

func compare(computerNumber: [Int], playerNumber: [Int]) -> [Int] {
    var strikeBallStack: [Int] = [0, 0]
    let iterationOfRange: Range<Int> = 0..<3
    
    for index in iterationOfRange {
        if computerNumbers[index] == playerNumber[index] {
            strikeBallStack[0] += 1
        } else if computerNumbers.contains(playerNumber[index]) {
            strikeBallStack[1] += 1
        }
    }
    return strikeBallStack
}

func startGame() {
    repeat {
        computerNumbers = createDeduplicatedRadnomNumbers()
        let playerNumbers: [Int] = createDeduplicatedRadnomNumbers()
        let strikeBallOfResult = compare(computerNumber: computerNumbers, playerNumber: playerNumbers)
        remainingTime -= 1
        
        print("임의의 수 : \(computerNumbers[0]) \(computerNumbers[1]) \(computerNumbers[2])")
        
        if strikeBallOfResult[0] == 3 {
            print("사용자 승리!")
            return
        } else if remainingTime == 0 {
            print("컴퓨터 승리...!")
        }
        
        print("\(strikeBallOfResult[0]) 스트라이크, \(strikeBallOfResult[1]) 볼")
        print("남은 기회 : \(remainingTime)")
        
    } while remainingTime != .zero
}

startGame()
