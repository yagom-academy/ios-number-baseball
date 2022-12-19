import Foundation

// 전역변수로 resultNumbers, selectedNumbers Chances 생성
var chances: Int = 9
var resultNumbers = [String]()
var selectedNumbers = [String]()

//MARK: 입력받기
func inputNumbers() {
    print("임의의 수", terminator: " : ")
    selectedNumbers = readLine()!.components(separatedBy: " ")
    chances -= 1
}

//MARK: 랜덤숫자 만들기
func makeRandomNumbers() {
    var randomNumbers = [String]()
    randomNumbers.append(String(Int.random(in: 1...9)))
    randomNumbers.append(String(Int.random(in: 1...9)))
    
    while randomNumbers[0] == randomNumbers[1] {
        randomNumbers[1] = String(Int.random(in: 1...9))
    }
    
    randomNumbers.append(String(Int.random(in: 1...9)))
    
    while randomNumbers[0] == randomNumbers[2] || randomNumbers[1] == randomNumbers[2] {
        randomNumbers[2] = String(Int.random(in: 1...9))
    }
    
    resultNumbers = randomNumbers
}

//MARK: 스트라이크, 볼 확인하기
func checkStrike() {
    var ballCounter: Int = 0
    var strikeCounter: Int = 0
    
    for number in 0...2 {
        if resultNumbers[number] == selectedNumbers[number] {
            strikeCounter += 1
        }
        
        if resultNumbers.contains(selectedNumbers[number]) == true && resultNumbers[number] != selectedNumbers[number] {
            ballCounter += 1
        }
    }
    
    print("\(strikeCounter) 스트라이크, \(ballCounter) 볼")
    print("남은 기회 : \(chances)")
    print(resultNumbers)
    
    if strikeCounter == 3 {
        chances = -1
        print("사용자 승리...!")
    }
    
    if chances == 0 {
        print("컴퓨터 승리...!")
    }
}

//MARK: 게임 시작
func startGame(){
    makeRandomNumbers()
   
    while true {
        inputNumbers()
        checkStrike()
        if chances <= 0 {
            break
        }
    }
}

startGame()
