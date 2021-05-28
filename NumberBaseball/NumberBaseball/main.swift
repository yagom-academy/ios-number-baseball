import Foundation

func changeToInt(optional: Optional<String>) -> Int {
    if let string = optional, let integer = Int(string) {
        return integer
    } else {
        return 0
    }
}

func selectMenu() -> Bool {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해 주세요 : ", terminator: "")
    let select = readLine()
    let selectNumber = changeToInt(optional: select)
    
    if selectNumber == 1 {
        return true
    } else if selectNumber == 2 {
        return false
    } else {
        return selectMenu()
    }
}

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

func getUserNumbers() -> [Int] {
    let range: Set<Int> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    var arrayIntegers = [Int]()
    var userNumbers: Set<Int>
    /*
     코드리뷰 질문: arrayIntegers처럼 위에서 먼저 선언해주고 반복문 안에서 할당만 해주는 것이 좋은지
     */
    repeat {
        print("입력 : ", terminator: "")
        let inputNumber = readLine()
        let string: String = inputNumber ?? "this value is nil"
        arrayIntegers = string.components(separatedBy: " ").compactMap { Int($0) }
        userNumbers = Set(arrayIntegers)
    } while !userNumbers.isSubset(of: range) && userNumbers.count != 3
    
    return arrayIntegers
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
        userNumbers = getUserNumbers()
        print("임의의 수 : \(userNumbers)")
        
        eachCountResult = compareNumbers(computerNumbers, userNumbers)
        gameCountNumber -= 1

        isGameFinished = checkGameResult(computerNumbers, userNumbers, gameCountNumber)

        print("\(eachCountResult.strike) 스트라이크, \(eachCountResult.ball) 볼")
        print("남은 기회 : \(gameCountNumber)")
    } while !isGameFinished
}


while selectMenu(){

    startGame()

}
