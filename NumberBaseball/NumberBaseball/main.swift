import Foundation

func playGame() {
    let answer:[Int] = generateAnswer()
    var trialNo:Int = 9
    
    while trialNo > 0 {
        let userInput:[Int] = getUserInput()

        if compareAnswer(answer: answer, userInput: userInput) == 1 {
            didWin()
//            chooseOption()
            return
        }
        trialNo -= 1
    }

    didWin()
//    chooseOption()
}


func generateAnswer() -> [Int] {
    
}

func getUserInput() -> [Int] {
    
}

func compareAnswer(answer: [Int], userInput: [Int]) -> Int {
    
}

func didWin() {
    
}

//func chooseOption() {
//
//}

func checkError() {
    
}
