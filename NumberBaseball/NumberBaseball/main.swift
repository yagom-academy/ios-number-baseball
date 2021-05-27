//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Edited by Soll & Seunggi
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

var count: Int = 9

func makeThreeRandomNo() -> [Int] {
    var tempArray = [Int]()
    
    while tempArray.count < 3 {
        let tempNo: Int = Int.random(in: 1...9)
        if !tempArray.contains(tempNo){
            tempArray.append(tempNo)
        }
    }
    return tempArray
}

let comArray = makeThreeRandomNo()
let userArray = makeThreeRandomNo()
var strike = 0, ball = 0
print(comArray,userArray)

func compareComUser(_ com: [Int], _ user: [Int]) {
    for (indexCom, valueCom) in com.enumerated(){
        for (indexUser, valueUser) in user.enumerated(){
            if indexCom == indexUser && valueCom == valueUser {
                strike += 1
            }else if valueCom == valueUser {
                ball += 1
            }
        }
    }
}

compareComUser(comArray, userArray)

print(strike, ball)
