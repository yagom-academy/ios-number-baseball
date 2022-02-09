import Foundation

var computerThreeRandomNumber: [Int] = []
var remainingTime: Int = 9

func createThreeRamdomNumber() -> [Int] {
    var threeRandomNumber: Set<Int> = []
    
    while threeRandomNumber.count < 3 {
        threeRandomNumber.insert(Int.random(in: 1...9))
    }
    return Array(threeRandomNumber)
}

func compare(userInputNumber: [Int]) {
    var strikeCount: Int = 0
    var ballCount: Int = 0

    for index in 0..<3 {
        if computerThreeRandomNumber[index] == userInputNumber[index] {
            strikeCount += 1
        } else if computerThreeRandomNumber.contains(userInputNumber[index]) {
            ballCount += 1
        }
    }
    
//    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
//    print("남은 기회 : \(remainingTime)")
    
    remainingTime -= 1
    
    if remainingTime == 0 {
        print("컴퓨터 승리!")
    }
}

