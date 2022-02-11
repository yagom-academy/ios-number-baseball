import Foundation


func makeNonDuplicatedNumbers() -> Set<Int> {
    var nonDuplicatedNumbers: Set<Int> = []
    
    while nonDuplicatedNumbers.count < 3 {
        let triedNonDuplicatedNumber = Int.random(in: 1...9)
        nonDuplicatedNumbers.insert(triedNonDuplicatedNumber)
    }
    return nonDuplicatedNumbers
}

func convertSetToArray() -> Array<Int> {
    let nonDuplicatedNumbers = makeNonDuplicatedNumbers()
    let sortedNumbers = Array(nonDuplicatedNumbers)
    return sortedNumbers
}

func increaseStrikeBallCount(_ answerNumbers: Array<Int>, _ randomNumbers: Array<Int>, _ strikeCount: Int, _ ballCount: Int, _ index: Int) -> (Int, Int) {
    var increaseStrikeCount = strikeCount
    var increaseBallCount = ballCount
    
    if answerNumbers[index] == randomNumbers[index] {
        increaseStrikeCount += 1
    } else if answerNumbers.contains(randomNumbers[index]) {
        increaseBallCount += 1
    }
    return (increaseStrikeCount, increaseBallCount)
}

func returnStrikeBallCount(_ answerNumbers: Array<Int>, _ randomNumbers: Array<Int>) -> (Int, Int) {
    var strikeCount = 0
    var ballCount = 0
    
    for index in 0...2 {
        (strikeCount, ballCount) = increaseStrikeBallCount(answerNumbers, randomNumbers, strikeCount, ballCount, index)
    }
    return (strikeCount, ballCount)
}

func printResult(_ strikeCount: Int, _ ballCount: Int, _ remainCount: Int) {
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    print("남은 기회 : \(remainCount)")
}

func decideWinner(_ strikeCount: Int, _ remainCount: Int) -> Int {
    var exitWhile = remainCount
    
    if strikeCount == 3 {
        print("사용자 승리...!")
        exitWhile = 0
    } else if remainCount == 0 {
        print("컴퓨터 승리...!")
    }
    return exitWhile
}

func startGame() {
    var answerNumbers: Array<Int> = []
    var randomNumbers: Array<Int> = []
    var remainCount = 1000
    
    answerNumbers = convertSetToArray()
    while remainCount != 0 {
        randomNumbers = checkDuplicatedUserNumbers()
        let (strikeCount, ballCount) = returnStrikeBallCount(answerNumbers, randomNumbers)
        remainCount -= 1
        printResult(strikeCount, ballCount, remainCount)
        remainCount = decideWinner(strikeCount, remainCount)
    }
}



func selectGameMenu() {
        print("1. 게임시작\n2. 게임종료\n원하는 기능을 선택해 주세요. : ", terminator: "")
        guard let selectedGameMenuNumber = readLine() else { return }
        
        switch selectedGameMenuNumber {
        case "1":
            startGame()
        case "2":
            print("프로그램 종료")
            return
        default:
            print("입력이 잘못되었습니다.")
            selectGameMenu()
    }
}

func inputUserNumbers() -> [Int] {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.\n입력 : ", terminator: "")
    guard let inputUserNumbers = readLine() else { return [] }
    let pushInArray = inputUserNumbers.split(separator: " ")
    var userNumbers: Array<Int> = []
    
    for index in 0..<pushInArray.count {
        guard let convertStringToInt = Int(pushInArray[index]) else { return [] }
        userNumbers.append(convertStringToInt)
    }
    return userNumbers
}


func countArrayIndex() -> [Int] {
    var countArrayIndex = inputUserNumbers()
        
    while countArrayIndex.count != 3 {
        countArrayIndex = inputUserNumbers()
    }
    return countArrayIndex
}

func convertArrayToSet() -> (Set<Int>, Array<Int>) {
    let testArray = countArrayIndex()
    let testSet = Set(testArray)
    
    return (testSet, testArray)
}


func checkDuplicatedUserNumbers() -> Array<Int> {
    var (convertedArrayToSet, nonConvertedArray) = convertArrayToSet()
    
    while convertedArrayToSet.count != 3 {
        print("숫자 3개를 구분하여 입력해주세요.\n중복문자를 허용하지 않습니다.")
        (convertedArrayToSet, nonConvertedArray) = convertArrayToSet()
    }
    return nonConvertedArray
}


selectGameMenu()

