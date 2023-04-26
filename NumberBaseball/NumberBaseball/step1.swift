//
//  step1.swift
//  NumberBaseball
//
//  Created by kangkyungmin on 2023/04/26.
//

//let answerNumbers = generateRandomNumber()
//var chance = 9
//
//func checkBallStrikeCount(from answerNumbers: [Int], with matchNumbersOfUser: [Int]) -> (strike: Int, ball: Int) {
//    var ballCount = 0
//    var strikeCount = 0
//
//    for index in 0...2 {
//        if answerNumbers.contains(matchNumbersOfUser[index]) {
//            ballCount += 1
//        }
//
//        if answerNumbers[index] == matchNumbersOfUser[index] {
//            ballCount -= 1
//            strikeCount += 1
//        }
//    }
//
//    return (strikeCount, ballCount)
//}
//
//func generateRandomNumber() -> [Int] {
//    var randomNumbers: Set<Int> = Set<Int>()
//
//    while randomNumbers.count < 3 {
//        randomNumbers.insert(Int.random(in: 1...9))
//    }
//
//    return Array(randomNumbers)
//}
//
//func startBaseballGame() {
//    var isRemainingChance: Bool = true
//
//    while isRemainingChance {
//        chance -= 1
//
//        let randomNumbers = generateRandomNumber()
//        let matchCount = checkBallStrikeCount(from: answerNumbers, with: randomNumbers)
//
//        print("임의의 수 : \(Array(randomNumbers).map { String($0) }.joined(separator: " "))")
//        print("\(matchCount.strike) 스트라이크, \(matchCount.ball) 볼")
//
//        if matchCount.strike == 3 {
//            print("사용자 승리!")
//            isRemainingChance = false
//        } else if chance == 0 {
//            print("컴퓨터 승리...!")
//            isRemainingChance = false
//        } else {
//            print("남은 기회 : \(chance)")
//        }
//    }
//}
//
//startBaseballGame()
