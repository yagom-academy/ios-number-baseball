import Foundation

func createUniqueRadnomNumbers() -> [Int] {
    var uniqueRandomNumbers: Set<Int> = []
    let numberOfDigits: Int = 3
    let randomOfRange: ClosedRange<Int> = 1...9
    
    while uniqueRandomNumbers.count < numberOfDigits {
        uniqueRandomNumbers.insert(Int.random(in: randomOfRange))
    }
    return Array(uniqueRandomNumbers)
}

func compare(computerNumber: [Int], playerNumber: [Int]) -> (strikeCount: Int, ballCount: Int) {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    let iterationOfRange: Range<Int> = 0..<3
    
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
    let numberOfRange: ClosedRange<Int> = 1...9
    
    while true {
        guard let playerNumbers = inputPlayerNumbers(), playerNumbers.isEmpty == false else {
            print("입력이 잘못되었습니다")
            continue
        }
        
        let playerInputNumberList: [String] = playerNumbers.components(separatedBy: " ")
        
        guard playerInputNumberList.count == 3 else {
            print("입력이 잘못되었습니다")
            continue
        }
        
        guard let fistInputNumber: Int = Int(playerInputNumberList[0]),
              let secondInputNumber: Int = Int(playerInputNumberList[1]),
              let thirdInputNumber: Int = Int(playerInputNumberList[2]) else {
                  print("입력이 잘못되었습니다")
                  continue
              }
        
        guard (numberOfRange).contains(fistInputNumber),
              (numberOfRange).contains(secondInputNumber),
              (numberOfRange).contains(thirdInputNumber) else {
                  print("입력이 잘못되었습니다")
                  continue
              }
        
        guard playerInputNumberList[0] != playerInputNumberList[1],
              playerInputNumberList[0] != playerInputNumberList[2],
              playerInputNumberList[1] != playerInputNumberList[2] else {
                  print("입력이 잘못되었습니다")
                  continue
              }
        
        return [fistInputNumber, secondInputNumber, thirdInputNumber]
    }
}


func startProgram() {
    var isgameOver: Bool = false
    
    while isgameOver == false {
        print("1.게임시작\n2.게임종료\n원하는 기능을 선택해주세요 : ", terminator: "")
        
        let playerInput = readLine()
        
        switch playerInput {
        case "1":
            startGame()
        case "2":
            isgameOver = true
        default:
            print("입력이 잘못되었습니다")
        }
    }
}

func startGame() {
    let computerNumbers: [Int] = createUniqueRadnomNumbers()
    var remainingTime: Int = 9
    
    repeat {
        let checkedPlayerInputNumberList: [Int] = checkInputAvailability()
        
        let strikeBallOfResult = compare(computerNumber: computerNumbers, playerNumber: checkedPlayerInputNumberList)
        remainingTime -= 1
        
        printWinner(strikeCount: strikeBallOfResult.strikeCount, remainingTime: remainingTime)
        
        print("\(strikeBallOfResult.strikeCount) 스트라이크, \(strikeBallOfResult.ballCount) 볼")
        print("남은 기회 : \(remainingTime)")
        
        if strikeBallOfResult.strikeCount == 3 {
            return
        }
        
    } while remainingTime != .zero
}

startProgram()

