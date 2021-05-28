var randomNumbers :[Int] = makeRandomNum()
var count : Int = 9
var isStrike = false;

func makeRandomNum() -> [Int] {
    var array = [Int]()
    
    while array.count <= 2 {
        let randomNumber = Int.random(in: 1...9)
        appendUniqueValue(to: &array, randomNumber)
    }
    
    return array
}

func appendUniqueValue(to: inout [Int], _ value:Int) -> Void {
    let isContain = to.contains(value)
    if isContain == false {
        to.append(value)
    }
}

func compareNumbers(_ f:Int, _ s:Int, _ t:Int){
    
    var strikeCount = 0;
    var ballCount = 0;
    
    if randomNumbers[0] == f {
        strikeCount += 1
    }
    else if randomNumbers.contains(f) {
        ballCount += 1
    }
    
    if randomNumbers[1] == s {
        strikeCount += 1
    }
    else if randomNumbers.contains(s) {
        ballCount += 1
    }
    
    if randomNumbers[2] == t {
        strikeCount += 1
    }
    else if randomNumbers.contains(t) {
        ballCount += 1
    }
    
    checkStrikeWithPrint(strikeCount, ballCount)
}

func checkStrikeWithPrint(_ strikeCount:Int, _ ballCount:Int){
    isStrike = strikeCount == 3
    
    if isStrike {
        print("사용자의 승리 ...!")
    }
    else {
        checkComputerIsWinner()
    }
    
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
}

func checkComputerIsWinner(){
    if count <= 1 {
        print("컴퓨터의 승리...!")
    }
}

func startGame(){
    while count > 0 , isStrike == false {
        
        let tempUserNumbers = makeRandomNum()
        
        print("임의의 수 : \(tempUserNumbers[0]) \(tempUserNumbers[1]) \(tempUserNumbers[2])")
        
        compareNumbers(tempUserNumbers[0], tempUserNumbers[1], tempUserNumbers[2])
        
        count -= 1
        
        print("남은 기회 : \(count)")
    }
}

startGame()
