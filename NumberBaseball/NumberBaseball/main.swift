//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var com1:Int = 0, com2:Int = 0, com3:Int = 0
var user1:Int = 0, user2:Int = 0, user3:Int = 0
var gameCnt:Int = 0
var strike:Int = 0, ball:Int = 0
var realball:Int = 0


func rand() {
    while(true) {
        com1 = Int.random(in: 1...9)
        com2 = Int.random(in: 1...9)
        com3 = Int.random(in :1...9)
        if (!(user1 == user2 || user2 == user3 || user1 == user3)){
            break;
        }
        while(true){
            user1 = Int.random(in: 1...9)
            user2 = Int.random(in: 1...9)
            user3 = Int.random(in :1...9)
            
            gameCnt += 1;
            
            if (!(user1 == user2 || user2 == user3 || user1 == user3)){
                break;
            }
        }
    }
}

func decide() {
    while (gameCnt == 9){
        
        if(com1 == user1) {
            strike+=1
        }
        if(com2 == user2){
            strike+=1
        }
        if(com3 == user3){
            strike+=1
        }
        if(com1 == user2 || com1 == user3){
            ball+=1
        }
        if(com2 == user1 || com2 == user3){
            ball+=1
        }
        if(com3 == user1 || com3 == user2){
            ball+=1
        }
        if(strike == 3){
            print("3 스트라이크, 프로그램을 종료합니다.")
            break
        }
        else{
            print("\(strike) 스트라이크, \(ball) 볼")
        }
        print("게임 횟수를 모두 차감하셨습니다. 프로그램을 종료합니다.")
        break
    }
    
}






