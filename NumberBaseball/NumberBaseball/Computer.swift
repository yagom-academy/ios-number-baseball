//
//  Computer.swift
//  NumberBaseball
//
//  Created by 이경민 on 2022/08/16.
//

import Foundation

private var answer: [Int] = []
private var tryCount: Int = 9
private var strikeCount: Int = 0
private var ballCount: Int = 0

func createNumber() -> [Int] {
	var number: Set<Int> = []
	
	while number.count < 3 {
		number.insert(Int.random(in: 1...9))
	}
	
	return Array(number)
}

// 비교하는 함수, 결과를 반환하는 함수
func compareNumbers(userNumbers: [Int]) {
    userNumbers.enumerated().forEach { index, value in
        validationNumber(to: index, inputNumber: value)
    }
}

func validationNumber(to index: Int, inputNumber: Int) {
    if answer.contains(inputNumber),
	   answer[index] == inputNumber {
        strikeCount += 1
    } else if answer.contains(inputNumber) {
        ballCount += 1
    }
}

func printGameResult() {
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    if strikeCount == 3 {
        print("사용자 승리!")
    }
}

func printTryResultCount() {
    tryCount -= 1
    
    if tryCount != 0 {
        print("남은 기회 : \(tryCount)")
    }
}

// 게임시작 함수
func gameStart() {
	answer = createNumber()
    debugPrint(answer)
	while tryCount > 0 {
		strikeCount = 0
		ballCount = 0
		
		let trial = createNumber()
		print("임의의 수 ", terminator: ": ")
		trial.forEach {
			print($0, terminator: " ")
		}
		print("")
		
        compareNumbers(userNumbers: trial)
        printGameResult()
		printTryResultCount()
	}
	print("컴퓨터 승리...!")
}
