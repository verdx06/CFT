//
//  RegistrationUseCase.swift
//  CFTShift
//
//  Created by Виталий Багаутдинов on 03.07.2025.
//

import Foundation

protocol RegistrationUseCase {
    func saveUser(_ user: UserModel)
    func loadUser() -> UserModel?
    func saveSession()
}

struct RegistrationUseCaseImpl: RegistrationUseCase {
    
    let userRepository: UserRepositoryProtocol
    
    init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }
    
    func saveUser(_ user: UserModel) {
        userRepository.save(user: user)
    }
    
    func loadUser() -> UserModel? {
        userRepository.load()
    }
    
    func saveSession() {
        userRepository.saveSession()
    }
    
}

