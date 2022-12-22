import Foundation

var chances: Int = 9
var userNumbers = [String]()
var computerNumbers = [String]()
var userWin: Bool = false
var checkingError: Bool = false

//MARK: 랜덤 숫자 만들기
func makeRandomNumbers() -> [String] {
    var randomNumbers = [String]()
    
    while Set(randomNumbers).count != 3 {
        randomNumbers.append(String(Int.random(in: 1...9)))
    }
    
    return randomNumbers
}

// MARK: 숫자 입력받기
func inputUserNumbers() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력", terminator: " : ")
    
    guard let inputtedUserNumber = readLine() else {
        print("you entered nil")
        
        return
    }
    
    let inputNumbers = inputtedUserNumber.components(separatedBy: " ")
    let checkingNumberRange = inputNumbers.joined().range(of: "^[1-9]{3,3}$", options: .regularExpression) != nil
    
    if Set(inputNumbers).count != 3 || checkingNumberRange == false {
        print("입력이 잘못되었습니다.")
        checkingError = true
        
        return
    }
    
    userNumbers = inputNumbers
}

//MARK: 스트라이크 볼 확인하기
func checkStrikeAndBall() {
    var ballCounter: Int = 0
    var strikeCounter: Int = 0
    chances -= 1
    
    for number in 0...2 {
        if computerNumbers[number] == userNumbers[number] {
            strikeCounter += 1
        } else if computerNumbers.contains(userNumbers[number]) == true {
            ballCounter += 1
        }
    }
    
    print("\(strikeCounter) 스트라이크, \(ballCounter) 볼")
    print("남은 기회 : \(chances)")
    
    if strikeCounter == 3 {
        userWin = true
    }
}

// MARK: 승리자 프린트
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
        checkingError = false
        inputUserNumbers()
        if checkingError == true {
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
    let inputedMenuNumber = readLine() ?? ""
    
    return inputedMenuNumber
}

func selectMenu(selectedMenuNunber: String) {
    switch selectedMenuNunber {
    case "1":
        startGame()
    case "2":
        break
    default:
        print("입력이 잘못되었습니다.")
    }
}

func startBaseBallGame() {
    var inputedMenuNumber: String
    
    repeat {
        presentMenu()
        inputedMenuNumber = inputMenuNumber()
        selectMenu(selectedMenuNunber: inputedMenuNumber)
    } while inputedMenuNumber != "2"
}

startBaseBallGame()

