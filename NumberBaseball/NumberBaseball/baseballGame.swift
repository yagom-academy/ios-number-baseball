import Foundation

//let computerNumberArray: [Int]
var numberOfTry = 9

func makeRandomNumberArray() -> [Int] {
    var setNumber: Set<Int> = Set<Int>()
    while setNumber.count != 3 {
        setNumber.insert(Int.random(in: 1...9))
    }
    return Array(setNumber)
}

func countBallStrike(computerArray: [Int], numberArray: [Int]) -> (Int, Int) {
    var countStrike = 0
    var countBall = 0
    for index in 0..<3 {
        guard let findIndex = numberArray.firstIndex(of: computerArray[index]) else {
            continue
        }
        if index == findIndex {
            countStrike += 1
        } else {
            countBall += 1
        }
    }
    return (countStrike, countBall)
}

//computerNumberArray = makeRandomNumberArray()

//while numberOfTry != 0 {
//    let randomNumberArray: [Int]
//    let result: (Int, Int)
//    randomNumberArray = makeRandomNumberArray()
//    result = countBallStrike(computerArray: computerNumberArray, numberArray: randomNumberArray)
//    let countStrike = result.0
//    let countBall = result.1
//    print("임의의 수 : ", terminator: "")
//    for number in randomNumberArray {
//        print(number, terminator: " ")
//    }
//    print("\n\(countStrike) 스트라이크, \(countBall) 볼")
//    if countStrike == 3 {
//        break
//    }
//    numberOfTry -= 1
//    print("남은 기회 \(numberOfTry)")
//}

func startGame() {
    while true {
        selectMenu()
    }
}

func selectMenu() {
    print("1. 게임시작\n2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")

    if let userInput = readLine() {
        if userInput == "1" {
            startGame()
        } else if userInput == "2" {
            endGame()
        } else {
            inputErrorPrint()
        }
    }
}

func endGame() {
    print("게임 종료")
}

func inputErrorPrint() {
    print("입력이 잘못 되었습니다.")
}

func inputNumber() -> [String] {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    var stringNumberArray: [String] = ["","",""]
    if let inputValue = readLine() {
        if inputValue != "" {
            stringNumberArray = inputValue.split(separator: " ").map{String($0)}
            print(stringNumberArray)
        }
    }
    return stringNumberArray
}

func isValidNumberArray(stringNumberArray: [String]) -> Bool {
    if stringNumberArray.count != 3 {
        return false
    }
    for stringNumber in stringNumberArray {
        guard let intNumber = Int(stringNumber) else {
            return false
        }
        if intNumber < 1 || intNumber > 9 {
            return false
        }
    }
    return true
}

func removeBlank(inputString: String) -> String {
    return inputString.split(separator: " ").joined(separator: "")
}

//selectMenu()
