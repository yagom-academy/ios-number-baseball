//
//  NumberBaseball - main.swift
//  Created by luyan, hosinging.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


var userNumbers = [Int]()


func generateRandomNumbers() -> [Int] {
    var randomNumbers: Set = Set<Int>()
    while randomNumbers.count < 3 {
        randomNumbers.insert(Int.random(in: 1...9))
    }
    return Array(randomNumbers)
}

func printNumbers(_ numbers: [Int]){
    print("임의의 수 : \(numbers.map{String($0)}.joined(separator: " "))")
}


func compareComputerNumbers(to number:[Int]){
    for i in 0...computerNumbers.count{
        if computerNumbers[i] == number[i]{
            
        }
    }
}

// main
func gameStart(){
    // 컴퓨터가 제시할 변수 3개 저장
    let computerNumbers = generateRandomNumbers()
    // 남은 변수를 담아둘 초기값 9개 설정.
    var gameCount: Int = 9
    while gameCount > 0 {
        // 1-9 사이의 임의의 정수를 생성하여 반환하는 함수.
        let userNumbers = generateRandomNumbers()
        // 임의의 난수 출력 함수
        //    printNumbers(<#T##numbers: [Int]##[Int]#>)
        
        // 비교 함수
        // 결과 출력
        // 사용자 승리 판정
        // 남은 기회 감소
        // 남은 기회 출력 함수
    }
    
    // 컴퓨터 승리 판정
}










