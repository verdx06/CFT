//
//  HomeDI.swift
//  CFTShift
//
//  Created by Виталий Багаутдинов on 03.07.2025.
//

import Foundation

final class RegisterDI {
    
    static func make() -> RegistrationViewModel {
        let userDataStore: UserRepositoryProtocol = UserDataStore()
        let domain: RegistrationUseCase = RegistrationUseCaseImpl(userRepository: userDataStore)
        return RegistrationViewModel(registrationUseCase: domain)
    }
    
    static func makeUseCase() -> RegistrationUseCase {
        let userRepository: UserRepositoryProtocol = UserDataStore()
        return RegistrationUseCaseImpl(userRepository: userRepository)
    }
    
}
