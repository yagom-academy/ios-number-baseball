import Foundation

var chances: Int = 9
var inputNumbers = [String]()
var randomNumbers = [String]()

func menu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요", terminator: " : ")
}

func gameStart() {
    print("숫자 세개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력", terminator: " : ")
}

func makeRandomNumbers() {
    randomNumbers.append(String(Int.random(in: 1...9)))
}

while true {
    menu()
    let inputMenu: String = readLine()!
    
    if inputMenu == "1" {
        gameStart()
    } else if inputMenu == "2" {
        break
    } else {
        print("입력이 잘못되었습니다.")
    }
}
