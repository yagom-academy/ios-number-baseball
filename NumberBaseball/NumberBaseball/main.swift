import Foundation

enum InputError: Error {
    case invalidFuncNum
}

var winNumbers: Set<Int> = []
var funcInt = 0
var chance = 9
var winNumArr: [Int] = []
var userNumArr: [UInt] = []
var strikeNum = 0
var ballNum = 0

while winNumbers.count < 3 {
    winNumbers.insert(Int.random(in: 1...9))
}

winNumArr = Array(winNumbers)

func countStrike() {
    if winNumArr[0] == userNumArr[0] {
        strikeNum += 1
    }
    if winNumArr[1] == userNumArr[1] {
        strikeNum += 1
    }
    if winNumArr[2] == userNumArr[2] {
        strikeNum += 1
    }
}

func countBall() {
    if winNumArr[0] == userNumArr[1]  {
        ballNum += 1
    }
    if winNumArr[0] == userNumArr[2]  {
        ballNum += 1
    }
    if winNumArr[1] == userNumArr[0]  {
        ballNum += 1
    }
    if winNumArr[2] == userNumArr[0]  {
        ballNum += 1
    }
    if winNumArr[1] == userNumArr[2]  {
        ballNum += 1
    }
    if winNumArr[2] == userNumArr[1]  {
        ballNum += 1
    }
}

func menuInputOutput() throws {
    print("1. 게임시작\n2. 게임종료\n원하는 기능을 선택해주세요 : ", terminator: "")
    let funcStr = readLine()
    guard let funcString = funcStr else {
        throw InputError.invalidFuncNum
    }
    guard funcString == "1" || funcString == "2" else {
        throw InputError.invalidFuncNum
    }
    let funcIntOptional = Int(funcString)
    if let funcInt1 = funcIntOptional {
        funcInt = funcInt1
    }
}

func inputNumbers() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.\n입력 : ", terminator: "")
    guard let inputNum = readLine() else {
        print("입력이 잘못되었습니다")
        return inputNumbers()
    }
    let inputNumArr = inputNum.components(separatedBy: " ").map{ UInt($0) }
    
    for num in inputNumArr {
        if let number = num {
            userNumArr.append(number)
        }
    }
    
    guard userNumArr.count == 3 else {
        print("입력이 잘못되었습니다")
        userNumArr = []
        return inputNumbers()
    }
    
    if userNumArr[0] > 9 {
        print("입력이 잘못되었습니다")
        userNumArr = []
        return inputNumbers()
    } else if userNumArr[1] > 9 {
        print("입력이 잘못되었습니다")
        userNumArr = []
        return inputNumbers()
    } else if userNumArr[2] > 9 {
        print("입력이 잘못되었습니다")
        userNumArr = []
        return inputNumbers()
    }
    
    let userNumSet = Set(userNumArr)
    let userNumArray = Array(userNumSet)
    
    guard userNumArray.count == 3 else {
        print("입력이 잘못되었습니다")
        userNumArr = []
        return inputNumbers()
    }
}

func playGame() throws {
    for _ in 1...9 {
        inputNumbers()
        countStrike()
        if strikeNum == 3 {
            print("사용자 승리!")
            break
        }
        countBall()
        chance -= 1
        print("\(strikeNum) 스트라이크, \(ballNum) 볼")
        if chance != 0 {
            print("남은기회 : \(chance)")
        }
        else {
            print("컴퓨터 승리...!")
        }
        strikeNum = 0
        ballNum = 0
        userNumArr = []
    }
}

func startGame() throws{
    do {
        try menuInputOutput()
        try playGame()
    }
    catch InputError.invalidFuncNum {
        print("입력이 잘못되었습니다")
        try startGame()
    }
}

try startGame()
