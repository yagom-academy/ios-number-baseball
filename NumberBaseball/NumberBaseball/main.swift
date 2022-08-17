
import Foundation

var trialRoundsCount : Int = 9
var remainedTrialRounds : Int = trialRoundsCount - 1
var computerGameNumber : Array<Int> = makeRandomGameNumber()
var userGameNumber : Array<Int> = makeRandomGameNumber()

// 임의의 수를 계속 생성해야한다. -> 세트를 계속 생성한다. -> 세트를 계속 배열로 바꿔준다.
// 게임넘버와 유저넘버가 일치하지않으면서(자리수가 일치하지않으면서)

func compareNumber() {
    var strikeCount = 0
    var ballCount = 0
    for i in 0...2 {
        if computerGameNumber[i] == userGameNumber[i] { // 자리수가 같고, 숫자도 같으면 스트라이크카운트 + 1
            strikeCount += 1
        }
        if computerGameNumber[i] != userGameNumber[i] && computerGameNumber.contains(userGameNumber[i]) {
            ballCount += 1
        }  // 자리수와 숫자가 같지않고, 숫자를 포함하면 볼카운트 + 1
    }
    if strikeCount == 3 {
        print("사용자 승리...")
        return
    }
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
}

func makeRandomGameNumber() -> Array<Int> {
    var randomGameNumbers : Set<Int> = []
    while randomGameNumbers.count < 3 {
        randomGameNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomGameNumbers)
}


func playNumberBaseballGame (round : Int) {
    var trialRoundsCount : Int = 9
    var remainedTrialRounds : Int = trialRoundsCount - round
    for _ in 1...9 {
        var UserGameNumber : Array<Int> = makeRandomGameNumber()
        print("임의의 수 : \(userGameNumber[0]) \(userGameNumber[1]) \(userGameNumber[2])")
        compareNumber()
    }
    if remainedTrialRounds == 0 {
        print("남아있는 기회가 없습니다.")
        return
    }
}

playNumberBaseballGame(round: 3)
