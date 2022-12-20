import Foundation

var chances: Int = 9
var userNumbers = [String]()
var computerNumbers = [String]()
var userWin: Bool = false

func makeRandomNumbers() -> [String] {
    var randomNumbers = [String]()
    
    while randomNumbers.count != 3 {
        let randomNumber = String(Int.random(in: 1...9))
        
        if !randomNumbers.contains(randomNumber) {
            randomNumbers.append(randomNumber)
        }
    }
    
    return randomNumbers
}

func makeUserNumbers() {
    userNumbers = makeRandomNumbers()
    print("임의의 수 : \(userNumbers.joined(separator: " "))")
    
}

func checkStrikeAndBall() {
    var ballCounter: Int = 0
    var strikeCounter: Int = 0
    chances -= 1
    
    for number in 0...2 {
        if computerNumbers[number] == userNumbers[number] {
            strikeCounter += 1
        } else {
            if computerNumbers.contains(userNumbers[number]) == true {
                ballCounter += 1
            }
        }
    }
    
    print("\(strikeCounter) 스트라이크, \(ballCounter) 볼")
    print("남은 기회 : \(chances)")
    
    if strikeCounter == 3 {
        userWin = true
    }
}

func printWinner() {
    if chances == 0 {
        print("컴퓨터 승리...!")
    }
    
    if  userWin == true {
        chances = -1
        print("사용자 승리...!")
    }
}

func startGame() {
    computerNumbers = makeRandomNumbers()
   
    repeat {
        makeUserNumbers()
        checkStrikeAndBall()
        printWinner()
    } while chances > 0
}

startGame()
