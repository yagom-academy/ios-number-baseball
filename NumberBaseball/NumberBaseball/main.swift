
var chance: Int = 9
var gameNumbers: [Int] = makeRandomThreeNumbers()

func makeRandomThreeNumbers() -> [Int] {
    var randomGameNumbers: Set<Int> = []
    while randomGameNumbers.count < 3 {
        randomGameNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomGameNumbers)
}

func compareNumber(userGameNumber: [Int], strikeCount: Int, ballCount: Int) {
    var strikeCount = 0
    var ballCount = 0
    for index in 0...2 {
        if gameNumbers[index] == userGameNumber[index] {
            strikeCount += 1
        } else if gameNumbers[index] != userGameNumber[index] && gameNumbers.contains(userGameNumber[index]) {
            ballCount += 1
        }
    }
//    if strikeCount == 3 {
//        print("사용자 승리...")
//        return
//    }
//    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
}

//func playNumberBaseballGame(chane: Int) {
//    for _ in 1...chance {
//        let userGameNumber : Array<Int> = makeRandomThreeNumbers()
//        print("임의의 수 : \(userGameNumber[0]) \(userGameNumber[1]) \(userGameNumber[2])")
//        compareNumber(userGameNumber: userGameNumber, strikeCount: 0, ballCount: 0)
////        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
//        chance -= 1
//        if chance == 0 {
//            print("컴퓨터승리...!")
//        } else {
//            print("남은기회 : \(chance) 회")
//        }
//    }
//}

func playNumberBaseballGame(chance: Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    var chance: Int = chance
    while 0 < chance || strikeCount != 3 {
        let userGameNumber : Array<Int> = makeRandomThreeNumbers()
        print("임의의 수 : \(userGameNumber[0]) \(userGameNumber[1]) \(userGameNumber[2])")
        compareNumber(userGameNumber: userGameNumber, strikeCount: 0, ballCount: 0)
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        chance -= 1
        if chance == 0 {
            print("컴퓨터승리...!")
        } else {
            print("남은기회 : \(chance) 회")
        }
    }
}

playNumberBaseballGame(chance: 9)

