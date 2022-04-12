//
//  BaseballGame.swift
//  NumberBaseball
//
//  Created by Derrick kim on 2022/04/12.
//

import Foundation

protocol Runable {
    func run()
}

class BaseballGame: Runable {
    private var significantFigures: Int = 9
    private var randomNumbers: [Int] = []
    private var removedDuplicate: Set<Int> = []
    
    private var strike : Int = 0
    private var ball : Int = 0
    
    func run() {
        createComputerNumber()
        
        let info = "임의의 수 : "
        guard let result = info.input()
        else {
            return
        }
        
    }
    
    private func createComputerNumber() {
        repeat {
            randomNumbers.append(Int.random(in: 1...10))
            removedDuplicate = Set(randomNumbers)
        } while removedDuplicate.count < 3
    }
}
