extension Array where Element == Int {
	func generateDescription() -> String {
		return self.map { String($0) }.joined(separator: " ")
	}
}
