import Foundation

final class RegistrationViewModel: ObservableObject {
    private let registrationUseCase: RegistrationUseCase
    
    @Published var user: UserModel?
    
    init(registrationUseCase: RegistrationUseCase) {
        self.registrationUseCase = registrationUseCase
        self.user = registrationUseCase.loadUser()
    }
    
    func saveUser(name: String, surname: String) {
        let user = UserModel(name: name, surname: surname)
        registrationUseCase.saveUser(user)
        self.user = user
        saveSession()
    }
    
    func validateAndSaveUser(name: String, surname: String, password: String, confirmPassword: String) -> String? {
        if name.count < 2 {
            return "Имя должно содержать минимум 2 буквы."
        }
        if surname.count < 2 {
            return "Фамилия должна содержать минимум 2 буквы."
        }
        if password.count < 6 {
            return "Пароль должен содержать минимум 6 символов."
        }
        if password.range(of: "[A-Z]", options: .regularExpression) == nil {
            return "Пароль должен содержать хотя бы одну заглавную букву."
        }
        if password != confirmPassword {
            return "Пароли не совпадают."
        }
        
        saveUser(name: name, surname: surname)
        
        return nil
    }
    
    func getUser() {
        let loadedUser = registrationUseCase.loadUser()
        self.user = loadedUser
    }
    
    private func saveSession() {
        registrationUseCase.saveSession()
    }
    
    
}
