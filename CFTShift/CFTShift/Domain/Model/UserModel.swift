import Foundation

struct UserModel: Codable {
    let name: String
    let surname: String
} 

extension UserModel {
    static func empty() -> UserModel {
        return UserModel(name: "", surname: "")
    }
}
