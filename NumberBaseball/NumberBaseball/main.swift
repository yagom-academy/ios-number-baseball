//
//  NumberBaseball - main.swift
//  Created by redmango & dasanKim.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var randomInt = [Int]()
var count: Int

func creatRandomNumber() -> [Int] {
    var outputRandomInput = [Int]()
    
    for i in 1...3 {
        outputRandomInput[i] = Int.random(in: 1...9)
        // set 사용?
    }
}














































/*
var computerRandomNumbers = [Int]()//[Int]()
var userNumber = [5, 8, 6]//[Int]()



print(computerRandomNumbers)

func createRandomThreeNumbers(numberArray: [Int]) -> [Int] {
    
    while numberArray.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !numberArray.contains(randomNumber) {
            numberArray.append(randomNumber)
        }
    }
    
    return numberArray
}
 */


/*
var numberAttempts = 9
var count = 0
var strikeCounter = 0
var ballCounter = 0

repeat {
    if strikeCounter < 3 {
        // 유저 넘버 입력
        strikeCounter = 0
        ballCounter = 0
        inputNumber()
        test()
    }
    numberAttempts -= 1
    
} while numberAttempts > 0

func test() {
    for index in 0...computerNumber.count-1 {
        if userNumber.contains(computerNumber[index]) && userNumber[index] == computerNumber[index] {
            strikeCounter += 1
        } else if userNumber.contains(computerNumber[index]) {
            ballCounter += 1
        }
        //userNumber.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Int) throws -> Result##(Result, Int) throws -> Result##(_ partialResult: Result, Int) throws -> Result#>)
    }
    print(computerNumber)
    print(userNumber)
    print("\(strikeCounter) 스트라이크 \(ballCounter) 볼")
    
}

func inputNumber() {
    var randomNumbers = [Int]()

    while randomNumbers.count < 3 {
        var randomNumber = Int.random(in: 1...9)
        if !randomNumbers.contains(randomNumber) {
            randomNumbers.append(randomNumber)
        }
    }
    
    userNumber = randomNumbers
}


*/
