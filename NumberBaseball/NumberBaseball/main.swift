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

class BaseballGame {
  

    func extractRandomNumber(randomNumberAmount:Int = randomNumberAmount) -> [Int] {
        computerNumbers = []
        let randomNumberRange = 1...9

        while computerNumbers.count != randomNumberAmount {
            computerNumbers.append(Int.random(in: randomNumberRange))
            computerNumbers = Array(Set(computerNumbers))
        }
       
        return computerNumbers
    }
    
    func extractUserNumber(){
        
        userNumbers = []
        
        guard let userInput = readLine() , userInput != "" else{
            fatalError("입력이 잘못되었습니다.")
        }
        let userinputs = userInput.split(separator: " ")
        
        userNumbers = userinputs.compactMap{ Int($0) }
        
    }
    
    func countStrikeAndBall() -> (strike: Int, ball:Int) {
        var sameNumber:[Int] = []
        
        for eachNumber in computerNumbers{
            userNumbers.contains(eachNumber) ? sameNumber.append(eachNumber) : nil
        }
        let strikeCount:Int = sameNumber.filter{ userNumbers.firstIndex(of: $0) == computerNumbers.firstIndex(of: $0) }.count
        let ballCount:Int = sameNumber.count - strikeCount
        
        chancesLeft -= 1
        
        return (strike : strikeCount, ball: ballCount)
    }

    init() {
        extractRandomNumber()

        while chancesLeft > 0{
            let users = extractRandomNumber()
            let mappedUsers = users.map{ String($0) }
            let printUserNumber = mappedUsers.joined(separator: " ")
            let strikeAndBall = countStrikeAndBall()
            print("임의의 수 : \(printUserNumber)")
            print("\(strikeAndBall.strike) 스트라이크, \(strikeAndBall.ball) 볼")
            print("남은 기회 : \(chancesLeft)")
            (chancesLeft == 0 && strikeAndBall.strike != 3) ? print("컴퓨터승리...!") : strikeAndBall.strike == 3 ? chancesLeft = 0 : nil
        }
    }
}
class MenuHandler{
    enum menuNumbers:Int{
        case one = 1
        case two = 2
    }
    func chooseMenu(){
        print("1. 게임시작")
        print("2. 게임종료")
        print("원하는 기능을 선택해주세요 : ", terminator: "")
        guard let menuChosen = readLine() , menuChosen != "" else{
            fatalError("입력이 잘못되었습니다.")
        }
        guard let menuChosenInt = Int(menuChosen) else{
            fatalError("입력이 잘못되었습니다.")
        }
        
        switch menuNumbers (rawValue:menuChosenInt) {
        case .one : BaseballGame()
        case .two : break
        case .none : break
        }
    }
}



BaseballGame().extractUserNumber()









