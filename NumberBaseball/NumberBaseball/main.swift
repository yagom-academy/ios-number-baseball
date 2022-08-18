
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

// 값을 반환하는 함수에서 값을 출력하고자 할 때에는 값을 반환하는 함수 전체를 출력하면 된다! 예시
// 게임진행함수에서는 userGameNumber 라는
//print(compareNumber(userGameNumber: [2, 3, 4]))


// 볼, 스트라이크 값을 리턴해서 그 값을 출력하는 건 어떨까?
// 첫 번째 시도) Array 타입으로 반환하고, 반환된 값을 게임진행함수에서 변수에 저장함.
// 반환된 값 중에 [0] = strikeCount , [1] = ballCount 이므로 새로운 이름의 변수로 저장해서 게임진행함수에서 원하는 부분에 출력 가능하도록 함.

func playNumberBaseballGame(chance: Int) {
//        let userGameNumber : [Int] = makeRandomThreeNumbers()
    var chance: Int = chance
    //    let strikeAndBallCounts = compareNumber(userGameNumber: userGameNumber)
    //    let gameStrikeCount = strikeAndBallCounts[0]
    //    let gameBallCount = strikeAndBallCounts[1]
    //    while 0 != chance && gameStrikeCount != 3 {
    while 0 != chance {
        let userGameNumber : [Int] = makeRandomThreeNumbers()
        let strikeAndBallCounts = compareNumber(userGameNumber: userGameNumber)
        let gameStrikeCount = strikeAndBallCounts[0]
        let gameBallCount = strikeAndBallCounts[1]
        print(gameNumbers)
        //        compareNumber(userGameNumber: userGameNumber)
        print("임의의 수 : \(userGameNumber[0]) \(userGameNumber[1]) \(userGameNumber[2])")
        print("\(gameStrikeCount) 스트라이크, \(gameBallCount) 볼")
        chance -= 1
//        print("남은기회 : \(chance) 회")
        if gameStrikeCount == 3 {
            print("사용자 승리...!")
            return
        } else if chance > 0 {
            print("남은기회 : \(chance) 회")
        } else if chance == 0 {
            print("컴퓨터 승리...!")
        }
    }
}

// 출력은 잘 되지만, 새로이 생성된 userGameNumber 과 비교한 값의 스트라이크 개수, 볼의 개수가 나와야 하는데 웬걸,,,
// 다른 번호들과 비교되고 있는걸까? 인쇄한 컴퓨터번호 / 유저번호와 비교된 값의 스트라이크 개수와 볼 개수가 아닌 값이 나온다,,,
// -> 스트라이크와 볼 개수가 담긴 함수를 호출하여 변수로 지정하였고 / 게임진행함수에서도 비교하는함수를 호출해서 비교하는 함수의 호출이 이중으로 되어 값도 이중으로 된 것! -> 하지만 이중함수를 하나로 줄였음에도 비교할 대상(컴퓨터번호, 유저번호가 일치하지 않음ㅠ)
// 임의의 수를 생성하는 함수도 while문 밖과 안에서 두 번 써주고 있음을 발견해서, while문 안에 있는 함수만 남겨두고 그에 따라 필요한 변수들도 함수 안으로 가지고 들어왔음. -> 그러나, While 조건으로 걸었던 strikeCount를 scope에서 찾을 수 없는 오류가 발생하였음.
// strikeCount를 scope에서 찾을 수 없다니,,, 흑흑 음,, 사실 스트라이크 개수는 while 문 안에 있는 if 조건에서 걸러주고 있으니 굳이 쓰지 않아도 되는게 아닐까? 그냥 일단 지워보자! -> 비교하고 하는 값(컴퓨터번호와 사용자번호)에 따른 스트라이크 개수와 볼의 개수가 잘 출력되는 것이 보였음!

playNumberBaseballGame(chance: 9)

