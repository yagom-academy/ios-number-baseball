import Foundation

func getRandomNumbers() -> [Int] {
    var randomNumbers = Set<Int>()
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 0...9))
    }
    /*
    var randomNumber = Array(randomNumbers)
    return randomNumber
     */
    return Array(randomNumbers)
}

func compareNumbers(_ computer: [Int], _ user: [Int]) -> (strike: Int, ball: Int) {
    var strike: Int = 0
    var ball: Int = 0
    /* 임시변수, 변수명으로 적절한지...*/
    var tempNumbers = [Int]()
    
    for index in 0...2 {
        if computer[index] == user[index] {
            strike += 1
        } else {
            tempNumbers.append(computer[index])
        }
    }
    
    for index in tempNumbers {
        if user.contains(index){
            ball += 1
        }
    }
    return (strike, ball)
}

func checkGameResult(_ computerNumbers: [Int], _ userNumbers: [Int], _ gameCountNumber: Int) -> Bool {
    if computerNumbers == userNumbers{
        print("사용자의 승리!")
        return true
    } else if gameCountNumber == 0{
        print("컴퓨터의 승리...!")
        return true
    } else{
        return false
    }
}

func startGame() {
    var gameCountNumber = 9
    let computerNumbers = getRandomNumbers()
    var userNumbers = [Int]()
    var eachCountResult: (strike: Int, ball: Int)
    var isGameFinished: Bool
    repeat {
        userNumbers = getRandomNumbers()
        print("임의의 수 : \(userNumbers)")
        
        eachCountResult = compareNumbers(computerNumbers, userNumbers)
        gameCountNumber -= 1

        isGameFinished = checkGameResult(computerNumbers, userNumbers, gameCountNumber)

        print("\(eachCountResult.strike) 스트라이크, \(eachCountResult.ball) 볼")
        print("남은 기회 : \(gameCountNumber)")
    } while !isGameFinished
}
    
startGame()
