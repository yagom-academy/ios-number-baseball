import Foundation

func createThreeRandomNumbers() -> [Int] {
    var randomSet = Set<Int>()
    
    while randomSet.count < 3 {
        let number = Int.random(in: 1...9)
        randomSet.insert(number)
    }
     return Array(randomSet)
    
}

func compareAnswers(answerNumbers: [Int], userInputNumbers: [Int]) -> (strikes: Int,balls: Int) {
    var strike = 0
    var ball = 0
    
    for i in 0...2 {
        strike += answerNumbers[i] == userInputNumbers[i] ? 1 : 0
        
        ball += answerNumbers.contains(userInputNumbers[i])
            && answerNumbers[i] != userInputNumbers[i] ? 1 : 0
    }
   
    
    return (strike, ball)
}

func printGameStatus(strikes:Int, balls:Int, remainingChances: inout Int) {
    if strikes == 3 {print("사용자 승리!")}
    else if remainingChances == 0 {print("컴퓨터 승리!")}
    
    print("\(strikes) 스트라이크,\(balls) 볼")
    print("남은 기회 : \(remainingChances)")
    if strikes == 3 {remainingChances = 0}
}

func startStep1Game() {
    var remainingChances = 9
    let answers = createThreeRandomNumbers()
    
    while remainingChances > 0 {
        let userInputs = createThreeRandomNumbers()
        let strikeAndBall = compareAnswers(answerNumbers: answers, userInputNumbers: userInputs)
        print("임의의 수 : \(userInputs[0]) \(userInputs[1]) \(userInputs[2])")
        remainingChances -= 1

        printGameStatus(strikes: strikeAndBall.strikes,
                        balls: strikeAndBall.balls,
                        remainingChances: &remainingChances)
        
    }
    return
    
}

startStep1Game()

func receiveMenu() -> String {
    let input = readLine() ?? "3"
    return input
}

func printAndRunMenu(){
    print("1. 게임 시작 \n2. 게임 종료\n원하는 기능을 선택해주세요 :", terminator: "")
    var input = receiveMenu()
    
    while input != "1" && input != "2" {
        print("입력이 잘못되었습니다.")
        print("1. 게임 시작 \n2. 게임 종료\n원하는 기능을 선택해주세요 :", terminator: "")
        input = receiveMenu()
    }
    
    if input == "1" {
        startStep2Game()
    }
    
    return
}

func hasDuplicate(numbers:[Int]) -> Bool {
    let toSet = Set(numbers)
    return toSet.count != numbers.count
}

func startStep2Game() {
    let answerNumbers = createThreeRandomNumbers()
    var remainingChances = 9

    while remainingChances > 0  {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복숫자는 허용하지 않습니다.\n입력 : ",terminator: "")
        let inputArray = receiveValidInputNumbers()
        remainingChances -= 1
        let strikeAndBall = compareAnswers(answerNumbers: answerNumbers, userInputNumbers: inputArray)
        printGameStatus(strikes: strikeAndBall.strikes,
                        balls: strikeAndBall.balls,
                        remainingChances: &remainingChances)
    }
    
    return
    
}

func receiveValidInputNumbers() -> [Int] {
    
    var input = readLine() ?? " "
    var check = input.split(separator:" ").map {Int($0) ?? 0}
    while check.count != 3 || hasDuplicate(numbers: check) ||
            check.filter({$0 > 0 && $0 < 10}).count != 3 {
        print("입력이 잘못되었습니다.")
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복숫자는 허용하지 않습니다.\n입력 : ",terminator: "")
        input = readLine() ?? " "
        check = input.split(separator:" ").map {Int($0) ?? 0}
    }
    return check
}

printAndRunMenu()

