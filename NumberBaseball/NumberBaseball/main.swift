
var chance: Int = 9
var gameNumbers: [Int] = makeRandomThreeNumbers()

func makeRandomThreeNumbers() -> [Int] {
    var randomGameNumbers: Set<Int> = []
    while randomGameNumbers.count < 3 {
        randomGameNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomGameNumbers)
}

func compareNumber(userGameNumber: [Int]) -> [Int] {
    var strikeCount = 0
    var ballCount = 0
    for index in 0...2 {
        if gameNumbers[index] == userGameNumber[index] {
            strikeCount += 1
        } else if gameNumbers[index] != userGameNumber[index] && gameNumbers.contains(userGameNumber[index]) {
            ballCount += 1
        }
    }
    return [strikeCount, ballCount]
}

func playNumberBaseballGame(chance: Int) {
    var chance: Int = chance
    while 0 != chance {
        let userGameNumber : [Int] = makeRandomThreeNumbers()
        let strikeAndBallCounts = compareNumber(userGameNumber: userGameNumber)
        let gameStrikeCount = strikeAndBallCounts[0]
        let gameBallCount = strikeAndBallCounts[1]
        print("임의의 수 : \(userGameNumber[0]) \(userGameNumber[1]) \(userGameNumber[2])")
        print("\(gameStrikeCount) 스트라이크, \(gameBallCount) 볼")
        chance -= 1
        if gameStrikeCount == 3 {
            print("사용자 승리...!")
            return
        } else if chance > 0 {
            print("남은기회 : \(chance)")
        } else if chance == 0 {
            print("컴퓨터 승리...!")
        }
    }
}

playNumberBaseballGame(chance: 9)

