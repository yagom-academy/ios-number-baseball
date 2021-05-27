//
//  NumberBaseball - main.swift
//  Created by luyan, hosinging.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let computerNumbers = [Int]()
var userNumbers = [Int]()
var gameCount: Int = 9

func userNumberGenerator(userNumberArray:[Int])->Set<Int>{
    if(userNumberArray.count == 0){
        while userNumberArray.count < 3 {
            userNumberArray.append(Int.random(in: 1...9))
            let userNumberSet = Set(userNumberArray)
        }
    }
    return userNumberSet
}

func compareComputerNumbers(to number:[Int]){
    for i in 0...computerNumbers.count{
        if computerNumbers[i] == number[i]{
            
        }
    }
}



while gameCount>0 {
    userNumberGenerator(userNumberSet: userNumbers)
    gameCount -= 1
}

// main
func gameStart(){
    // 컴퓨터가 제시할 변수 3개 저장
    
    // 남은 변수를 담아둘 초기값 9개 설정.
    
    // 1-9 사이의 임의의 정수를 생성하여 반환하는 함수.
        // 임의의 난수 출력 함수
    
    // 비교 함수
        // 결과 출력
        // 사용자 승리 판정
        // 남은 기회 감소
        // 남은 기회 출력 함수
        // 컴퓨터 승리 판정
}










