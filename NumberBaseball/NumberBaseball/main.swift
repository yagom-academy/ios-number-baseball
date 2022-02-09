import Foundation

var computerRandomNumber: [Int] = []
var playerRanomNumber: [Int] = []
var remainingTime: Int = 9

func createThreeRamdomNumber() -> [Int] {
    var threeRandomNumber: Set<Int> = []
    
    while threeRandomNumber.count < 3 {
        threeRandomNumber.insert(Int.random(in: 1...9))
    }
    return Array(threeRandomNumber)
}

func compare(computerNumber: [Int], playerNumber: [Int]) -> [Int] {
    var strikeBallStack: [Int] = [0, 0]

    for index in 0..<3 {
        if computerRandomNumber[index] == playerNumber[index] {
            strikeBallStack[0] += 1
        } else if computerRandomNumber.contains(playerNumber[index]) {
            strikeBallStack[1] += 1
        }
    }

    return strikeBallStack
}

func startGame() {
    computerRandomNumber = createThreeRamdomNumber()

    repeat {
        playerRanomNumber = createThreeRamdomNumber()
        let strikeBallStack = compare(computerNumber: computerRandomNumber, playerNumber: playerRanomNumber)

        remainingTime -= 1

        print("임의의 수 : \(computerRandomNumber[0]) \(computerRandomNumber[1]) \(computerRandomNumber[2])")
        
        
        if strikeBallStack[0] == 3 {
            print("사용자 승리!")
            return
        } else if remainingTime == 0 {
            print("컴퓨터 승리...!")
        }
        print("\(strikeBallStack[0]) 스트라이크, \(strikeBallStack[1]) 볼")
        print("남은 기회 : \(remainingTime)")

    } while remainingTime != 0
}

startGame()

