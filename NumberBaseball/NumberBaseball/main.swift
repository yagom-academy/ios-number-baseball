//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var chancesLeft: Int = 9
var randomNumberAmount = 3
var computerNumbers: [Int] = []
var userNumbers: [Int] = []
let randomNumberRange = 1...9

func extractRandomNumber(randomNumberAmount:Int = randomNumberAmount) -> [Int] {
    
    var randomNumbers: [Int] = []
    
    while randomNumbers.count != randomNumberAmount {
        randomNumbers.append(Int.random(in: randomNumberRange))
        randomNumbers = Array(Set(randomNumbers))
    }
    
    return randomNumbers
}

@discardableResult
func inputUserNumber() -> [Int] {
    
    var inputNumbers: [Int] = []
    
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    
    guard let userInput = readLine() , userInput != "" else{
        fatalError("입력이 잘못되었습니다.")
    }
    
    checkException(input:userInput) ? failUserInput() : nil
    
    let userinputs = userInput.split(separator: " ")
    
    inputNumbers = userinputs.compactMap{ Int($0) }
    
    return inputNumbers
}


func failUserInput(){
    print("입력이 잘못되었습니다.")
    inputUserNumber()
}


func countStrikeAndBall() -> (strike: Int, ball:Int) {
    var sameNumbers:[Int] = []
    
    for eachNumber in computerNumbers{
        userNumbers.contains(eachNumber) ? sameNumbers.append(eachNumber) : nil
    }
    let strikeCount:Int = sameNumbers.filter{ userNumbers.firstIndex(of: $0) == computerNumbers.firstIndex(of: $0) }.count
    let ballCount:Int = sameNumbers.count - strikeCount
    chancesLeft -= 1
    
    return (strike : strikeCount, ball: ballCount)
}

func winGame() {
    print("유저승리!!!")
    chooseMenu()
}

func startGame() {
    computerNumbers = extractRandomNumber()
    
    while chancesLeft > 0 {
        userNumbers = inputUserNumber()
        
        let strikeAndBall = countStrikeAndBall()
        
        print("\(strikeAndBall.strike) 스트라이크, \(strikeAndBall.ball) 볼")
        print("남은 기회 : \(chancesLeft)")
        strikeAndBall.strike == 3 ? winGame() : nil
        (chancesLeft == 0 && strikeAndBall.strike != 3) ? print("컴퓨터승리...!") : strikeAndBall.strike == 3 ? chancesLeft = 0 : nil
    }
}

func chooseMenu(){
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    guard let menuChosen = readLine() , menuChosen != "" else{
        print("입력이 잘못되었습니다.")
        return chooseMenu()
    }
    guard let menuChosenInt = Int(menuChosen) else{
        print("입력이 잘못되었습니다.")
        return chooseMenu()
    }
    if menuChosenInt == 1 {
        startGame()
    } else if menuChosenInt != 2 {
        print("입력이 잘못되었습니다")
        chooseMenu()
    }
}


func checkException(input inputUserNumber:String)->Bool{
    var hasError = false
    let userInputs = inputUserNumber.split(separator: " ")
    let inputfilterd = userInputs.compactMap{ Int($0) }
    
    
    if userInputs.count != 3{
        hasError = true
    }else if inputfilterd.count != userInputs.count{
        hasError = true
    }else if inputfilterd.filter({ randomNumberRange ~= $0 }).count != inputfilterd.count{
        hasError = true
    }else if Array(Set(inputfilterd)).count != inputfilterd.count{
        hasError = true
    }
    
    
    return hasError
}


chooseMenu()

