
var trialRoundsCount : Array<Int> = [1,2,3,4,5,6,7,8,9]
var remainedTrialRounds: Int = trialRoundsCount.count - 1
var computerGameNumber: Set<Int> = makeRandomGameNumber()
let userGameNumber: Set<Int> = makeRandomGameNumber()


var GameNumbers: Array<Int>
for number in computerGameNumber {
    if number <= 9 {
        computerGameNumber.insert(number)
    }
print(number)
}


func makeRandomGameNumber() -> Set<Int> {
    var randomGameNumbers: Set<Int> = Set<Int>()
    while randomGameNumbers.count < 3 {
        randomGameNumbers.insert(Int.random(in: 1...9))
    }
    return randomGameNumbers
}

print(computerGameNumber, userGameNumber)



func findBallCount() {
    var ballCount = 0
    let computerGameNumber: Set<Int> = makeRandomGameNumber()
    let userGameNumber: Set<Int> = makeRandomGameNumber()
    let ballIntersection: Set<Int> = computerGameNumber.intersection(userGameNumber)
    if ballIntersection.count > 1 {
        ballCount += 1
    } else  {
        return
    } // 교집합개수가 곧 볼의 개수다.
}


func findStrikeNumber() {
    var strikeCount = 0
    //    arrayGameNumber = Array<computerGameNumber>
    for computerIndex in computerGameNumber{
        for userIndex in userGameNumber {
            if computerIndex == userIndex {
                strikeCount += 1
            }
        }
    }
}
//
//    print(userGameNumber)
////    print("임의의 수 : \(computerGameNumber)")
////    print("남은 기회 : \(remainedTrialRounds)")
//}
//
//
