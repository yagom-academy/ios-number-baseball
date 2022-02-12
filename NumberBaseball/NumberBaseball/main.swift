import Foundation


func makeNonDuplicatedNumbers() -> Set<Int> {
    var nonDuplicatedNumbers: Set<Int> = []
    
    while nonDuplicatedNumbers.count < 3 {
        let triedNonDuplicatedNumber = Int.random(in: 1...9)
        nonDuplicatedNumbers.insert(triedNonDuplicatedNumber)
    }
    return nonDuplicatedNumbers
}

func nonDuplicatedArray() -> Array<Int> {
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

func printResult(_ strikeCount: Int, _ ballCount: Int, _ remainedCount: Int) {
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    print("남은 기회 : \(remainedCount)")
}

func decideWinner(_ strikeCount: Int, _ remainedCount: Int) -> Int {
    var loopCondition = remainedCount
    
    if strikeCount == 3 {
        print("사용자 승리...!")
        selectGameMenu()
        loopCondition = 0
    } else if remainedCount == 0 {
        print("컴퓨터 승리...!")
        selectGameMenu()
    }
    return loopCondition
}

func tryBullsAndCows() {
    var answerNumbers: Array<Int> = []
    var randomNumbers: Array<Int> = []
    var remainedCount = 9
    
    answerNumbers = nonDuplicatedArray()
    while remainedCount != 0 {
        randomNumbers = checkDuplicatedNumbers()
        let (strikeCount, ballCount) = returnStrikeBallCount(answerNumbers, randomNumbers)
        remainedCount -= 1
        printResult(strikeCount, ballCount, remainedCount)
        remainedCount = decideWinner(strikeCount, remainedCount)
    }
}

func inputValue() -> String {
    guard let inputtedValue = readLine() else { return "" }
    let inputValue = inputtedValue
    return inputValue
}

func selectGameMenu() {
    print("1. 게임시작\n2. 게임종료\n원하는 기능을 선택해 주세요 : ", terminator: "")
    let selectedGameMenuNumber = inputValue()
    switch selectedGameMenuNumber {
    case "1":
        tryBullsAndCows()
    case "2":
        print("프로그램 종료")
        return
    default:
        print("입력이 잘못되었습니다")
        selectGameMenu()
    }
}

func inputTriedNumbers() -> [Int] {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.\n입력 : ", terminator: "")
    let inputTriedNumbers = inputValue()
    let convertedStringToArray = inputTriedNumbers.split(separator: " ")
    let convertElementToInt = convertedStringToArray.compactMap {Int($0)}
    return convertElementToInt
}

func checkZeroToTenInArray() -> [Int] {
    var inputTriedNumber = inputTriedNumbers()
    for index in 0..<inputTriedNumber.count{
        inputTriedNumber =  checkZeroToTen(inputTriedNumber: inputTriedNumber, index: index)
    }
    return inputTriedNumber
}

func checkZeroToTen(inputTriedNumber: Array<Int>, index: Int) -> [Int] {
    var digitToCheckNumber : Array<Int> = []
    
    digitToCheckNumber = inputTriedNumber
    if inputTriedNumber[index] > 9 {
        print("자리수를 초과하였습니다")
        digitToCheckNumber = inputTriedNumbers()
    }
    return digitToCheckNumber
}

func checkThreeDigitNumbers() -> [Int] {
    var arrayOfInputtedThreeDigit = checkZeroToTenInArray()
    while arrayOfInputtedThreeDigit.count != 3 {
        arrayOfInputtedThreeDigit = checkZeroToTenInArray()
    }
    return arrayOfInputtedThreeDigit
}

func convertArrayToSet() -> (Set<Int>, Array<Int>) {
    let arrayOfCheckedThreeDigit = checkThreeDigitNumbers()
    let setOfConvertedArray = Set(arrayOfCheckedThreeDigit)
    return (setOfConvertedArray, arrayOfCheckedThreeDigit)
}

func checkDuplicatedNumbers() -> Array<Int> {
    var (setOfConvertedArray, arrayOfCheckedThreeDigit) = convertArrayToSet()
    while setOfConvertedArray.count != 3 {
        print("숫자 3개를 구분하여 입력해주세요.\n중복문자를 허용하지 않습니다.")
        (setOfConvertedArray, arrayOfCheckedThreeDigit) = convertArrayToSet()
    }
    return arrayOfCheckedThreeDigit
}

selectGameMenu()
