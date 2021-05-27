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
    var randomArray: [Int] = []
    var arrayCount = 0
    
    while arrayCount < 3 {
        var randomNo = Int.random(in: 1...9)
        
        if randomArray.contains(randomNo) == false {
            randomArray.append(randomNo)
        }
        
        arrayCount = randomArray.count
    }
    return randomArray
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
