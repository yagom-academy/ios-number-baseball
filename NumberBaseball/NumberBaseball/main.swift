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

func checkIsThreeDigits(playerNumbers: [String]) -> [String] {
    var checkedIsThreeDigitsPlayerNumbers: [String] = []
    
    guard playerNumbers.count == 3 else {
        print(wrongInputErrorMessage)
        return []
    }
    
    checkedIsThreeDigitsPlayerNumbers = playerNumbers

    return checkedIsThreeDigitsPlayerNumbers
}

func checkIsInteger(playerNumbers: [String]) -> [Int] {
    var checkedIntegerPlayerNumbers: [Int] = []
    
    guard let fistInputNumber = Int(playerNumbers[0]),
          let secondInputNumber = Int(playerNumbers[1]),
          let thirdInputNumber = Int(playerNumbers[2]) else {
              print(wrongInputErrorMessage)
              return []
          }
    
    checkedIntegerPlayerNumbers = [fistInputNumber, secondInputNumber, thirdInputNumber]
    
    return checkedIntegerPlayerNumbers
}

func isConatinNumberOfRange(playerNumbers: [Int]) -> [Int] {
    let numberOfRange = 1...9
    var checkedConatinNumberOfRangePlayerNumbers: [Int] = []
    
    guard (numberOfRange).contains(playerNumbers[0]),
          (numberOfRange).contains(playerNumbers[1]),
          (numberOfRange).contains(playerNumbers[2]) else {
              print(wrongInputErrorMessage)
              return []
          }
    
    checkedConatinNumberOfRangePlayerNumbers = [playerNumbers[0], playerNumbers[1], playerNumbers[2]]
    
    return checkedConatinNumberOfRangePlayerNumbers
}

func checkIsUnique(playerNumbers: [Int]) -> [Int] {
    var checkedIsUniquePlayerNumbers: [Int] = []
    
    guard playerNumbers[0] != playerNumbers[1],
          playerNumbers[0] != playerNumbers[2],
          playerNumbers[1] != playerNumbers[2] else {
              print(wrongInputErrorMessage)
              return []
          }
    
    checkedIsUniquePlayerNumbers = [playerNumbers[0], playerNumbers[1], playerNumbers[2]]
    
    return checkedIsUniquePlayerNumbers
}

func checkInputAvailability() -> [Int] {
    var checkedPlayerNumbers: [Int] = []
    var checkedIntegerPlayerNumbers: [String] = []
    var isInputAvailability = false
    
    while isInputAvailability == false {
        guard let playerNumbers = inputPlayerNumbers(), playerNumbers.isEmpty == false else {
            print(wrongInputErrorMessage)
            continue
        }
    
        let playerInputNumbers: [String] = playerNumbers.components(separatedBy: " ")
        
        checkedIntegerPlayerNumbers = checkIsThreeDigits(playerNumbers: playerInputNumbers)
        
        guard checkedIntegerPlayerNumbers != [] else {
            continue
        }
        
        checkedPlayerNumbers = checkIsInteger(playerNumbers: checkedIntegerPlayerNumbers)
        
        guard checkedPlayerNumbers != [] else {
            continue
        }
        
        checkedPlayerNumbers = isConatinNumberOfRange(playerNumbers: checkedPlayerNumbers)
        
        guard checkedPlayerNumbers != [] else {
            continue
        }
        
        checkedPlayerNumbers = checkIsUnique(playerNumbers: checkedPlayerNumbers)
        
        guard checkedPlayerNumbers != [] else {
            continue
        }
        
        if checkedPlayerNumbers != [] {
            isInputAvailability = true
        }
    }
    return checkedPlayerNumbers
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

