
import Foundation

var trialRoundsCount : Int = 9
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

// 게임실행함수에서 비교하는 함수를 호출했을 때, 스트라이크 개수가 3개면 게임을 멈춰야하는데 임의의수가 계속 생성된다.

func playNumberBaseballGame () {
 
    for _ in 1...9 {
        let userGameNumber : Array<Int> = makeRandomGameNumber()
        
        print("임의의 수 : \(userGameNumber[0]) \(userGameNumber[1]) \(userGameNumber[2])")
        compareNumber(userGameNumber: userGameNumber)
        trialRoundsCount -= 1
        
        if trialRoundsCount == 0 {
            print("컴퓨터승리...!")
        }else{
            print("남은기회 : \(trialRoundsCount) 회")
        }
    }
    
}

playNumberBaseballGame()

