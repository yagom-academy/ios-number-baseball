import Foundation

let answer:[Int] = generateRandomArray()
var trialNumber:Int = 9

//func playGame() {
//
//
//
//    return proceedGameRound()
//}

func proceedGameRound() {
    let userValue = generateRandomArray()
    trialNumber -= 1

    if answer == userValue {
        endGame()
    } else if trialNumber == 0 {
        endGame()
    }

    showResult(userValue: userValue)
    proceedGameRound()
}

func showResult(userValue: [Int]) {
    print("임의의 수 : \(userValue[0]), \(userValue[1]), \(userValue[2])")
    print("\(getStrikeCount()) 스트라이크, \(getBallCount()) 볼")
    print(trialNumber)
}

func generateRandomArray() -> [Int] {
    var numbers = [Int](1...9)
    var randomArray: [Int] = []

    for _ in 0...2 {
        let randomIndex = Int.random(in: 0...(numbers.count - 1))
        let randomNumber = numbers.remove(at: randomIndex)

        randomArray.append(randomNumber)
    }

    return randomArray
}

func getUserInput() -> [Int] {
    guard let input = readLine() else {
        return getUserInput()
    }

    if isError(input: input) == true {
        return getUserInput()
    } else {
        return toIntArray(input: input)
    }
}

func toIntArray(input: String) ->[Int] {
    var intArray: [Int] = []

    var i: Int = 0
    while i < 5 {
        let index = input.index(input.startIndex, offsetBy: i)
        let number: Int = input[index]
        intArray.append(number)
    }
}

func compareAnswer(answer: [Int], userInput: [Int]) -> Int {

}

func didWin() {

}

//func chooseOption() {
//
//}

func isError(input: String) -> Bool{
 return false
}


playGame()
