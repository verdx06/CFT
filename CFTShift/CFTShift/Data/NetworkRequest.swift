//
//  NetworkRequest.swift
//  CFTShift
//
//  Created by Виталий Багаутдинов on 03.07.2025.
//

import Foundation
import Alamofire

protocol NetworkRequestProtocol {
    func getData<T:Decodable>() async throws -> [T]
}

final class NetworkRequest: NetworkRequestProtocol {
    
    private let url = "https://fakestoreapi.com/products"
    
    func getData<T: Decodable>() async throws -> [T] {
        let result = try await AF.request(url, method: .get).serializingData().value
        return try JSONDecoder().decode([T].self, from: result)
    }
    
}
