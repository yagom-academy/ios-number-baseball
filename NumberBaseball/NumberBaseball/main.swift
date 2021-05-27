var randomNumbers = makeRandomNum()
var userNumbers = makeRandomNum()
var count : Int = 9


func makeRandomNum() -> [Int] {
    var array = [Int]()
    
    while array.count <= 2 {
        let randomNumber = Int.random(in: 1...9)
        appendUniqueValue(to: &array, randomNumber)
    }

    return array
}

func appendUniqueValue(to: inout [Int],_ value:Int) -> Void {
    let isContain = to.contains(value)
    if isContain == false {
        to.append(value)

    }
}

func compareNumbers() -> String {
    userNumbers = makeRandomNum()
    
    return ""
}

print(randomNumbers)
print(userNumbers)
