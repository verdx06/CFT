//
//  ItemModel.swift
//  CFTShift
//
//  Created by Виталий Багаутдинов on 03.07.2025.
//

import Foundation

//[{"id":1,
//"title":"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
//"price":109.95,
//"description":"Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
//"category":"men's clothing",
//"image":"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
//"rating":{
//    "rate":3.9,
//    "count":120}
//}]

struct ItemModel: Decodable, Hashable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
    
    struct Rating: Decodable, Hashable {
        let rate: Double
        let count: Int
    }
    
}

extension ItemModel {
    static func mockItem() -> ItemModel {
        return ItemModel(id: 1, title: "Mens Casual Premium Slim Fit T-Shirts", price: 109.3, description: "", category: "sport", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 3.9, count: 254))
    }
}
