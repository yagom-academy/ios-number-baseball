
import Foundation

var trialRoundsCount : Int = 9
// var remainedTrialRounds : Int = trialRoundsCount - 1
var gameNumber : Array<Int> = makeRandomGameNumber()

func makeRandomGameNumber() -> Array<Int> {
    var randomGameNumbers : Set<Int> = []
    while randomGameNumbers.count < 3 {
        randomGameNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomGameNumbers)
}

func compareNumber(userGameNumber: Array<Int>) {
//    let userGameNumbers = makeRandomGameNumber()
    var strikeCount = 0
    var ballCount = 0
    for i in 0...2 {
        if gameNumber[i] == userGameNumber[i] { // 자리수가 같고, 숫자도 같으면 스트라이크카운트 + 1
            strikeCount += 1
        }
        if gameNumber[i] != userGameNumber[i] && gameNumber.contains(userGameNumber[i]) {
            ballCount += 1
        }  // 자리수와 숫자가 같지않고, 숫자를 포함하면 볼카운트 + 1
    }
    if strikeCount == 3 {
        print("사용자 승리...")
        return
    }
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
}

//게임시작 함수
//이번 스텝에서는 사용자 입력없이 임의의 수를 생성하여 게임을 진행하도록 구현합니다.

func playNumberBaseballGame () {
    let trialRoundsCount : Int = 9
    for _ in 1...9 {
        var userGameNumber : Array<Int> = makeRandomGameNumber()
        print(gameNumber)
        print("임의의 수 : \(userGameNumber[0]) \(userGameNumber[1]) \(userGameNumber[2])")
        compareNumber(userGameNumber: userGameNumber)
        let trialRoundsCount = trialRoundsCount - 1
    }
    if trialRoundsCount == 0 {
        print("남아있는 기회가 없습니다.")
        return
    }
}

playNumberBaseballGame()
