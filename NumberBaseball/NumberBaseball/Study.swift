//
//  Study.swift
//  NumberBaseball
//
//  Created by EUNJI CHOI on 2024/01/04.
//

import Foundation

var imgPath: [String: String?] = ["star": "/path/star.png", "moon": nil]

if let starPath = imgPath["star"]{
    print("star path : \(starPath)")
} else{
    print("none")
}

if let moonPath = imgPath["moon"]{
    print("star path : \(moonPath)")
} else{
    print("none")
}

optional
