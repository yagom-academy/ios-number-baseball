import Foundation

    // MARK: - 연락처 데이처 처리 모델


final class manageUserData {
    struct User {
        let name: String
        let age: Int
        let phoneNumber: String

        func userInfo() -> String{
            return "입력한 정보는 \(age)세 \(name)(\(phoneNumber))입니다."
        }
    }

    var userList = [User]()

    func insert(_ input: String? ) -> String {
        
        enum insertError: String {
            case name = "입력한 이름정보가 잘못되었습니다. 입력형식을 확인해주세요."
            case age = "입력한 나이정보가 잘못되었습니다. 입력형식을 확인해주세요."
            case phoneNumber = "입력한 연락처정보가 잘못되었습니다. 입력형식을 확인해주세요."
            case none = "아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요."
            case form = "입력 형식을 확인해주세요."
        }
        
        guard let input = input else { return insertError.form.rawValue }
        
        // form check
        let inputArr = input.split(separator: "/").map({ $0.trimmingCharacters(in: [" "]) })
        if inputArr.count == 0 { return insertError.none.rawValue }
        else if inputArr.count < 3 || inputArr.count > 3 { return insertError.form.rawValue }

        // name check
        let name = inputArr[0].components(separatedBy: [" "]).joined()
        if name.isEmpty { return insertError.name.rawValue }
        
        // age check
        guard let age = Int(inputArr[1]) else { return insertError.age.rawValue }
        if age < 0 || age > 999 { return insertError.age.rawValue }
        
        // phoneNumber check
        let phoneNumber = inputArr[2].components(separatedBy: ["-"])
        if phoneNumber.count != 3 || phoneNumber.joined().count < 9 { return insertError.phoneNumber.rawValue }
        
        let user = User(name: name, age: age, phoneNumber: phoneNumber.joined(separator: "-"))
        self.userList.append(user)
        
        return user.userInfo()
    }
    
    // read userList
    func searchAll() -> String {
        var userListDump = ""
        if !self.userList.isEmpty {
            self.userList.sort { $0.name < $1.name }
            self.userList.forEach {
                userListDump += ("- \($0.name) / \($0.age) / \($0.phoneNumber) \n")
            }
        }
        return userListDump
    }
    
    // search by name
    func search(_ findName: String? ) -> String {
        guard let findName = findName else {
            return "입력없음"
        }

        var findUserListDump = ""
        self.userList.filter { $0.name == findName }.forEach { findUserListDump += "- \($0.name) / \($0.age) / \($0.phoneNumber) \n" }
        
        return findUserListDump == "" ? "연락처에 \(findName) 이/(가) 없습니다." : findUserListDump
    }

}




    // MARK: - 사용자 메뉴 표기, 입력 및 출력


func mainMenu() {
    let userDataManager = manageUserData()

    enum Menu: String {
        case insert = "1"
        case searchAll = "2"
        case search = "3"
        case exit = "x"
    }

    while true {
        print("1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료 ")
        print("메뉴를 선택해 주세요 : ", terminator: "")

        let menuInput = readLine()

        switch menuInput {
        case Menu.insert.rawValue:
            print("연락처 정보를 입력해주세요 : ", terminator: "")

            let input = readLine()
            print(userDataManager.insert(input) + "\n")
        case Menu.searchAll.rawValue:
            print(userDataManager.searchAll())
        case Menu.search.rawValue:
            print("연락처에서 찾을 이름을 입력해주세요 : ", terminator: "")
            
            let input = readLine()
            print(userDataManager.search(input) + "\n")
        case Menu.exit.rawValue:
            print("\n[프로그램 종료]")
            return
        case .none:
            print("입력없음\n")
        default:
            print("선택이 잘못되었습니다. 확인 후 다시 입력해주세요.\n")
        }
    }
}


    // MARK: - 실행

mainMenu()
