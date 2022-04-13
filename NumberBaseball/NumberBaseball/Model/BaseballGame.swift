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

    private var strikeCount : Int = 0
    private var ballCount : Int = 0
    
    func run() {
        create(to: &randomNumbers, for: &removedDuplicate)
        
        repeat {
            strikeCount = 0
            ballCount = 0
            significantFigures -= 1
            
            let numbers: String = "임의의 수 : "
            guard let result = numbers.input() else {
                return
            }
            
            print(removedDuplicate)
            
            randomArray = Array(removedDuplicate)
            
            for index in 0...2 {
                comparison(of: result, and: randomArray, at: index)
            }
            
            print("\(strikeCount) 스트라이크, \(ballCount) 볼 ")
            print("남은 기회 : \(significantFigures)")
            
            if strikeCount == 3 {
                print("사용자 승리!")
                break
            } else if significantFigures == 0 {
                print("컴퓨터 승리!")
                break
            }
        } while strikeCount != 3 || significantFigures != 0
    }
}

extension BaseballGame {
    /// 컴퓨터와 사용자의 값을 비교하는 함수
    private func comparison (of computer: [Int], and user: [Int], at position:Int) {
        if computer[position] == user[position] {
            strikeCount += 1
        } else if computer.contains(user[position]) {
            ballCount += 1
        }
    }
    
    /// 랜덤 숫자 3개 생성하여 배열에 저장 함수
    private func create(to numbers: inout [Int], for numberSet: inout Set<Int>) {
        repeat {
            numbers.append(Int.random(in: 1...10))
            numberSet = Set(numbers)
        } while numberSet.count < 3
    }
    
    func startGame() {
        print("1. 게임시작\n2. 게임종료")
        let menu = "원하는 기능을 선택해주세요. : "
        guard let result = menu.input()
        else {
            return print("입력이 잘못되었습니다.")
        }
        
        switch result {
        case "1" :
            run()
            
        case "2" :
            break
            
        default :
            print("입력이 잘못되었습니다.")
        }
    }
}
