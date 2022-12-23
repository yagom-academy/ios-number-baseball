import Foundation

var chances: Int = 9
var userNumbers = [String]()
var computerNumbers = [String]()
var isUserWin: Bool = false
var hasError: Bool = false

func makeRandomNumbers() -> [String] {
    var randomNumbers = Set<String>()
    
    while randomNumbers.count != 3 {
        randomNumbers.insert(String(Int.random(in: 1...9)))
    }
    
    let randomNumberArray = Array(randomNumbers)
    
    return randomNumberArray
}

func receiveUserNumbers() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력", terminator: " : ")
    guard let inputtedUserNumbers = readLine() else {
        print("you entered nil")

        return
    }
    
    let checkingNumberRange = inputtedUserNumbers.components(separatedBy: " ").joined().range(of: "^[1-9]{3,3}$", options: .regularExpression) != nil
    
    if Set(inputtedUserNumbers.components(separatedBy: " ")).count != 3 || checkingNumberRange == false {
        print("입력이 잘못되었습니다.")
        hasError = true
        
        return
    }
    
    userNumbers = inputtedUserNumbers.components(separatedBy: " ")
}

func checkInputtedErrorNumber() {
    
}


func checkStrikeAndBall() {
    var ballCounter: Int = 0
    var strikeCounter: Int = 0
    chances -= 1
    
    for index in 0...2 {
        if computerNumbers[index] == userNumbers[index] {
            strikeCounter += 1
        } else if computerNumbers.contains(userNumbers[index]) == true {
            ballCounter += 1
        }
    }
    
    print("\(strikeCounter) 스트라이크, \(ballCounter) 볼")
    print("남은 기회 : \(chances)")
    
    if strikeCounter == 3 {
        isUserWin = true
    }
    
}

func printWinner() {
    if chances == 0 {
        print("컴퓨터 승리...!")
    }
    if isUserWin == true {
        chances = 0
        print("사용자 승리...!")
    }
}

func initializeData() {
    chances = 9
    userNumbers = [String]()
    computerNumbers = [String]()
    isUserWin = false
    hasError = false
}

func startGame() {
    computerNumbers = makeRandomNumbers()
    
    repeat {
        hasError = false
        receiveUserNumbers()
        if hasError == true {
            continue
        }
        checkStrikeAndBall()
        printWinner()
    } while chances > 0
}

func presentMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
}

func inputMenuNumber() -> String {
    print("원하는 기능을 선택해주세요", terminator: " : ")
    let inputtedMenuNumber = readLine() ?? ""
    
    return inputtedMenuNumber
}

func selectMenu(selectedMenuNumber: String) {
    switch selectedMenuNumber {
    case "1":
        startGame()
    case "2":
        print("12345")
    default:
        print("입력이 잘못되었습니다.")
    }
}

func startBaseBallGame() {
    var inputtedMenuNumber: String
    
    initializeData()
    presentMenu()
    inputtedMenuNumber = inputMenuNumber()
    selectMenu(selectedMenuNumber: inputtedMenuNumber)
    
    if inputtedMenuNumber != "2" {
        startBaseBallGame()
    }
    
}

startBaseBallGame()
