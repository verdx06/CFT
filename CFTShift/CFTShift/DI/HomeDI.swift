//
//  HomeDI.swift
//  CFTShift
//
//  Created by Виталий Багаутдинов on 03.07.2025.
//

import Foundation

final class HomeDI {
    
    static func make() -> HomeUseCase {
        let networkRequest: NetworkRequestProtocol = NetworkRequest()
        let domain: HomeUseCase = HomeUseCaseImpl(network: networkRequest)
        return domain
    }
    
}
