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

func compare(computerNumber: [Int], playerNumber: [Int]) -> (Int, Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    let iterationOfRange: Range<Int> = 0..<3
    
    for index in iterationOfRange {
        if computerNumbers[index] == playerNumber[index] {
            strikeCount += 1
        } else if computerNumbers.contains(playerNumber[index]) {
            ballCount += 1
        }
    }
    return (strikeCount, ballCount)
}

func printWinner(strikeCount: Int) {
    if strikeCount == 3 {
        print("사용자 승리!")
        return
    } else if remainingTime == 0 {
        print("컴퓨터 승리...!")
    }
}

func startGame() {
    repeat {
        computerNumbers = createDeduplicatedRadnomNumbers()
        let playerNumbers: [Int] = createDeduplicatedRadnomNumbers()
        let strikeBallOfResult: (strikeCount: Int, ballCount: Int) = compare(computerNumber: computerNumbers, playerNumber: playerNumbers)
        remainingTime -= 1
        
        print("임의의 수 : \(computerNumbers[0]) \(computerNumbers[1]) \(computerNumbers[2])")
        
        printWinner(strikeCount: strikeBallOfResult.strikeCount)
        
        print("\(strikeBallOfResult.strikeCount) 스트라이크, \(strikeBallOfResult.ballCount) 볼")
        print("남은 기회 : \(remainingTime)")
        
    } while remainingTime != .zero
}

startGame()
