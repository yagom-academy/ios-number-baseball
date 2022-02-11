import Foundation


func makeNonDuplicatedNumbers() -> Set<Int> {
    var nonDuplicatedNumbers: Set<Int> = []
    
    while nonDuplicatedNumbers.count < 3 {
        let triedNonDuplicatedNumber = Int.random(in: 1...9)
        nonDuplicatedNumbers.insert(triedNonDuplicatedNumber)
    }
    return nonDuplicatedNumbers
}

func convertSetToArray() -> Array<Int> {
    let nonDuplicatedNumbers = makeNonDuplicatedNumbers()
    let sortedNumbers = Array(nonDuplicatedNumbers)
    return sortedNumbers
}

func increaseStrikeBallCount(_ answerNumbers: Array<Int>, _ randomNumbers: Array<Int>, _ strikeCount: Int, _ ballCount: Int, _ index: Int) -> (Int, Int) {
    var increaseStrikeCount = strikeCount
    var increaseBallCount = ballCount
    
    if answerNumbers[index] == randomNumbers[index] {
        increaseStrikeCount += 1
    } else if answerNumbers.contains(randomNumbers[index]) {
        increaseBallCount += 1
    }
    return (increaseStrikeCount, increaseBallCount)
}

func returnStrikeBallCount(_ answerNumbers: Array<Int>, _ randomNumbers: Array<Int>) -> (Int, Int) {
    var strikeCount = 0
    var ballCount = 0
    
    for index in 0...2 {
        (strikeCount, ballCount) = increaseStrikeBallCount(answerNumbers, randomNumbers, strikeCount, ballCount, index)
    }
    return (strikeCount, ballCount)
}

func printResult(_ randomNumbers: Array<Int>, _ strikeCount: Int, _ ballCount: Int, _ remainCount: Int) {
    let firstNumber = randomNumbers[0]
    let secondNumber = randomNumbers[1]
    let thirdNumber = randomNumbers[2]
    
    print("임의의 수 : \(firstNumber) \(secondNumber) \(thirdNumber)")
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    print("남은 기회 : \(remainCount)")
}

func decideWinner(_ strikeCount: Int, _ remainCount: Int) -> Int {
    var exitWhile = remainCount
    
    if strikeCount == 3 {
        print("사용자 승리...!")
        exitWhile = 0
    } else if remainCount == 0 {
        print("컴퓨터 승리...!")
    }
    return exitWhile
}

func startGame() {
    var answerNumbers: Array<Int> = []
    var randomNumbers: Array<Int> = []
    var remainCount = 1000
    
    answerNumbers = convertSetToArray()
    while remainCount != 0 {
        randomNumbers = convertSetToArray()
        let (strikeCount, ballCount) = returnStrikeBallCount(answerNumbers, randomNumbers)
        remainCount -= 1
        printResult(randomNumbers, strikeCount, ballCount, remainCount)
        remainCount = decideWinner(strikeCount, remainCount)
    }
}

startGame()
