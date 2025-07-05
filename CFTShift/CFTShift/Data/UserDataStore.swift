import Foundation

protocol UserRepositoryProtocol {
    func save(user: UserModel)
    func load() -> UserModel?
    func saveSession()
    func loadSession() -> Bool
}

final class UserDataStore: UserRepositoryProtocol {
    private let userKey = "userModel"
    private let sessionKey = "isLogin"
    
    func save(user: UserModel) {
        if let data = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(data, forKey: userKey)
        }
    }
    
    func load() -> UserModel? {
        guard let data = UserDefaults.standard.data(forKey: userKey) else { return nil }
        return try? JSONDecoder().decode(UserModel.self, from: data)
    }
    
    func saveSession() {
        UserDefaults.standard.set(true, forKey: sessionKey)
    }
    
    func loadSession() -> Bool {
        UserDefaults.standard.bool(forKey: sessionKey)
    }
}
