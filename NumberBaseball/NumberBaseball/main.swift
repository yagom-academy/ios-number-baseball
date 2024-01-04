//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class NumberBaseBall {
    var comNumList: Array<String>
    var userNumList: Array<String>
    var repeatTime: Int = 9
    
    init(comNumList: Array<String>, userNumList: Array<String>) {
        self.comNumList = comNumList
        self.userNumList = userNumList
    }
}

let numberBaseball = NumberBaseBall(comNumList: [], userNumList: [])
numberBaseball.execute()
