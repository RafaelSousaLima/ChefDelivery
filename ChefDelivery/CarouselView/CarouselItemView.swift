//
//  CarouselItemView.swift
//  ChefDelivery
//
//  Created by Rafael Lima on 15/05/25.
//

import SwiftUI

struct CarouselItemView: View {
    
    let order: OrderType
    
    var body: some View {
        Image(order.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    CarouselItemView(order: OrderType(id: 1, name: " ", image: "barbecue-banner"))
}
