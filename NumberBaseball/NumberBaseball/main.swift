import Foundation

var chances: Int = 9
var randomNumbers = [String]()
var selectedNumbers = [String]()

func presentMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요", terminator: " : ")
}

func startGame() {
    print("숫자 세개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
}

func inputNumbers() {
    print("입력", terminator: " : ")

    selectedNumbers = readLine()!.components(separatedBy: " ")
    
    if selectedNumbers.count == 3 {
        
    } else {
        print("입력이 잘못되었습니다.")
    }
}


func makeRandomNumbers() {
    randomNumbers.append(String(Int.random(in: 1...9)))
    randomNumbers.append(String(Int.random(in: 1...9)))
    
    while randomNumbers[0] == randomNumbers[1] {
        randomNumbers[1] = String(Int.random(in: 1...9))
    }
    
    randomNumbers.append(String(Int.random(in: 1...9)))
    
    while randomNumbers[0] == randomNumbers[2] || randomNumbers[1] == randomNumbers[2] {
        randomNumbers[2] = String(Int.random(in: 1...9))
    }
    
}

func checkStrike() {
    randomNumbers
    selectedNumbers
}

//while true {
//    presentMenu()
//    let inputMenu: String = readLine()!
//
//    if inputMenu == "1" {
//        startGame()
//    } else if inputMenu == "2" {
//        break
//    } else {
//        print("입력이 잘못되었습니다.")
//    }
//}
