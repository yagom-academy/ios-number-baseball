import Foundation

var remainCount: Int = 9
var randomNumbers: Set<Int> = []

func createRandomNumbers() -> Set<Int> {
	while randomNumbers.count != 3 {
		randomNumbers.insert(Int.random(in: 1...9))
	}	
	return randomNumbers
}


