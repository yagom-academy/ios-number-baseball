//
//  BaseballGame.swift
//  NumberBaseball
//
//  Created by Derrick kim on 2022/04/12.
//

import Foundation

protocol Runable {
    /// 프로그램 실행 함수
    ///
    /// Returns : 1
    func run()
}

final class BaseballGame: Runable {
    private var significantFigures: Int = 9
    private var randomNumbers: [Int] = []
    private var removedDuplicate: Set<Int> = []
    
    private var randomArray: [Int] = []

    private var strike : Int = 0
    private var ball : Int = 0
    
    func run() {
        createComputerNumber()
        
        repeat {
            strike = 0
            ball = 0
            significantFigures -= 1
            
            let info = "임의의 수 : "
            guard let result = info.input()
            else {
                return
            }
            
            randomArray = Array(removedDuplicate)
            
            for index in 0...2 {
                comparison(of: result, and: randomArray, at: index)
            }
            
            print("\(strike) 스트라이크, \(ball) 볼 ")
            print("남은 기회 : \(significantFigures)")
            
            if strike == 3 {
                print("사용자 승리!")
                break
            }
            else if significantFigures == 0 {
                print("컴퓨터 승리!")
                break
            }
        } while strike != 3 || significantFigures != 0
    }
}

extension BaseballGame {
    private func comparison (of data: [Int], and answer: [Int], at position:Int) {
        if data[position] == answer[position] {
            strike += 1
        }
        else if data.contains(answer[position]) {
            ball += 1
        }
    }
    
    private func createComputerNumber() {
        repeat {
            randomNumbers.append(Int.random(in: 1...10))
            removedDuplicate = Set(randomNumbers)
        } while removedDuplicate.count < 3
    }
}
