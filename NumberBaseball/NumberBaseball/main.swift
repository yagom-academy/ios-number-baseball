import Foundation

func playGame() {
    let answer:[Int] = generateAnswer()
    var trialNumber:Int = 9

    while trialNumber > 0 {
        let userInput:[Int] = getUserInput()

        if compareAnswer(answer: answer, userInput: userInput) == 1 {
            didWin()
//            chooseOption()
            return
        }
        trialNumber -= 1
    }

    didWin()
//    chooseOption()
}

func generateAnswer() -> [Int] {
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


