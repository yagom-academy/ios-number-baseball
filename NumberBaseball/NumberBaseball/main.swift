import Foundation

func selectMenu() -> Bool {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해 주세요 : ", terminator: "")
    let menuNumber = readLine()
    guard let string = menuNumber, let menuNumber = Int(string) else {
        print("입력이 잘못되었습니다")
        return selectMenu()
    }
    switch menuNumber {
    case 1:
        return true
    case 2:
        return false
    default:
        print("입력이 잘못되었습니다")
        return selectMenu()
    }
}

func makeRandomNumbers() -> [Int] {
    var randomNumbers = Set<Int>()
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomNumbers)
}

func userInput() -> [Int] {
    let range: Set<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    var arrayIntegers = [Int]()
    var userNumbers: Set<Int>
    /*
     코드리뷰 질문: arrayIntegers처럼 위에서 먼저 선언해주고 반복문 안에서 할당만 해주는 것이 좋은지
     */
    repeat {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
        print("중복 숫자는 허용하지 않습니다.")
        print("입력 : ", terminator: "")
        let inputNumber = readLine()
        let string: String = inputNumber ?? "입력이 잘못되었습니다."
        arrayIntegers = string.components(separatedBy: " ").compactMap { Int($0) }
        userNumbers = Set(arrayIntegers)
        if !userNumbers.isSubset(of: range) || userNumbers.count != 3 {
            print("입력이 잘못되었습니다.")
        }
    } while !userNumbers.isSubset(of: range) || userNumbers.count != 3
    print(arrayIntegers)
    return arrayIntegers
}

func compareNumbers(computer: [Int], user: [Int]) -> (strike: Int, ball: Int) {
    var strike: Int = 0
    var ball = (Set(computer).intersection(Set(user))).count
    for index in 0...2 {
        if computer[index] == user[index] {
            strike += 1
        }
    }
    ball = ball - strike
    return (strike, ball)
}

func isThreeStrike(computerNumbers: [Int], userNumbers: [Int]) -> Bool {
    if computerNumbers == userNumbers {
        return true
    } else {
        return false
    }
}

func checkGameResult(computer: [Int], user: [Int], leftRound: Int) -> Bool {
    if isThreeStrike(computerNumbers: computer, userNumbers: user) {
        print("사용자의 승리!")
        return true
    } else if leftRound == 0 {
        print("컴퓨터의 승리...!")
        return true
    } else {
        return false
    }
}

func startGame() {
    var leftRound = 9
    let computerNumbers = makeRandomNumbers()
    var userNumbers = [Int]()
    var eachCountResult: (strike: Int, ball: Int)
    var isGameFinished: Bool
    repeat {
        userNumbers = userInput()
        print("임의의 수 : \(userNumbers)")
        
        eachCountResult = compareNumbers(computer: computerNumbers, user: userNumbers)
        leftRound -= 1

        isGameFinished = checkGameResult(computer: computerNumbers, user: userNumbers, leftRound: leftRound)

        print("\(eachCountResult.strike) 스트라이크, \(eachCountResult.ball) 볼")
        print("남은 기회 : \(leftRound)")
    } while !isGameFinished
}

while selectMenu() {
    startGame()
}
