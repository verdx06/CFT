//
//  HomeViewModel.swift
//  CFTShift
//
//  Created by Виталий Багаутдинов on 03.07.2025.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var data: [ItemModel] = []
    @Published var isLoading: Bool = false
    @Published var isView: Bool = false
    
    let domain: HomeUseCase
    
    init(domain: HomeUseCase = HomeDI.make()) {
        self.domain = domain
    }
    
    func getData() {
        Task {
            do {
                await MainActor.run {
                    self.isLoading = true
                }
                let result = try await domain.getData()
                await MainActor.run {
                    self.isLoading = false
                    self.data = result
                }
            } catch {
                await MainActor.run {
                    self.isLoading = false
                }
                print(error.localizedDescription)
            }
        }
    }
    
    func showPopUp() {
        isView = true
    }
    
}
