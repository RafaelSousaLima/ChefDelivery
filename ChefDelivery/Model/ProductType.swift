//
//  ProductType.swift
//  ChefDelivery
//
//  Created by Rafael Lima on 15/05/25.
//

import Foundation

struct ProductType: Identifiable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    
    var formattedPrice: String {
        return "R$ \(price.formatPrice())"
    }
}
