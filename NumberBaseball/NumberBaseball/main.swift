//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Edited by Soll & Seunggi
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//var comX = 0, comY = 0, comZ = 0
//var myX, myY, myZ: Int
var count: Int = 9
var userX = 0, userY = 0, userZ = 0


func makeThreeRandomNo() -> [Int] {
    var tempArray = [Int]()
    
    while tempArray.count < 3 {
        let tempNo: Int = Int.random(in: 1...9)
        if !tempArray.contains(tempNo){
            tempArray.append(tempNo)
        }
    }
    let comX = tempArray[0]
    let comY = tempArray[1]
    let comZ = tempArray[2]
    
    return [comX, comY, comZ]
}
let comArray = makeThreeRandomNo()
let userArray = makeThreeRandomNo()
var strike = 0, ball = 0
print(comArray,userArray)

for (indexCom, valueCom) in comArray.enumerated(){
    for (indexUser, valueUser) in userArray.enumerated(){
        if indexCom == indexUser && valueCom == valueUser {
            strike += 1
        }else if valueCom == valueUser {
            ball += 1
        }
    }
}

print(strike, ball)
