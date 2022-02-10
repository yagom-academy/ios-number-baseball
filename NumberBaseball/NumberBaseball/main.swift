import Foundation


func makeRandomNum() -> Set<Int> {
    var randomSet: Set<Int> = []

    while randomSet.count < 3 {
        let randomNumberInSet = Int.random(in: 1...9)
        randomSet.insert(randomNumberInSet)
    }
    return randomSet
}


func changeArray() -> Array<Int> {
    let setRandomNum = makeRandomNum()
    let arrayRandomNum = Array(setRandomNum)
    return arrayRandomNum
}


func checkStrikeBall(answerNumbers: Array<Int>, randomNumbers: Array<Int>) -> (Int, Int) {
    var strikeCount = 0
    var ballCount = 0

    for index in 0...2 {
        if answerNumbers[index] == randomNumbers[index] {
            strikeCount += 1
        } else if answerNumbers.contains(randomNumbers[index]) {
            ballCount += 1
        }
    }
    return (strikeCount, ballCount)
}


func printResult(randomNumbers: Array<Int>, strikeCount: Int, ballCount: Int, tryCount: Int) {
    print("임의의 수 : \(randomNumbers[0]) \(randomNumbers[1]) \(randomNumbers[2])")
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    print("남은 기회 : \(tryCount)")
}


func finishGame(strikeCount: Int, tryCount: Int) -> Int {
    var endCount = tryCount

    if strikeCount == 3 {
        print("사용자 승리...!")
        endCount = 0
    } else if tryCount == 0 {
        print("컴퓨터 승리...!")
    }
    return endCount
}


func startGame() {
    var answerNumbers: Array<Int> = []
    var randomNumbers: Array<Int> = []
    var tryCount = 9

    answerNumbers = changeArray()
    while tryCount != 0 {
        randomNumbers = changeArray()
        let (strikeCount, ballCount) = checkStrikeBall(answerNumbers: answerNumbers, randomNumbers: randomNumbers)
        tryCount -= 1
        printResult(randomNumbers: randomNumbers, strikeCount: strikeCount, ballCount: ballCount, tryCount: tryCount)
        tryCount = finishGame(strikeCount: strikeCount, tryCount: tryCount)
    }
}


startGame()
