extension Array where Element == Int {
    func isUniqueNumbers() -> Bool {
        let uniqueNumbers = Set(self)
        
        guard uniqueNumbers.count == 3 else {
            return false
        }
        
        return true
    }
    
    func isWithinRange() -> Bool {
        let filteredValues = self.filter { $0 > 0 && $0 < 10 }
        
        guard filteredValues.count == 3 else {
            return false
        }
        
        return true
    }
    
    func isEqual(to targetCount: Int) -> Bool {
        self.count == targetCount
    }
}
