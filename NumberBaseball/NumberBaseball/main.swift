import Foundation

let answer: [Int] = generateRandomArray()
var trialNumber: Int = 9
var userWin = false
var gameEnd = false

func playGameRound() {
    let userValue = generateRandomArray()
    
    trialNumber -= 1
    checkExitConditions(userValue: userValue)
    showResult(userValue: userValue, userWin: userWin, gameEnd: gameEnd)

    if gameEnd == false {
        playGameRound()
    }
}

func checkExitConditions(userValue: [Int]) {
    if answer == userValue {
        userWin = true
        gameEnd = true
    } else if trialNumber == 0 {
        gameEnd = true
    }
}

func showResult(userValue: [Int], userWin: Bool, gameEnd: Bool) {
    print("임의의 수 : \(userValue[0]) \(userValue[1]) \(userValue[2])")
    printWinner()
    print("\(getStrikeCount(userValue: userValue)) 스트라이크 \(getBallCount(userValue: userValue)) 볼")
    print("남은 기회: \(trialNumber)")
}

func printWinner() {
    if userWin && gameEnd {
        print("사용자 승리...!")
    } else if gameEnd {
        print("컴퓨터 승리...!")
    }
}

func generateRandomArray() -> [Int] {
    var numbers = [Int](1...9)
    var randomArray: [Int] = []

    for _ in 0...2 {
        let randomIndex = Int.random(in: 0...(numbers.count - 1))
        let randomNumber = numbers.remove(at: randomIndex)

        randomArray.append(randomNumber)
    }

    return randomArray
}

func getStrikeCount(userValue: [Int]) -> Int {
    let combined = zip(answer, userValue)
    let strike = combined.filter{Set([$0.0, $0.1]).count == 1}.count
    
    return strike
}

func getBallCount(userValue: [Int]) -> Int {
    let combined = userValue + answer
    let setCombinedCount = Set(combined).count
    let ball = 6 - setCombinedCount - getStrikeCount(userValue: userValue)
    
    return ball
}

playGameRound()
