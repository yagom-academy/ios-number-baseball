import Foundation

var computerRandomNumbers: [Int] = []
var playerRandomNumbers: [Int] = []
var trialCount: Int = 9
var strike: Int = 0
var ball: Int = 0
var isGameOver: Bool = false
let digitNumber: Int = 3
var isProgramOver: Bool = false

func makeDeduplicatedRandomNumbers() -> [Int] {
    var deduplicatedNumbers: Set<Int> = []
    
    while deduplicatedNumbers.count < digitNumber {
        let randomNumber = Int.random(in: 1...9)
        deduplicatedNumbers.insert(randomNumber)
    }
    return Array(deduplicatedNumbers)
}

func makeComputerRandomNumber() {
    computerRandomNumbers = makeDeduplicatedRandomNumbers()
    print("(과제 확인용 출력) 컴퓨터 : \(computerRandomNumbers)")
}

func verifyInputValue() -> [Int] {
    print("""
        숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
        중복 숫자는 허용하지 않습니다.
        입력 :
        """, terminator: "")
    guard let inputValue: String = readLine(), inputValue.isEmpty == false else {
        print("입력이 잘못되었습니다")
        return []
    }
     
    let inputInformaion: [String] = inputValue.components(separatedBy: " ")
    
    guard inputInformaion.count == 3 else {
        print("입력이 잘못되었습니다")
        return []
    }
          
    guard let firstInputNumber: Int = Int(inputInformaion[0]),
          let secondInputNumber: Int = Int(inputInformaion[1]),
          let thirdInputNumber: Int = Int(inputInformaion[2]) else {
        print("입력이 잘못되었습니다")
        return []
    }
    return [firstInputNumber, secondInputNumber, thirdInputNumber]
}

func makePlayerRandomNumber(verifiedNumbers: [Int]) {
    playerRandomNumbers = verifiedNumbers
}

func printPlayerRandomNumber() {
    print("임의의 수 : ", terminator: "")
    for number in playerRandomNumbers {
        print("\(number) ", terminator: "")
    }
    print("\n", terminator: "")
}

func resetGlobalVariables() {
    trialCount -= 1
    strike = 0
    ball = 0
}

func checkSameNumbers(computerNumbers: [Int], with playerNumbers: [Int]) -> [Int] {
    let computerNumbersWithoutOrder: Set<Int> = Set(computerNumbers)
    let playerNumbersWithoutOrder: Set<Int> = Set(playerNumbers)
    let sameNumbers: [Int] = computerNumbersWithoutOrder.intersection(playerNumbersWithoutOrder).sorted()
    
    return sameNumbers
}

func findIndex(of number: Int, in numbers: [Int]) -> Int? {
    if let indexOfValue = numbers.firstIndex(of: number) {
        return indexOfValue
    }
    return nil
}

func checkSameOrder(computerNumbers: [Int], with playerNumbers: [Int]) {
    let sameNumbers: [Int] = checkSameNumbers(computerNumbers: computerNumbers, with: playerNumbers)
    
    for sameNumber in sameNumbers {
        
        let indexOfComputerNumber = findIndex(of: sameNumber, in: computerNumbers)
        let indexOfPlayerNumber = findIndex(of: sameNumber, in: playerNumbers)
        
        guard indexOfComputerNumber != nil, indexOfPlayerNumber != nil else {
            print("로직 에러 발생 - 동일하지 않은 숫자의 index를 비교하고 있습니다")
            return
        }
        
        if indexOfComputerNumber == indexOfPlayerNumber {
            strike += 1
            continue
        }
        ball += 1
        
    }
}

func compareNumbers(computerNumbers: [Int], with playerNumbers: [Int]) {
    let sameNumbers: [Int] = checkSameNumbers(computerNumbers: computerNumbers, with: playerNumbers)
    
    if sameNumbers.isEmpty {
        return
    } else {
        checkSameOrder(computerNumbers: computerNumbers, with: playerNumbers)
    }
}

func printCompareResult() {
    print("\(strike) 스트라이크, \(ball) 볼")
}

func printTrialCount() {
    print("남은 기회 : \(trialCount)")
}

func checkWinner() {
    if strike == digitNumber {
        print("사용자 승리!")
        isGameOver = true
    } else if trialCount == 0 {
        print("컴퓨터 승리...!")
        isGameOver = true
    } else {
        isGameOver = false
    }
}

func startGame() {
    makeComputerRandomNumber()
    
    while isGameOver == false {
        makePlayerRandomNumber(verifiedNumbers: verifyInputValue())
        printPlayerRandomNumber()
        resetGlobalVariables()
        compareNumbers(computerNumbers: computerRandomNumbers, with: playerRandomNumbers)
        printCompareResult()
        printTrialCount()
        checkWinner()
    }
}

func startProgram() {
    while isProgramOver == false {
        print("1. 게임 시작\n2. 게임 종료\n원하는 기능을 선택해주세요 : ", terminator: "")
        let programMenu = readLine()
        
        switch programMenu {
            case "1":
            startGame()
            case "2":
            isProgramOver = true
            default:
            print("입력이 잘못 되었습니다.")
        }
    }
}

startProgram()
