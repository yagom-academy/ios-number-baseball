
//func startGame() {
//    print("숫자 세개를 띄어쓰기로 구분하여 입력해주세요.")
//    print("중복 숫자는 허용하지 않습니다.")
//}
//
//func inputNumbers() {
//    print("입력", terminator: " : ")
//
//    selectedNumbers = readLine()!.components(separatedBy: " ")
//
//    if selectedNumbers.count == 3 {
//
//    } else {
//        print("입력이 잘못되었습니다.")
//    }
//}


import Foundation

var chances: Int = 9
var userNumbers = [String]()
var computerNumbers = [String]()
var userWin: Bool = false

func makeRandomNumbers() -> [String] {
    var randomNumbers = [String]()
    
    while randomNumbers.count != 3 {
        let randomNumber = String(Int.random(in: 1...9))
        
        if !randomNumbers.contains(randomNumber) {
            randomNumbers.append(randomNumber)
        }
    }
    
    return randomNumbers
}

func makeUserNumbers() {
    userNumbers = makeRandomNumbers()
    print("임의의 수 : \(userNumbers.joined(separator: " "))")
    
}

func checkStrikeAndBall() {
    var ballCounter: Int = 0
    var strikeCounter: Int = 0
    chances -= 1
    
    for number in 0...2 {
        if computerNumbers[number] == userNumbers[number] {
            strikeCounter += 1
        } else {
            if computerNumbers.contains(userNumbers[number]) == true {
                ballCounter += 1
            }
        }
    }
    
    print("\(strikeCounter) 스트라이크, \(ballCounter) 볼")
    print("남은 기회 : \(chances)")
    
    if strikeCounter == 3 {
        userWin = true
    }
}

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
        makeUserNumbers()
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
