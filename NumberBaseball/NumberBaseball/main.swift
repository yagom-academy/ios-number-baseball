//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Edited by Soll & Seunggi
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var comX = 0, comY = 0, comZ = 0
var myX, myY, myZ: Int
var count: Int = 9

func makeThreeRandomNo() -> (Int, Int, Int) {
    var tempArray = [Int]()
    
    while tempArray.count < 3 {
        let tempNo: Int = Int.random(in: 1...9)
        if !tempArray.contains(tempNo){
            tempArray.append(tempNo)
        }
    }
    comX = tempArray[0]
    comY = tempArray[1]
    comZ = tempArray[2]
    
    return (comX, comY, comZ)
}
