var answer = [0] + Array(repeating: 0, count: 3)
var remainingChallengeOpportunity: Int = 9

func makeRandomNumber() -> [Int] {
    let first = Int.random(in: 1...9)
    
    var second = Int.random(in: 1...9)
    while second == first{
        second = Int.random(in: 1...9)
    }
    
    var third = Int.random(in: 1...9)
    while third == second || third == first{
        third = Int.random(in: 1...9)
    }
    
    let randomArray = [first, second, third]
    return randomArray
}

func judge(first: Int, second: Int, third: Int) -> (strikeCount: Int, ballCount: Int) {
    var strikeCount = 0
    var ballCount = 0
    for i in 1...3{
        for j in 1...3{
            if first == answer[i]{
                strikeCount += 1
            }
            else if first == answer[j]{
                ballCount += 1
            }
        }
    }
    return (strikeCount, ballCount)
}

func printResult(_ :(Int,Int)){
    // print("\(result.strikeCount) 스트라이크, \(result.ballCount) 볼")
}

func playGame(){
    while remainingChallengeOpportunity > 0{
        let userNumber = [0] + makeRandomNumber()
        let result = judge(first: userNumber[1], second: userNumber[2], third: userNumber[3])
        printResult(result)
    }
}

func startGame() {
    answer = [0] + makeRandomNumber()
    playGame()
    
}
