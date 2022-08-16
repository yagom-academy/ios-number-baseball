//
//  Computer.swift
//  NumberBaseball
//
//  Created by 이경민 on 2022/08/16.
//

import Foundation

private var answer: [Int] = []
private var tryCount: Int = 9


func createNumber() -> [Int] {
	var number: Set<Int> = []
	
	while number.count < 3 {
		number.insert(Int.random(in: 1...9))
	}
	
	return Array(number)
}

// 비교하는 함수, 결과를 반환하는 함수

// 게임시작 함수
func gameStart() {
	answer = createNumber()
	
	while tryCount > 0 {
		let trial = createNumber()
		print("임의의 수 ", terminator: ": ")
		trial.forEach {
			print($0)
		}
	}
}
