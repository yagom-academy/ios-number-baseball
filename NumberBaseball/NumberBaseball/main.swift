import Foundation

let wrongInputErrorMessage = "입력이 잘못되었습니다"

func createUniqueRandomNumbers() -> [Int] {
    var uniqueRandomNumbers: Set<Int> = []
    let numberOfDigits = 3
    let randomOfRange = 1...9
    
    while uniqueRandomNumbers.count < numberOfDigits {
        uniqueRandomNumbers.insert(Int.random(in: randomOfRange))
    }
    
    return Array(uniqueRandomNumbers)
}

func compare(computerNumber: [Int], playerNumber: [Int]) -> (strikeCount: Int, ballCount: Int) {
    var strikeCount = 0
    var ballCount = 0
    let iterationOfRange = 0..<3
    
    for index in iterationOfRange {
        if computerNumber[index] == playerNumber[index] {
            strikeCount += 1
        } else if computerNumber.contains(playerNumber[index]) {
            ballCount += 1
        }
    }
    
    return (strikeCount: strikeCount, ballCount: ballCount)
}

func printWinner(strikeCount: Int, remainingTime: Int) {
    if strikeCount == 3 {
        print("사용자 승리!")
    } else if remainingTime == 0 {
        print("컴퓨터 승리...!")
    }
}

func inputPlayerNumbers() -> String? {
    print("""
         숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
         중복 숫자는 허용하지 않습니다.
         """)
    print("입력 : ", terminator: "")
    
    let playerInputNumbers = readLine()
    
    return playerInputNumbers
}

func checkInputAvailability() -> [Int] {
    let numberOfRange = 1...9
    
    while true {
        guard let playerNumbers = inputPlayerNumbers(), playerNumbers.isEmpty == false else {
            print(wrongInputErrorMessage)
            continue
        }
        
        let playerInputNumbers: [String] = playerNumbers.components(separatedBy: " ")
        
        guard playerInputNumbers.count == 3 else {
            print(wrongInputErrorMessage)
            continue
        }
        
        guard let fistInputNumber = Int(playerInputNumbers[0]),
              let secondInputNumber = Int(playerInputNumbers[1]),
              let thirdInputNumber = Int(playerInputNumbers[2]) else {
                  print(wrongInputErrorMessage)
                  continue
              }
        
        guard (numberOfRange).contains(fistInputNumber),
              (numberOfRange).contains(secondInputNumber),
              (numberOfRange).contains(thirdInputNumber) else {
                  print(wrongInputErrorMessage)
                  continue
              }
        
        guard playerInputNumbers[0] != playerInputNumbers[1],
              playerInputNumbers[0] != playerInputNumbers[2],
              playerInputNumbers[1] != playerInputNumbers[2] else {
                  print(wrongInputErrorMessage)
                  continue
              }
        
        return [fistInputNumber, secondInputNumber, thirdInputNumber]
    }
}


func startProgram() {
    var isGameOver = false
    
    while isGameOver == false {
        print("1.게임시작\n2.게임종료\n원하는 기능을 선택해주세요 : ", terminator: "")
        
        let playerInput = readLine()
        
        switch playerInput {
        case "1":
            startGame()
        case "2":
            isGameOver = true
        default:
            print(wrongInputErrorMessage)
        }
    }
}

func startGame() {
    let computerNumbers: [Int] = createUniqueRandomNumbers()
    var remainingTime = 9
    
    repeat {
        let checkedPlayerInputNumbers: [Int] = checkInputAvailability()
        
        let gameResult = compare(computerNumber: computerNumbers, playerNumber: checkedPlayerInputNumbers)
        remainingTime -= 1
        
        printWinner(strikeCount: gameResult.strikeCount, remainingTime: remainingTime)
        
        print("\(gameResult.strikeCount) 스트라이크, \(gameResult.ballCount) 볼")
        print("남은 기회 : \(remainingTime)")
        
        if gameResult.strikeCount == 3 {
            return
        }
    } while remainingTime != .zero
}

startProgram()

