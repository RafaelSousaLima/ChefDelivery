//
//  Double+.swift
//  ChefDelivery
//
//  Created by Rafael Lima on 15/05/25.
//

import Foundation

extension Double {
    func formatPrice() -> String {
        let formattedString = String(format: "%.2f", self)
        return formattedString.replacingOccurrences(of: ".", with: ",")
    }
}
