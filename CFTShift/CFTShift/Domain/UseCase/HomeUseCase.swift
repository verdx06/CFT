//
//  HomeUseCase.swift
//  CFTShift
//
//  Created by Виталий Багаутдинов on 03.07.2025.
//

import Foundation

protocol HomeUseCase {
    func getData() async throws -> [ItemModel]
}

struct HomeUseCaseImpl: HomeUseCase {
    let network: NetworkRequestProtocol
    init(network: NetworkRequestProtocol) {
        self.network = network
    }
    func getData() async throws -> [ItemModel] {
        let result: [ItemModel] = try await network.getData()
        return result
    }
}
