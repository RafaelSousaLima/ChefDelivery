//
//  ProductDetailHeaderView.swift
//  ChefDelivery
//
//  Created by Rafael Lima on 19/05/25.
//

import SwiftUI

struct ProductDetailHeaderView: View {
    
    let product: ProductType
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .shadow(radius: 20)
            
            Text(product.name)
                .font(.title)
                .bold()
                .padding(.horizontal)
                .padding(.top)
            
            Text(product.description)
                .padding(.horizontal)
            
            Text(product.formattedPrice)
                .font(.title3)
                .bold()
                .padding(.horizontal)
        }
    }
}

#Preview {
    ProductDetailHeaderView(product: storesMock[0].products[0])
}
